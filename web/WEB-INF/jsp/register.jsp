<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <script>
        function checkID(){
            var result = false;
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkID",
                data:{"ID":$("#userID").val()},
                type:"post",
                async:false,
                success:function (data) {
                    var IDCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    var noticeID = document.getElementById("noticeID");

                    if($("#userID").val() == ""){
                        noticeID.innerHTML="信息不能为空";
                        //console.log("用户名不能为空");
                        result = false;
                    } else if(!IDCheck.test($("#userID").val())){
                        noticeID.innerHTML="账户以字母开头，长度在6~12之间，允许字母数字下划线";
                        //console.log("账户以字母开头，长度在6~12之间，允许字母数字下划线");
                        result = false;
                    } else if(data=="exists"){
                        noticeID.innerHTML="账户已存在";
                        //console.log("账户已存在");
                        result = false;
                    } else if(data!="exists"&&IDCheck.test($("#userID").val())&&$("#userID").val() != ""){
                        noticeID.innerHTML="成功";
                        //console.log("成功");
                        result = true;
                    }else {
                        noticeID.innerHTML="未知错误";
                        //console.log("未知错误");
                        result = false;
                    }
                }
            })
            return result;
        }
        function checkNickname() {
            var result = false;
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkNickname",
                data:{"nickname":$("#userNickname").val()},
                type:"post",
                async:false,
                success:function (data) {
                    var nicknameCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    var noticeNickname = document.getElementById("noticeNickname");

                    if($("#userNickname").val() == ""){
                        noticeNickname.innerHTML="昵称不能为空";
                        //console.log("昵称不能为空");
                        result = false;
                    } else if(!nicknameCheck.test($("#userNickname").val())){
                        noticeNickname.innerHTML="昵称以字母开头，长度在6~12之间，允许字母数字下划线";
                        //console.log("昵称以字母开头，长度在6~12之间，允许字母数字下划线");
                        result =false;
                    } else if(data=="exists"){
                        noticeNickname.innerHTML="昵称已存在";
                        //console.log("昵称已存在");
                        result = false;
                    }
                    else if($("#userNickname").val() != "" && nicknameCheck.test($("#userNickname").val())&&data!="exists"){
                        noticeNickname.innerHTML="成功";
                        console.log("成功");
                        result = true;
                    }else {
                        noticeNickname.innerHTML="未知错误";
                        console.log("未知错误");
                        result =false;
                    }
                }
            })
            return result;
        }
        function checkPassword() {
            var passwdCheck = /^[a-zA-Z]\w{5,11}$/;
            var noticePassword = document.getElementById("noticePassword");

            if($("userPassword").val() == ""){
                noticePassword.innerHTML="密码不能为空";
                //console.log("密码不能为空");
                return false;
            } else if(!passwdCheck.test($("#userPassword").val())){
                noticePassword.innerHTML="密码以字母开头，长度在6~12之间，只能包含字母、数字和下划线";
                //console.log("密码以字母开头，长度在6~12之间，只能包含字母、数字和下划线");
                return false;
            } else if($("#userPassword").val() == $("#userID").val()){
                noticePassword.innerHTML="密码和账号不能相同";
                //console.log("密码和账号不能相同");
                return false;
            }
            else {
                noticePassword.innerHTML="成功";
                //console.log("成功");
                return true;
            }
        }
        function checkConfirmPassword(){
            var noticeConfirmPassword = document.getElementById("noticeConfirmPassword");

            if($("#confirmUserPassword").val() == ""){
                noticeConfirmPassword.innerHTML="确认密码不能为空";
                //console.log("确认密码不能为空");
                return false;
            } else if($("#userPassword").val() != $("#confirmUserPassword").val()){
                noticeConfirmPassword.innerHTML="确认密码错误，请重新输入";
                //console.log("确认密码错误，请重新输入");
                return false;
            }
            else {
                noticeConfirmPassword.innerHTML="成功";
                //console.log("成功");
                return true;
            }
        }
        function checkRegister() {
            let id = checkID();
            let nickname = checkNickname();
            let pwd = checkPassword();
            let confrimPWD=checkConfirmPassword();
             if(id&&nickname&&pwd&&confrimPWD){
                 $("#submit").submit();
                 return true;
             }
             else return false;
        }

        function toLogin() {
            window.location.replace("${pageContext.request.contextPath}/user/login");
        }
    </script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
 
        html{
            height: 100%;
        }
 
        body{
            background-image: linear-gradient(to bottom right,rgb(85, 255, 255),rgb(255, 170, 255));
        }
 
        body .login-container{
            width: 600px;
            height: 510px;
            margin: 0 auto;
            margin-top: 10%;
            border-radius: 15px;
            box-shadow: 0 10px 50px 0 rgb(0, 0, 255);
            background-color: rgb(85, 0, 255);
        }
 
        body .login-container .left-container{
            display: inline-block;
            width: 330px;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            padding: 60px;
            background-image: linear-gradient(to bottom right,rgb(85, 85, 255),rgb(0, 85, 255));
        }
 
        body .login-container .left-container .title{
            color: #00ff7f;
            font-size: 18px;
            font-weight: 200;
        }
 
        body .login-container .left-container .title span{
            border-bottom: 3px solid rgb(237,221,22);
        }
 
        body .login-container .left-container .input-container{
            padding: 10px 0;
        }
 
        body .login-container .left-container .input-container input{
            border: 0;
            background: none;
            outline: 0;
            color: #fff;
            margin: 20px 0;
            padding: 5px 0;
            border-bottom: 1px solid rgb(0, 0, 0);
            display: block;
            transition: .2s;
            width: 100%;
        }
 
        body .login-container .left-container .input-container input:hover{
            border-bottom-color: #00ff7f;
        }
 
        body .login-container .left-container .message-container{
            font-size: 14px;
            color:  rgb(199, 191, 219);
            transition: .2s;
            cursor: pointer;
        }
 
        body .login-container .left-container .message-container:hover{
            color: #00ff7f;
        }
 
        ::-webkit-input-placeholder{
            color: rgb(199, 191,219);
        }
 
        body .login-container .right-container{
            width: 145px;
            display: inline-block;
            height: calc(100% - 120px);
            height: 100%;
            vertical-align: top;
            padding: 60px 0;
        }
 
        body .login-container .right-container .regist-container{
            text-align: center;
            color: #00ff7f;
            font-size: 18px;
            font-weight: 200;
        }
 
        body .login-container .right-container .regist-container span{
            border-bottom: 3px solid rgb(237,221,22);
        
        }
 
        body .login-container .right-container .action-container{
            font-size: 10px;
            color: #00ff7f;
            height: 70%;
            position: relative;
        }
        body .login-container .right-container .action-container span{
            border: 1px solid rgb(237,221,22);
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
 
        body .login-container .right-container .action-container span:hover{
            background-color: rgb(237, 221, 22);
            color: rgb(95,76,194);
        }
 
    </style>
</head>
<body>
    <div class="login-container">
        <div class="left-container">
            <div class="title"><span>注册</span></div>
            <div class="input-container">
                <form id="submit" action="${pageContext.request.contextPath}/user/toRegister"  method="POST">
                    <input name="userID" id="userID" onblur="checkID()" placeholder="昵称">
                    <p id="noticeID"></p>
                    <input name="userNickname" id="userNickname" onblur="checkNickname()" placeholder="用户名">
                    <p id="noticeNickname"></p>
                    <input name="userPassword"id="userPassword" onblur="checkPassword()" placeholder="密码">
                    <p id="noticePassword"></p>
                    <input name="confirmUserPassword" id="confirmUserPassword" onblur="checkConfirmPassword()" placeholder="确认密码">
                    <p id="noticeConfirmPassword"></p>
                </form>
            </div>
        </div>
        <div class="right-container">
            <div class="regist-container">
                <span class="regist" onclick="toLogin()">登陆</span>
            </div>
            <div class="action-container">
                <span onclick="return checkRegister()">提交</span>
            </div>
        </div>
    </div>
</body>
