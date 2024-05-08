<%@ page import="com.jqe.Resume" %><%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/5/8
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
      <h1>简历填写界面</h1>
      <%
        Resume resume = (Resume) request.getAttribute("resume");
        if (resume==null){
      %>
      <form action="/receiveServlet" method="post">
        姓名：<input type="text" name="name"><br><br>
        性别：<input type="radio" name="gen" value="男">男 <input type="radio" name="gen" value="女">女 <br><br>
        出生日期：<input type="date" name="birthday"><br><br>
        联系电话：<input type="text" name="phone"><br><br>
        电子邮件：<input type="text" name="mail"><br><br>
        居住地址：<input type="text" name="address"><br><br>
        教育背景：<textarea name="school" cols="30" rows="5"></textarea><br><br>
        工作经验：<textarea name="work" cols="30" rows="5"></textarea><br><br>
        技能特长：<textarea name="skill" cols="30" rows="5"></textarea><br><br>
        <button type="submit">提交简历</button>
      </form>
      <%
        }else {
      %>
      姓名：<%=resume.getName()%><br><br>
      性别：<%=resume.getGen()%> <br><br>
      出生日期：<%=resume.getBirthday()%><br><br>
      联系电话：<%=resume.getPhone()%><br><br>
      电子邮件：<%=resume.getMail()%><br><br>
      居住地址：<%=resume.getAddress()%><br><br>
      教育背景：<%=resume.getSchool()%><br><br>
      工作经验：<%=resume.getWork()%><br><br>
      技能特长：<%=resume.getSkill()%><br><br>
      <h1>简历提交成功</h1>
      <button type="button" onclick="window.location.href='index.jsp'">重新提交简历</button>
      <%
        }
      %>
  </body>
</html>
