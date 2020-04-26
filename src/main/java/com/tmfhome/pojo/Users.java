package com.tmfhome.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private int userNum;
    private String userID;
    private String userNickname;
    private String userPassword;

}
