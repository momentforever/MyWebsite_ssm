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

                    if($("#userID").val() == ""||$("#userPassword").val()==""){
                        console.log("信息不能为空");
                        result=false;
                    }else if(!passwdCheck.test($("#userPassword").val()) || !IDCheck.test($("#userID").val())){
                        console.log("无效信息");
                        result=false;
                    }
                    else if(data=="notExists"){
                        console.log("账户不存在");
                        result=false;
                    }else if(data=="informationError"){
                        console.log("账户或密码错误");
                        result=false;
                    }else if($("#userID").val() != ""
                        &&$("#userPassword").val()!=""
                        &&passwdCheck.test($("#userPassword").val())
                        &&IDCheck.test($("#userID").val())
                        &&data!="notExists"
                        &&data!="informationError"){
                        console.log("成功");
                        result=true;
                    }else {
                        console.log("未知错误");
                        result=false;
                    }

                    console.log(data);
                }
            })

            return result;
        }
    </script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/user/toLogin" method="POST">
        账户：<input name="userID" id="userID"><br>
        密码: <input name="userPassword"id="userPassword"><br>
        <button type="submit" onclick="return checkLogin()">提交</button>
    </form>
</body>
</html>
