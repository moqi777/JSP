<%--
  Created by IntelliJ IDEA.
  User: 86134
  Date: 2024/3/6
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <script language="JavaScript">
        var today = new Date();
        var day = today.getDate();  //获取日期
        var month = today.getDate();      //获取月份（月份在js里是从0开始的）
        var year = today.getFullYear(); //获取年份
        var week = today.getDate();     //获取星期几
        var vw = new Array("星期天","星期一","星期二","星期三","星期四","星期五","星期六");
        document.write("今天是"+year+"年"+month+"月"+day+"日"+vw[week]);

    </script>
</body>
</html>
