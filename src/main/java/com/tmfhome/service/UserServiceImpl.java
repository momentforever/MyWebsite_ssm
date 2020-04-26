package com.tmfhome.service;

import com.tmfhome.dao.UserMapper;
import com.tmfhome.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    //service 调 dao
    @Autowired
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(Users users) {
        return userMapper.addUser(users);
    }

    @Override
    public Boolean checkUserByIDandPassword(String userID, String userPassword) {
        List<Users> users =new ArrayList<Users>();
        users = userMapper.queryUserByIDandPassword(userID,userPassword);
        return !users.isEmpty();
    }

    @Override
    public Boolean checkUserByID(String userID) {
        List<Users> users =new ArrayList<Users>();
        users = userMapper.queryUserByID(userID);
        return !users.isEmpty();
    }

    @Override
    public Boolean checkUserByIDandPasswordandNickname(String userID, String userPassword, String userNickname) {
        List<Users> users =new ArrayList<Users>();
        users = userMapper.queryUserByIDandPasswordandNickname(userID,userPassword,userNickname);
        return !users.isEmpty();
    }

    @Override
    public Boolean checkUserByNickname(String userNickname) {
        List<Users> users =new ArrayList<Users>();
        users =userMapper.queryUserByNickname(userNickname);
        return !users.isEmpty();
    }

}
