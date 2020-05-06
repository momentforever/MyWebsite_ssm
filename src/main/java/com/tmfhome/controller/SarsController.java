package com.tmfhome.controller;

import com.alibaba.fastjson.JSON;
import com.tmfhome.pojo.Sarschina;
import com.tmfhome.service.SarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
//        for(Sarschina tmp : list){
//            System.out.println(tmp.toString());
//        }

        return "china";
    }

    @RequestMapping("/checkchina")
    public String checkChina(Model model, HttpSession session){
        if((String) session.getAttribute("ID") != null &&
                (String) session.getAttribute("PWD") != null) {
            List<Sarschina> list = new ArrayList<Sarschina>();
            list = sarsService.queryAll();
            model.addAttribute("listjava", list);
            return "checkchina";
        }
        else return "redirect:/sars/china";
    }

    @RequestMapping("/updatechina")
    public String updateChina(String mainland,Model model){
        if(mainland!=null) {
            List<Sarschina> list = new ArrayList<Sarschina>();
            list = sarsService.queryByMainland(mainland);
            Sarschina sars = list.get(0);
            model.addAttribute("sars", sars);
            return "updatechina";
        }
        else return "redirect:/sars/checkchina";
    }

    @RequestMapping("/toupdatechina")
    public String toUpdateChina(Sarschina sarschina){
        //System.out.println("update=>"+sarschina);
        int i = sarsService.updateChina(sarschina);

        return "redirect:/sars/checkchina";
    }
}
