<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/4/10
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
<%--    将项目目录下的A.txt文件内容复制到B.txt--%>
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    try {
        FileReader fileReader = new FileReader("D:/JAVA/IDEA代码/JSP/A.txt");
        BufferedReader bufferedReader = new BufferedReader(fileReader);

        File file = new File("D:/JAVA/IDEA代码/JSP/B.txt");
        if (file.exists()){
            file.createNewFile();
        }

        FileWriter fileWriter = new FileWriter(file);
        BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

        String str = null;
        while ((str=bufferedReader.readLine())!=null){
            bufferedWriter.write(str);
            bufferedWriter.newLine();
            bufferedWriter.flush();
        }

        bufferedWriter.close();
        bufferedReader.close();
    }catch (FileNotFoundException e){
        e.printStackTrace();
    }catch (IOException e){
        e.printStackTrace();
    }
%>
</body>
</html>
