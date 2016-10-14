package com.kangyonggan.home.controller;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.api.model.Article;
import com.kangyonggan.api.model.Category;
import com.kangyonggan.api.service.ArticleService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author kangyonggan
 * @since 16/10/12
 */
@Controller
@RequestMapping("/")
@Log4j2
public class IndexController {

    @Autowired
    private ArticleService articleService;

    /**
     * 首页
     *
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                        Model model) {
        PageInfo<Article> page = articleService.findArticlesByPage(pageNum, null);
        Category category = new Category();
        category.setName("全部文章");
        category.setCode("all");

        model.addAttribute("category", category);
        model.addAttribute("page", page);
        return "list";
    }

    /**
     * 全文检索
     *
     * @param pageNum
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                         @RequestParam(value = "key") String key, Model model) {
        PageInfo<Article> page = articleService.searchArticles(pageNum, key);
        Category category = new Category();
        category.setName(key);
        category.setCode("search");

        model.addAttribute("page", page);
        model.addAttribute("category", category);
        return "list";
    }

    /**
     * 关于我
     *
     * @return
     */
    @RequestMapping(value = "about", method = RequestMethod.GET)
    public String about() {
        return "about";
    }

}
