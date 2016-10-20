package com.kangyonggan.home.controller;

import com.kangyonggan.api.model.Category;
import com.kangyonggan.api.model.IpResponse;
import com.kangyonggan.api.model.RetData;
import com.kangyonggan.api.service.ApiService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 2016/10/20
 */
@Controller
@RequestMapping("api")
@Log4j2
public class ApiController {

    private static final String PATH_ROOT = "api/";
    private static final String PATH_IP = PATH_ROOT + "ip";
    private static final String PATH_RESULT = PATH_ROOT + "result";

    @Autowired
    private ApiService apiService;

    /**
     * ip查询的api界面
     *
     * @return
     */
    @RequestMapping(value = "ip", method = RequestMethod.GET)
    public String ip(Model model) {
        Category category = new Category();
        category.setName("IP地址查询");
        category.setCode("all");

        model.addAttribute("category", category);
        return PATH_IP;
    }

    /**
     * ip查询的api
     *
     * @return
     */
    @RequestMapping(value = "ip", method = RequestMethod.POST)
    public String ipApi(@RequestParam("ip") String ip, Model model) {
        Map<String, String> results = new HashMap();

        IpResponse response = apiService.findIpData(ip);
        log.info("ip查询结果：{}", response);

        if (response.getErrNum() == 0 && "success".equals(response.getErrMsg())) {
            RetData data = response.getRetData();
            results.put("IP地址", data.getIp());
            results.put("国家", data.getCountry());
            results.put("省份", data.getProvince());
            results.put("城市", data.getCity());
            results.put("地区", data.getDistrict());
            results.put("运营商", data.getCarrier());
        }
        Category category = new Category();
        category.setName("IP地址查询结果");
        category.setCode("all");

        model.addAttribute("apiCode", "ip");
        model.addAttribute("apiName", "IP地址查询");
        model.addAttribute("category", category);
        model.addAttribute("results", results);
        return PATH_RESULT;
    }

}
