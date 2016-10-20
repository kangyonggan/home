package com.kangyonggan.home.controller;

import com.kangyonggan.api.model.*;
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
    private static final String PATH_IDCARD = PATH_ROOT + "idcard";
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
            IpData data = response.getRetData();
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
        model.addAttribute("response", response.toString());
        return PATH_RESULT;
    }

    /**
     * 身份证查询的api界面
     *
     * @return
     */
    @RequestMapping(value = "idcard", method = RequestMethod.GET)
    public String idcard(Model model) {
        Category category = new Category();
        category.setName("身份证查询");
        category.setCode("all");

        model.addAttribute("category", category);
        return PATH_IDCARD;
    }

    /**
     * 身份证查询的api
     *
     * @return
     */
    @RequestMapping(value = "idcard", method = RequestMethod.POST)
    public String idcardApi(@RequestParam("idcard") String idcard, Model model) {
        Map<String, String> results = new HashMap();

        IdcardResponse response = apiService.findIdcardData(idcard);
        log.info("身份证查询结果：{}", response);

        if (response.getError() == 0 && "succeed".equals(response.getMsg())) {
            IdcardData data = response.getData();
            results.put("地扯", data.getAddress());
            results.put("生日", data.getBirthday());
            results.put("星座", data.getConstellation());
            results.put("性别", data.getGender());
            results.put("身份证号码", data.getIdcard());
            results.put("生肖", data.getZodiac());
        }
        Category category = new Category();
        category.setName("身份证查询结果");
        category.setCode("all");

        model.addAttribute("apiCode", "idcard");
        model.addAttribute("apiName", "身份证查询");
        model.addAttribute("category", category);
        model.addAttribute("results", results);
        model.addAttribute("response", response.toString());
        return PATH_RESULT;
    }

    /**
     * 银行卡号查询的api界面
     *
     * @return
     */
    @RequestMapping(value = "cardnum", method = RequestMethod.GET)
    public String cardnum(Model model) {
        Category category = new Category();
        category.setName("银行卡查询");
        category.setCode("all");

        model.addAttribute("category", category);
        return PATH_IDCARD;
    }

    /**
     * 银行卡号查询的api
     *
     * @return
     */
    @RequestMapping(value = "cardnum", method = RequestMethod.POST)
    public String cardnumApi(@RequestParam("cardnum") String cardnum, Model model) {
        Map<String, String> results = new HashMap();

        CardnumResponse response = apiService.findCardnumData(cardnum);
        log.info("银行卡查询结果：{}", response);

        if (response.getStatus() == 1) {
            CardnumData data = response.getData();
            results.put("银行卡的类型", data.getCardtype());
            results.put("银行卡的长度", data.getCardlength());
            results.put("银行卡前缀", data.getCardprefixnum());
            results.put("银行卡名称", data.getCardname());
            results.put("归属银行", data.getBankname());
            results.put("内部结算代码", data.getBanknum());
        }
        Category category = new Category();
        category.setName("银行卡查询结果");
        category.setCode("all");

        model.addAttribute("apiCode", "cardnum");
        model.addAttribute("apiName", "银行卡查询");
        model.addAttribute("category", category);
        model.addAttribute("results", results);
        model.addAttribute("response", response.toString());
        return PATH_RESULT;
    }

}
