package com.tmfhome.controller;

import com.tmfhome.pojo.Users;
import com.tmfhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

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

    @RequestMapping("/login")
    public String login(Model model){
        return "login";
    }

    @RequestMapping("/homePage")
    public String homePage(HttpSession session, Model model){
        String ID= (String) session.getAttribute("ID");
        String PWD= (String) session.getAttribute("PWD");
        //System.out.println(ID);
        //System.out.println(PWD);
        return "homePage";
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
    @ResponseBody
    public String checkID(String ID){
        String msg="";
        if(userService.checkUserByID(ID)){
            msg="exists";
        }
        //response.getWriter().print(msg);
        return msg;
    }

    @RequestMapping("/checkNickname")
    @ResponseBody
    public String checkNickname(String nickname){
        String msg="";
        if(userService.checkUserByNickname(nickname)){
            msg="exists";
        }
        //response.getWriter().print(msg);
        return msg;
    }



    @RequestMapping("/toLogin")
    public String toLogin(String userID, String userPassword,HttpSession session, Model model){
        if(userService.checkUserByIDandPassword(userID,userPassword)){
            session.setAttribute("ID",userID);
            session.setAttribute("PWD",userPassword);
            return "redirect:homePage";
        }
        else {
            return "login";
        }
    }

    @RequestMapping("/checkLogin")
    @ResponseBody
    public String checkLogin(String ID,String Password,Model model){
        String msg="";
        if(!userService.checkUserByID(ID)){
            msg="notExists";
        }
        else if(!userService.checkUserByIDandPassword(ID,Password)){
            msg="informationError";
        }
        //response.getWriter().print(msg);
        return msg;
    }

}
