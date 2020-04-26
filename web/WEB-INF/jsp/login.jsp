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
    <form action="${pageContext.request.contextPath}/user/toLogin" method="POST">

        账户：<input name="ID"><br>
        密码: <input name="Password"><br>
        <button type="submit">提交</button>
    </form>
</body>
</html>
