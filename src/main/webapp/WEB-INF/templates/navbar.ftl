<#assign key = RequestParameters.key!'' />

<nav class="navbar navbar-fixed-top">
    <div class="pull-left margin-left-20">
        <a href="${ctx}/" class="font-22 letter-1"><@spring.message "app.author"/></a>
    </div>

    <div class="pull-left hidden-sm">
        <ul class="nav-list">
            <li <#if category.code=='original'>class="active"</#if>><a href="${ctx}/category/original">原创博客</a></li>
            <li <#if category.code=='course'>class="active"</#if>><a href="${ctx}/category/course">图文教程</a></li>
            <li <#if category.code=='note'>class="active"</#if>><a href="${ctx}/category/note">学习笔记</a></li>
            <li <#if category.code=='code'>class="active"</#if>><a href="${ctx}/category/code">代码片段</a></li>
            <li <#if category.code=='other'>class="active"</#if>><a href="${ctx}/category/other">杂记</a></li>
        </ul>
    </div>

    <div class="pull-right show-sm hidden margin-right-20 toggle-panel">
        <div href="#" class="toggle-button">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            <ul class="toggle-list">
                <li <#if category.code=='original'>class="active"</#if>><a href="${ctx}/category/original">原创博客</a></li>
                <li <#if category.code=='course'>class="active"</#if>><a href="${ctx}/category/course">图文教程</a></li>
                <li <#if category.code=='note'>class="active"</#if>><a href="${ctx}/category/note">学习笔记</a></li>
                <li <#if category.code=='code'>class="active"</#if>><a href="${ctx}/category/code">代码片段</a></li>
                <li <#if category.code=='other'>class="active"</#if>><a href="${ctx}/category/other">杂记</a></li>
            </ul>
        </div>
    </div>

    <div class="pull-right">
        <form action="${ctx}/search" method="get" novalidate>
            <input class="search" type="text" name="key" value="${key!''}" placeholder="搜一搜:空格分词,支持拼音"/>
        </form>
    </div>
</nav>