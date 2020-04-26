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
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkID",
                data:{"ID":$("#userID").val()},
                success:function (data) {
                    var IDCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    console.log(data);
                    if($("#userID").val() == ""){
                        console.log("用户名不能为空");
                    } else if(!IDCheck.test($("#userID").val())){
                        console.log("账户以字母开头，长度在6~12之间，允许字母数字下划线");
                    } else if(data=="exists"){
                        console.log("账户已存在");
                    }
                    else console.log("成功");
                }
            })
        }
        function checkNickname() {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkNickname",
                data:{"nickname":$("#userNickname").val()},
                success:function (data) {
                    var nicknameCheck = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/;
                    console.log(data);
                    if($("#userNickname").val() == ""){
                        console.log("昵称不能为空");
                    } else if(!nicknameCheck.test($("#userNickname").val())){
                        console.log("昵称以字母开头，长度在6~12之间，允许字母数字下划线");
                    } else if(data=="exists"){
                        console.log("昵称已存在");
                    }
                    else console.log("成功");
                }
            })
        }
        function checkPassword() {
            var passwdCheck = /^[a-zA-Z]\w{5,11}$/;
            if($("userPassword").val() == ""){
                console.log("密码不能为空");
            } else if(!passwdCheck.test($("#userPassword").val())){
                console.log("密码以字母开头，长度在6~12之间，只能包含字母、数字和下划线");
            } else if($("#userPassword").val() == $("#userID").val()){
                console.log("密码和账号不能相同");
            }
            else console.log("成功");
        }
        function checkConfirmPassword(){
            if($("#confirmUserPassword").val() == ""){
                console.log("确认密码不能为空");
            } else if($("#userPassword").val() == $("#confirmUserPassword").val()){
                console.log("确认密码错误，请重新输入");
            }
            else console.log("成功");
        }
    </script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/user/toRegister" method="POST">
        账户：<input name="userID" id="userID" onblur="checkID()"><br>
        昵称：<input name="userNickname" id="userNickname" onblur="checkNickname()"><br>
        密码: <input name="userPassword"id="userPassword" onblur="checkPassword()"><br>
        确认密码：<input name="confirmUserPassword" id="confirmUserPassword" onblur="checkConfirmPassword()"><br>
        <button type="submit">提交</button>
    </form>
</body>
</html>
