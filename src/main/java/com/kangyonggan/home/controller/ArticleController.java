package com.kangyonggan.home.controller;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.api.model.Article;
import com.kangyonggan.api.model.Category;
import com.kangyonggan.api.service.ArticleService;
import com.kangyonggan.api.service.CategoryService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author kangyonggan
 * @since 16/10/12
 */
@Controller
@RequestMapping("article")
@Log4j2
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 文章列表
     *
     * @param code
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = "category/{code:[\\w]+}", method = RequestMethod.GET)
    public String index(@PathVariable("code") String code,
                        @RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                        Model model) {
        Category category = categoryService.findCategoryByCode(code);
        PageInfo<Article> page = articleService.findArticlesByPage(pageNum, category.getCode());

        model.addAttribute("page", page);
        model.addAttribute("category", category);
        return "list";
    }

    /**
     * 文章详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findArticleById(id);
        Map<String, Article> relativeArticles = articleService.findRelativeArticle(id);

        model.addAttribute("article", article);
        model.addAttribute("relativeArticles", relativeArticles);
        return "detail";
    }

}
