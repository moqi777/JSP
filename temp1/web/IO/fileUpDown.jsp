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
    <title>文件上传下载</title>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
    用户名：<input type="text" name="username"><br>
    头像：<input type="file" name="pic1"><br>
    <input type="submit" value="提交">
</form>
<a href="/download">文件下载</a>
</body>
</html>
