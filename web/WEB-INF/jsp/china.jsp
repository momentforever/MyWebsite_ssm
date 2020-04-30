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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>

    <title>Title</title>


</head>
<body>

    <div class="chart-container" style="position: relative; height:60vh; width:60vw">
        <canvas id="myChart"></canvas>
    </div>
    <script>
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'radar',
            data: {
                labels: ["确诊人数", "死亡人数", "重症患者", "病危患者", "康复人数"],
                datasets: [{
                    label: ${list}[0].mainland,
                    data: [${list}[0].cases, ${list}[0].deaths, ${list}[0].serious, ${list}[0].critical, ${list}[0].recovered],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)'
                    ],
                    borderWidth: 1
                }, {
                    label: ${list}[1].mainland,
                    data: [${list}[1].cases, ${list}[1].deaths, ${list}[1].serious, ${list}[1].critical, ${list}[1].recovered],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }, {
                    label: ${list}[2].mainland,
                    data: [${list}[2].cases, ${list}[2].deaths, ${list}[2].serious, ${list}[2].critical, ${list}[2].recovered],
                    backgroundColor: [
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
        });

        //console.log(${list});         //控制台返回  Object
    </script>
    <div class="nofloat">
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
                    <c:forEach var="i" items="${listjava}">
                        <tr>
                            <td>${i.mainland}</td>
                            <td>${i.cases}</td>
                            <td>${i.deaths}</td>
                            <td>${i.serious}</td>
                            <td>${i.critical}</td>
                            <td>${i.recovered}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>