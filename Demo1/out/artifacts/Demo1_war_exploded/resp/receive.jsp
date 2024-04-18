<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/18
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String sendname = request.getParameter("sendname");
        String password = request.getParameter("password");
//        String sendname = request.getHeader("sendname");
//        String password = request.getHeader("password");
        if (sendname.equals("")||password.equals("")){
            response.sendRedirect("index.jsp");
        }
    %>
    <%=sendname%>
    <font size="5">欢迎回来</font>
</body>
</html>
