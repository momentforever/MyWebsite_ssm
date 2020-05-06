<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lzt11
  Date: 2020/5/6
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>

    <title>Title</title>
</head>
<body>
<div class="nofloat">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>修改</small>
                    </h1>
                </div>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/sars/toupdatechina" method="post">
        <div class="form-group">
            <label>地区: </label>
            <input type="text" name="mainland" class="form-control" value="${sars.mainland}" readonly="readonly" required>
        </div>
        <div class="form-group">
            <label>确诊人数: </label>
            <input type="text" name="cases" class="form-control" value="${sars.cases}" required>
        </div>
        <div class="form-group">
            <label>死亡人数: </label>
            <input type="text" name="deaths" class="form-control" value="${sars.deaths}" required>
        </div>
        <div class="form-group">
            <label>重症患者: </label>
            <input type="text" name="serious" class="form-control" value="${sars.serious}" required>
        </div>
        <div class="form-group">
            <label>病危患者: </label>
            <input type="text" name="critical" class="form-control" value="${sars.critical}" required>
        </div>
        <div class="form-group">
            <label>康复人数: </label>
            <input type="text" name="recovered" class="form-control" value="${sars.recovered}" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改">
        </div>
    </form>
</div>
</body>
</html>

