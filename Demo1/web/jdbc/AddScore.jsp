<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
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
    <form action="#" method="get">
        <table>
            输入学生学号：<br>
            <input type="text" name="stu_id">
            <br>
            输入专业名：<br>
            <input type="text" name="c_name">
            <br>
            输入学生成绩：<br>
            <input type="text" name="grade">
            <br>
            <input type="submit" value="添加">
        </table>
    </form>
    <%
        String id = request.getParameter("stu_id");
        String name = request.getParameter("c_name");
        String scoreStr = request.getParameter("grade");
        if (id==null||id.equals("")||name==null||name.equals("")||scoreStr==null||scoreStr.equals("")){
            out.print("请输入数据，并保证数据正确");
            return;
        }
        int stu_id = Integer.parseInt(id);
        int grade = Integer.parseInt(scoreStr);
        Connection conn = null;
        try {
            //加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            //获取数据库连接
            String url = "jdbc:mysql://localhost:3306/jsp?serverTimezone=UTC&characterEncoding=utf8&useUnicode=true";
            String user = "root";
            String password = "kaipule452b.";

            conn = DriverManager.getConnection(url,user,password);

            PreparedStatement psmtInsert = conn.prepareStatement("insert into score values(?,?,?)");
            psmtInsert.setInt(1,stu_id);
            psmtInsert.setString(2,name);
            psmtInsert.setInt(3,grade);
            int num = psmtInsert.executeUpdate();
            if (num>0){
                out.println("添加成功");
            }else {
                out.println("添加失败");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
    <form action="Select.jsp" method="get">
        <table>
            请输入学生学号查询成绩:
            <br>
            <input type="text" name="selectid">
            <br>
            <input type="submit" value="查询">
        </table>
    </form>
</body>
</html>
