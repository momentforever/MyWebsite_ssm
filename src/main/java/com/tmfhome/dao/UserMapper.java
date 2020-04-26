package com.tmfhome.dao;

import com.tmfhome.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    int addUser(Users users);

    List<Users> queryUserByIDandPasswordandNickname(@Param("userID") String userID,
                                                    @Param("userPassword") String userPassword,
                                                    @Param("userNickname")String userNickname);
    List<Users> queryUserByIDandPassword(@Param("userID") String userID,
                                         @Param("userPassword") String userPassword);
    List<Users> queryUserByID(@Param("userID") String userID);
    List<Users> queryUserByNickname(@Param("userNickname") String userNickname);

}


