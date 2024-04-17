<%@page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>计算圆的周长和面积</title>
</head>
<body>
请输入圆的半径：<br/>
<form action="" method="get" name="form">
<input type="text" name="rad">
<input type="submit" name="submit" value="开始计算"></form>
<!-- 声明计算周长和面积的方法 -->
<%! double perimeter(double r){
     return Math.PI*2*r;
  }
    double area(double r){
     return Math.PI*r*r;
  }
  double volume(double r){
    return Math.PI*(4/3)*r*r*r;
  }
%>
<!-- 获取表单中输入的数值 -->
 <%
String str = request.getParameter("rad");
    if(str!=null){                      
        try{
           double r;
           r = Double.parseDouble(str);   
 %>
<!-- 将圆的周长和面积输出 -->
   圆的周长是：<%=perimeter(r)%><br/>           
   圆的面积是：<%=area(r)%><br/>
   圆的体积是：<%=volume(r)%><%
			   }
     catch(Exception e){                       
               out.print(e.getMessage());        
         }}%>   
</body>
</html>