<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/4/1
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>只有用户名和密码正确且是post请求才跳转到欢饮界面，否者仍然是登录界面，使用重定向</title>
</head>
<body>
<form action="/loginServlet" method="post">
    用户名：<input type="text" name="name"><br>
    密码<input type="password" name="password"><br>
    <input type="submit" value="登录">
</form>
<%
if (request.getParameter("trem").equals("0")){
    response.getWriter().print("登录失败");
}
%>
</body>
</html>
