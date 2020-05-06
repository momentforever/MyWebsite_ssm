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
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <script>
        function checkLogin() {
            var result=false;
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkLogin",
                type:"post",
                async:false,
                data:{"ID":$("#userID").val(),"Password":$("#userPassword").val()},
                success:function (data) {
                    var IDCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    var passwdCheck = /^[a-zA-Z]\w{5,11}$/;
                    var notice = document.getElementById("notice");

                    if($("#userID").val() == ""||$("#userPassword").val()==""){
                        notice.innerHTML="信息不能为空";
                        //console.log("信息不能为空");
                        result=false;
                    }else if(!passwdCheck.test($("#userPassword").val()) || !IDCheck.test($("#userID").val())){
                        notice.innerHTML="无效信息";
                        //console.log("无效信息");
                        result=false;
                    }
                    else if(data=="notExists"){
                        notice.innerHTML="无效信息";
                        //console.log("账户不存在");
                        result=false;
                    }else if(data=="informationError"){
                        notice.innerHTML="账户或密码错误";
                        //console.log("账户或密码错误");
                        result=false;
                    }else if($("#userID").val() != ""
                        &&$("#userPassword").val()!=""
                        &&passwdCheck.test($("#userPassword").val())
                        &&IDCheck.test($("#userID").val())
                        &&data!="notExists"
                        &&data!="informationError"){
                        notice.innerHTML="成功";
                        //console.log("成功");
                        result=true;
                    }else {
                        notice.innerHTML="未知错误";
                        //console.log("未知错误");
                        result=false;
                    }

                }
            })
            //调试用
            //return false;
            return result;
        }
    </script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/user/toLogin" method="POST">
        账户：<input name="userID" id="userID"><br>
        密码: <input name="userPassword"id="userPassword"><br>
        <p id="notice">显示信息</p>
        <button type="submit" onclick="return checkLogin()">提交</button>
    </form>
</body>
</html>
