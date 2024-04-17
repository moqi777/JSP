<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/18
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="index.jsp" method="post">
        姓名：<input type="text" name="name"><br>
        密码：<input type="password" name="password"><br>
        <input type="submit" value="login">
    </form>
    <%
        String name = request.getParameter("name");
        String password = request.getParameter("password");
//        response.addHeader("sendname",name);
//        response.addHeader("password",password);
        if (name!=null&&password!=null){
            response.sendRedirect("receive.jsp?sendname="+name+"&password="+password);
            //response.sendRedirect("receive.jsp");
        }
    %>
</body>
</html>
