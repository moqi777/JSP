<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/4/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库驱动连接</title>
</head>
<body>
<%
    Connection con;
    Statement sql;
    ResultSet rs;

    try {
        //加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        //获取数据库连接
        String url = "jdbc:mysql://localhost:3306/jsp?characterEncoding=utf8&useUnicode=true";
        String user = "root";
        String password = "kaipule452b.";

        con = DriverManager.getConnection(url,user,password);

        sql = con.createStatement();
        rs = sql.executeQuery("select * from jsp_student"); 

        out.print("<table border=1>");
        out.print("<tr>");
            out.print("<th width=100>"+"id");
            out.print("<th width=100>"+"name");
            out.print("<th width=100>"+"sex");
            out.print("<th width=100>"+"birth");
            out.print("<th width=100>"+"department");
            out.print("<th width=100>"+"address");
            out.print("<th width=100>"+"height");
            out.print("<th width=100>"+"nianji");
        out.print("</tr>");
        while (rs.next()){
            out.print("<tr>");
                out.print("<td>"+rs.getInt("id")+"</td>");
                out.print("<td>"+rs.getString("name")+"</td>");
                out.print("<td>"+rs.getString("sex")+"</td>");
                out.print("<td>"+rs.getDate("birth")+"</td>");
                out.print("<td>"+rs.getString("department")+"</td>");
                out.print("<td>"+rs.getString("address")+"</td>");
                out.print("<td>"+rs.getInt("height")+"</td>");
                out.print("<td>"+rs.getString("nianji")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        con.close();
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
