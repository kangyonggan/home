package com.kangyonggan.home.freemarker;

import com.kangyonggan.api.model.Category;
import com.kangyonggan.api.service.CategoryService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 16/10/14
 */
@Component
public class CategoryDirective implements TemplateDirectiveModel {

    @Autowired
    private CategoryService categoryService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        List<Category> categories = categoryService.findAllCategories();

        env.setVariable("categories", ObjectWrapper.DEFAULT_WRAPPER.wrap(categories));
        if (body != null) {
            body.render(env.getOut());
        }
    }

}
