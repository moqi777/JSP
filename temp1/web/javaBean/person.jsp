<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/25
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util" %>
<jsp:useBean id="person" class="Person" scope="request">
<html>
<head>
    <title>JavaBean Test</title>
</head>
<body>
<jsp:setProperty name="person" property="heigth" value="185"></jsp:setProperty>
<jsp:setProperty name="person" property="name" value="sky"></jsp:setProperty>
姓名是：<jsp:getProperty name="person" property="name"/>
身高是：<jsp:getProperty name="person" property="height"/>
</body>
</html>
