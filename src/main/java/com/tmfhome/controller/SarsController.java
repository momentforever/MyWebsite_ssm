package com.tmfhome.controller;

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
        model.addAttribute("list",list);
//        for(Sarschina tmp : sarschinas){
//            System.out.println(tmp.toString());
//        }

        return "china";
    }
}
