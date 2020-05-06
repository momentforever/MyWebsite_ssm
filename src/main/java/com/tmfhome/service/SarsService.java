package com.tmfhome.service;

import com.tmfhome.pojo.Sarschina;
import com.tmfhome.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SarsService {
    List<Sarschina> queryAll();
    int updateChina(Sarschina sarschina);
    List<Sarschina> queryByMainland(String mainland);
}
