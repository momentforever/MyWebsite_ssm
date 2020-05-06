package com.tmfhome.dao;

import com.tmfhome.pojo.Sarschina;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SarsMapper {

    //查询全部用户
    List<Sarschina> queryAll();

    int updateChina(Sarschina sarschina);

    List<Sarschina> queryByMainland(@Param("mainland")String mainland);

}
