<%@page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>����Բ���ܳ������</title>
</head>
<body>
������Բ�İ뾶��<br/>
<form action="" method="get" name="form">
<input type="text" name="rad">
<input type="submit" name="submit" value="��ʼ����"></form>
<!-- ���������ܳ�������ķ��� -->
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
<!-- ��ȡ�����������ֵ -->
 <%
String str = request.getParameter("rad");
    if(str!=null){                      
        try{
           double r;
           r = Double.parseDouble(str);   
 %>
<!-- ��Բ���ܳ��������� -->
   Բ���ܳ��ǣ�<%=perimeter(r)%><br/>           
   Բ������ǣ�<%=area(r)%><br/>
   Բ������ǣ�<%=volume(r)%><%
			   }
     catch(Exception e){                       
               out.print(e.getMessage());        
         }}%>   
</body>
</html>