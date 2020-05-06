package com.tmfhome.service;

import com.tmfhome.dao.SarsMapper;
import com.tmfhome.pojo.Sarschina;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SarsServiceImpl implements SarsService {
    @Autowired
    private SarsMapper sarsMapper;

    public void setSarsMapper(SarsMapper sarsMapper) {
        this.sarsMapper = sarsMapper;
    }

    @Override
    public List<Sarschina> queryAll() {
        return sarsMapper.queryAll();
    }

    @Override
    public int updateChina(Sarschina sarschina) {
        return sarsMapper.updateChina(sarschina);
    }

    @Override
    public List<Sarschina> queryByMainland(String mainland) {
        return sarsMapper.queryByMainland(mainland);
    }
}
