package com.tmfhome.controller;

import com.alibaba.fastjson.JSON;
import com.tmfhome.pojo.Sarschina;
import com.tmfhome.service.SarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/sars")
public class SarsController {

    @Autowired
    @Qualifier("SarsServiceImpl")
    private SarsService sarsService;

    @RequestMapping("/china")
    public String china(Model model){
        List<Sarschina> list = new ArrayList<Sarschina>();
        list = sarsService.queryAll();
        model.addAttribute("list",JSON.toJSONString(list));
        model.addAttribute("listjava",list);
//        for(Sarschina tmp : sarschinas){
//            System.out.println(tmp.toString());
//        }

        return "china";
    }

    @RequestMapping("/checkchina")
    public String checkChina(Model model){
        List<Sarschina> list = new ArrayList<Sarschina>();
        list = sarsService.queryAll();
        model.addAttribute("listjava",list);

        return "checkchina";
    }

    @RequestMapping("/updatechina")
    public String updateChina(String mainland,Model model){
        List<Sarschina> list = new ArrayList<Sarschina>();
        list = sarsService.queryByMainland(mainland);
        Sarschina sars=list.get(0);
        //Sarschina sars= (Sarschina) sarsService.queryByMainland(mainland);
        model.addAttribute("sars",sars);
        //int i = sarsService.updateChina(mainland);
        return "updatechina";
    }

    @RequestMapping("/toupdatechina")
    public String toUpdateChina(Sarschina sarschina){
        System.out.println("update=>"+sarschina);
        int i = sarsService.updateChina(sarschina);
        return "redirect:/sars/checkchina";
    }
}
