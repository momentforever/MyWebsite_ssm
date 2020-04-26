package com.tmfhome.controller;

import com.tmfhome.pojo.Users;
import com.tmfhome.service.UserService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/register")
    public String register(Model model){
        return "register";
    }

    @RequestMapping("/toRegister")
    public String toRegister(Users users,Model model){
        String msg="";
        String ID= users.getUserID();
        String Password =users.getUserPassword();
        String NickName =users.getUserNickname();
        if(!userService.checkUserByIDandPasswordandNickname(ID,Password,NickName)){
            userService.addUser(users);
            return "redirect:login";
        }
        else {
            return "register";
        }
    }

    @RequestMapping("/checkID")
    public void checkID(String ID, HttpServletResponse response) throws IOException {
        String msg="";
        if(userService.checkUserByID(ID)){
            msg="exists";
        }
        response.getWriter().print(msg);
    }

    @RequestMapping("/checkNickname")
    public void checkNickname(String nickname, HttpServletResponse response) throws IOException {
        String msg="";
        if(userService.checkUserByNickname(nickname)){
            msg="exists";
        }
        response.getWriter().print(msg);
    }

    @RequestMapping("/login")
    public String login(Model model){
        return "login";
    }

    @RequestMapping("/toLogin")
    public String toLogin(String ID,String Password,HttpServletResponse response,Model model) throws IOException {
        if(userService.checkUserByIDandPassword(ID,Password)){
            return "redirect:homePage";
        }
        else {
            return "login";
        }
    }

    @RequestMapping("/checkLogin")
    public void checkLogin(String ID,String Password,HttpServletResponse response,Model model) throws IOException {
        String msg="";
        if(!userService.checkUserByID(ID)){
            msg="notExists";
        }
        else if(!userService.checkUserByIDandPassword(ID,Password)){
            msg="informationError";
        }
        response.getWriter().print(msg);
    }

    @RequestMapping("/homePage")
    public String showHomePage(Model model){
        return "homePage";
    }

}
