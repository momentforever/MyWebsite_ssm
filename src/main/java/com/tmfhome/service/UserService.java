package com.tmfhome.service;

import com.tmfhome.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {


    int addUser(Users users);


    /*
        校验用户是否存在
        true 存在
        false 不存在
    */
    Boolean checkUserByIDandPasswordandNickname(String userID,String userPassword,String userNickname);
    Boolean checkUserByIDandPassword(String userID,String userPassword);
    Boolean checkUserByID(String userID);
    Boolean checkUserByNickname(String userNickname);



}
