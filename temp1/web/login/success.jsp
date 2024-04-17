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
    <title>success</title>
</head>
<body>
    登录成功
    <br>
    <font size="5" color="red">欢迎你，</font>
    <font size="5" color="red"><%=request.getParameter("user")%></font>
    <br>
    <font size="5" color="red">让我们一起来探讨JSP的世界</font>
</body>
</html>
