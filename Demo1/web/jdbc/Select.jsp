<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/4/24
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("selectid");
    int stuId = Integer.parseInt(id);
    Connection conn = null;
    try {
        //加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        //获取数据库连接
        String url = "jdbc:mysql://localhost:3306/jsp?characterEncoding=utf8&useUnicode=true";
        String user = "root";
        String password = "kaipule452b.";

        conn = DriverManager.getConnection(url,user,password);
        PreparedStatement preparedStatement = conn.prepareStatement("select * from score where stuNum = ?");
        preparedStatement.setInt(1,stuId);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int stuNum = resultSet.getInt("stuNum");
            String majorName = resultSet.getString("majorName");
            int score = resultSet.getInt("score");
            out.println("学号："+stuNum);
            out.println("专业："+majorName);
            out.println("成绩："+score);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
