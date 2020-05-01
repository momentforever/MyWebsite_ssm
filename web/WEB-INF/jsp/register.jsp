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
                 return true;
             }
             else return false;
        }
    </script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/user/toRegister" method="POST">
        账户：<input name="userID" id="userID" onblur="checkID()"><br>
        <p id="noticeID"></p><br>
        昵称：<input name="userNickname" id="userNickname" onblur="checkNickname()"><br>
        <p id="noticeNickname"></p><br>
        密码: <input name="userPassword"id="userPassword" onblur="checkPassword()"><br>
        <p id="noticePassword"></p><br>
        确认密码：<input name="confirmUserPassword" id="confirmUserPassword" onblur="checkConfirmPassword()"><br>
        <p id="noticeConfirmPassword"></p><br>
        <button type="submit" onclick="return checkRegister()">提交</button>
    </form>
</body>
</html>
