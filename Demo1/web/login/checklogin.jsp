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
    <title>checklogin</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        request.setCharacterEncoding("UTF-8");//防止乱码
        if(name.equals("郑伊龙")&&password.equals("123")){
    %>
    <jsp:forward page="success.jsp">
        <jsp:param name="user" value="<%=name%>"/>
    </jsp:forward>
    <%
        }else {
    %>
    <jsp:forward page="login.jsp">
        <jsp:param name="user" value="<%=name%>"/>
    </jsp:forward>
    <%
        }
    %>
</body>
</html>
