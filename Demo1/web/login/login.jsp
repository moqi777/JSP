<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/15
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <form action="checklogin.jsp" method="get">
        <table>
            输入用户名：<br>
            <input type="text" name="name" value="<%=request.getParameter("user")%>"> <br>
            输入密码：
            <br>
            <input type="password" name="password">
            <br>
            <input type="submit" value="login">
        </table>
    </form>
</body>
</html>
