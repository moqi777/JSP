package com.jqe.IO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.filefilter.SuffixFileFilter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author:zhengyilong
 * @email:1797344574@qq.com
 * @phone:13479394730
 * @desc:
 * @DateTime:2024/4/12 17:20
 **/
@WebServlet("/upload")
public class FileUpload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        //创建一个DiskFileItemFactory工厂对象
        DiskFileItemFactory df = new DiskFileItemFactory();
        //设置一个文件保存的目录
        File fileDir = new File(this.getServletContext().getRealPath("/img"));
        //判断文件夹是否存在
        if (!fileDir.exists()){
            //不存在则创建文件夹
            fileDir.mkdirs();
        }
        //设置文件的临时保存目录
        df.setRepository(fileDir);

        //文件上传的类
        ServletFileUpload servletFileUpload = new ServletFileUpload(df);
        //设置编码
        servletFileUpload.setHeaderEncoding("utf-8");

        //处理req对象，获取表中的数据
        List<FileItem> fileItemList;
        try {
            //parseRequest解析req请求中的数据
            fileItemList = servletFileUpload.parseRequest(req);
            //遍历
            for (FileItem fileItem:fileItemList){
                //判断是否为普通字段
                if (fileItem.isFormField()){
                    resp.getWriter().print(fileItem.getFieldName()+":"+fileItem.getString("utf-8")+"<br>");
                }else {
                    //不是 那就是文件类型的字段
                    //文件名
                    String name = fileItem.getName();
                    //lastIndexOf(str)最后一次出现str的下标
                    //substring(i)截取字符串
                    //+1是为了去除//
                    name = fileDir + "\\" + name.substring(name.lastIndexOf("\\")+1);

                    //临时文件
                    File file = new File(name);

                    //数组    限制上传的文件类型
                    String[] str = new String[]{".exe",".bat"};
                    //限制文件大小    2m
                    long maxSize = 2*1024*1024;
                    //accept    可以对文件的类型进行筛选
                    SuffixFileFilter suffixFileFilter = new SuffixFileFilter(str);

                    if (suffixFileFilter.accept(file)){
                        resp.getWriter().print("禁止以.exe、,bat结尾的文件上传<br>");
                    }else if(fileItem.getSize() > maxSize){
                        resp.getWriter().print("文件大小超过2M，禁止上传<br>");
                    }else {
                        InputStream inputStream = fileItem.getInputStream();
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
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}

