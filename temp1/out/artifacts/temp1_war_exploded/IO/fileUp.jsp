<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.RequestContext" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileUploadException" %>
<%@ page import="org.apache.commons.io.filefilter.SuffixFileFilter" %><%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/4/12
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<%
    //创建一个DiskFileItemFactouy对象
    DiskFileItemFactory df = new DiskFileItemFactory();
    //设置一个文件保存的目录
    File fileDir = new File("D:/JAVA/IDEA代码/JSP");
    //文件夹是否存在
    if (!fileDir.exists()){
        //不存在则新建文件夹
        fileDir.mkdirs();
    }
    //设置文件的临时保存目录
    df.setRepository(fileDir);

    //文件上传的类
    ServletFileUpload servletFileUpload = new ServletFileUpload(df);
    //设置编码
    servletFileUpload.setHeaderEncoding("utf-8");

    //处理req对象，获取表单中的数据
    List<FileItem> fileItemList;
    try {
        //parseRequest解析req请求中的数据
        fileItemList = servletFileUpload.parseRequest((RequestContext) request);
        //遍历
        for (FileItem fileItem : fileItemList) {
            //判断是否为普通表单字段
            if (fileItem.isFormField()){
                response.getWriter().print(fileItem.getFieldName()+"："+fileItem.getString("utf-8")+"<br>");
            }else {
                //不是  那就是文件类型的字段
                //文件名
                String name = fileItem.getName();
                name = fileDir +"\\"+ name.substring(name.lastIndexOf("\\") + 1);

                //产生UUID
                //String string = UUID.randomUUID().toString();
                //临时文件
                File file = new File(name);

                //数组    限制上传的文件类型
                String[] str = new String[]{".exe",".bat"};
                //限制文件大小    2 m
                long maxSize = 2*1024*1204;
                //accept()  可以对文件的类型进行筛选
                SuffixFileFilter suffixFileFilter = new SuffixFileFilter(str);

                if (suffixFileFilter.accept(file)){
                    response.getWriter().print("禁止以.exe、.bat结尾的文件上传<br>");
                }else if (fileItem.getSize() > maxSize){
                    response.getWriter().print("文件大小超过2M，禁止上传<br>");
                }else {
                    //输入流
                    InputStream inputStream = fileItem.getInputStream();
                    //输出流
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    //缓冲数组
                    byte[] buffer = new byte[1024];
                    //存储每次读取的长度
                    int len;
                    //循环读取  判断是否读取结束
                    while ((len = inputStream.read(buffer)) > 0){
                        //文件输出
                        fileOutputStream.write(buffer,0,len);
                    }

                    //释放资源
                    inputStream.close();
                    fileOutputStream.close();
                }

                fileItem.delete();

            }
        }
    } catch (FileUploadException e) {
        e.printStackTrace();
    }
%>
<body>
<form action="#" method="post" enctype="multipart/form-data">
    <input type="File" name="im">
    <input type="submit" value="开始上传">
</form>
</body>
</html>
