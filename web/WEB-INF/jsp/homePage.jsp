<%--
  Created by IntelliJ IDEA.
  User: lzt11
  Date: 2020/4/23
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String ID= (String) session.getAttribute("ID");
        String PWD= (String) session.getAttribute("PWD");
        out.print(ID+"<br>"+PWD+"<br>");
    %>
</body>
</html>
