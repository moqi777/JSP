<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/29
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/output" method="post">
    <input type="submit" value="生成">
</form>
<%=request.getParameter("numb")!=null?request.getParameter("numb"):""%>
</body>
</html>
