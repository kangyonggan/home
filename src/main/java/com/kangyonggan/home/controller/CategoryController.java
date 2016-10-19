package com.kangyonggan.home.controller;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.api.model.Article;
import com.kangyonggan.api.model.Category;
import com.kangyonggan.api.service.ArticleService;
import com.kangyonggan.api.service.CategoryService;
import com.kangyonggan.home.util.MarkdownUtil;
import lombok.extern.log4j.Log4j2;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @author kangyonggan
 * @since 16/10/12
 */
@Controller
@RequestMapping("category")
@Log4j2
public class CategoryController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 某栏目的文章列表
     *
     * @param code
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = "{code:[\\w]+}", method = RequestMethod.GET)
    public String index(@PathVariable("code") String code,
                        @RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                        Model model) {
        Category category = categoryService.findCategoryByCode(code);
        if (category == null) {
            return "404";
        }

        PageInfo<Article> page = articleService.findArticlesByPage(pageNum, category.getCode());

        model.addAttribute("page", page);
        model.addAttribute("category", category);
        return "list";
    }

    /**
     * 文章详情
     *
     * @param code
     * @param id
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "{code:[\\w]+}/article/{id:[\\d]+}", method = RequestMethod.GET)
    public String detail(@PathVariable("code") String code, @PathVariable("id") Long id, Model model) throws UnsupportedEncodingException {
        Article article = articleService.findArticleById(id);

        if (article == null) {
            return "404";
        }

        /**
         * 增加浏览量
         */
        articleService.updateArticleHits(id);

        Category category = categoryService.findCategoryByCode(code);

        /**
         * markdown2html
         */
        article.setBody(MarkdownUtil.markdownToHtml(article.getBody()));

        model.addAttribute("article", article);
        model.addAttribute("category", category);
        model.addAttribute("txt", URLEncoder.encode(article.getSummary(), "UTF-8"));
        return "detail";
    }

}
