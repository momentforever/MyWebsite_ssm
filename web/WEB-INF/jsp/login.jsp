<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        html {
            height: 100%;
        }

        body {
            background-image: linear-gradient(to bottom right, rgb(114, 135, 254), rgb(130, 88, 186));
        }

        body .login-container {
            width: 600px;
            height: 315px;
            margin: 0 auto;
            margin-top: 20%;
            border-radius: 15px;
            box-shadow: 0 10px 50px 0 rgb(59, 45, 159);
            background-color: rgb(95, 76, 194);
        }

        body .login-container .left-container {
            display: inline-block;
            width: 330px;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            padding: 60px;
            background-image: linear-gradient(to bottom right, rgb(118, 76, 163), rgb(92, 103, 211));
        }

        body .login-container .left-container .title {
            color: #fff;
            font-size: 18px;
            font-weight: 200;
        }

        body .login-container .left-container .title span {
            border-bottom: 3px solid rgb(237, 221, 22);
        }

        body .login-container .left-container .input-container {
            padding: 10px 0;
        }

        body .login-container .left-container .input-container input {
            border: 0;
            background: none;
            outline: 0;
            color: #fff;
            margin: 20px 0;
            padding: 5px 0;
            border-bottom: 1px solid rgb(199, 191, 219);
            display: block;
            transition: .2s;
            width: 100%;
        }

        body .login-container .left-container .input-container input:hover {
            border-bottom-color: #fff;
        }

        body .login-container .left-container .message-container {
            font-size: 14px;
            color: rgb(199, 191, 219);
            transition: .2s;
            cursor: pointer;
        }

        body .login-container .left-container .message-container:hover {
            color: #fff;
        }

        ::-webkit-input-placeholder {
            color: rgb(199, 191, 219);
        }

        body .login-container .right-container {
            width: 145px;
            display: inline-block;
            height: calc(100% - 120px);
            height: 100%;
            vertical-align: top;
            padding: 60px 0;
        }

        body .login-container .right-container .regist-container {
            text-align: center;
            color: #fff;
            font-size: 18px;
            font-weight: 200;
        }

        body .login-container .right-container .regist-container span {
            border-bottom: 3px solid rgb(237, 221, 22);

        }

        body .login-container .right-container .action-container {
            font-size: 10px;
            color: #fff;
            height: 70%;
            position: relative;
        }

        body .login-container .right-container .action-container span {
            border: 1px solid rgb(237, 221, 22);
            padding: 10px;
            display: inline-block;
            line-height: 25px;
            border-radius: 25px;
            position: absolute;
            bottom: 10px;
            left: calc(72px - 25px);
            transition: .2s;
            cursor: pointer;
        }

        body .login-container .right-container .action-container span:hover {
            background-color: rgb(237, 221, 22);
            color: rgb(95, 76, 194);
        }

    </style>
    <script>
        function checkLogin() {
            var result = false;
            $.ajax({
                url: "${pageContext.request.contextPath}/user/checkLogin",
                type: "post",
                async: false,
                data: {"ID": $("#userID").val(), "Password": $("#userPassword").val()},
                success: function (data) {
                    var IDCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    var passwdCheck = /^[a-zA-Z]\w{5,11}$/;
                    var notice = document.getElementById("notice");

                    if ($("#userID").val() == "" || $("#userPassword").val() == "") {
                        notice.innerHTML = "信息不能为空";
                        //console.log("信息不能为空");
                        result = false;
                    } else if (!passwdCheck.test($("#userPassword").val()) || !IDCheck.test($("#userID").val())) {
                        notice.innerHTML = "无效信息";
                        //console.log("无效信息");
                        result = false;
                    } else if (data == "notExists") {
                        notice.innerHTML = "无效信息";
                        //console.log("账户不存在");
                        result = false;
                    } else if (data == "informationError") {
                        notice.innerHTML = "账户或密码错误";
                        //console.log("账户或密码错误");
                        result = false;
                    } else if ($("#userID").val() != ""
                        && $("#userPassword").val() != ""
                        && passwdCheck.test($("#userPassword").val())
                        && IDCheck.test($("#userID").val())
                        && data != "notExists"
                        && data != "informationError") {
                        notice.innerHTML = "成功";
                        //console.log("成功");
                        result = true;
                    } else {
                        notice.innerHTML = "未知错误";
                        //console.log("未知错误");
                        result = false;
                    }

                }
            })
            //调试用
            //return false;
            if (result == false)
                return false;
            else {
                $("#submit").submit();
            }
        }

        function toRegister() {
            window.location.replace("${pageContext.request.contextPath}/user/register");
        }

    </script>
</head>
<body>
<div class="login-container">
        <div class="left-container">
            <div class="title"><span>登录</span></div>
            <div class="input-container">
                <form action="${pageContext.request.contextPath}/user/toLogin" id="submit">
                    <input type="text" name="userID" id="userID" placeholder="用户名">
                    <input type="password" name="userPassword" id="userPassword" placeholder="密码">
                    <p id="notice">&nbsp</p>
                </form>
            </div>
        </div>

        <div class="right-container">
            <div class="regist-container">
                <span onclick="toRegister()" class="regist">注册</span>
            </div>
            <div class="action-container">
                <span onclick="checkLogin()">提交</span>
            </div>
        </div>
</div>
</body>
