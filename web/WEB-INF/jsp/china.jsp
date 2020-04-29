<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Title</title>

</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>中国SARS人数</small>
                    </h1>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>地区</th>
                        <th>确诊人数</th>
                        <th>死亡人数</th>
                        <th>重症患者</th>
                        <th>病危患者</th>
                        <th>康复人数</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sars" items="${list}">
                        <tr>
                            <td>${sars.mainland}</td>
                            <td>${sars.cases}</td>
                            <td>${sars.deaths}</td>
                            <td>${sars.serious}</td>
                            <td>${sars.critical}</td>
                            <td>${sars.recovered}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>