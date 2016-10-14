<#assign key = RequestParameters.key!'' />

<nav class="navbar navbar-fixed-top">
    <div class="pull-left margin-left-20">
        <a href="${ctx}/" class="font-22 letter-1">${appAuthor}</a>
    </div>

<#if category??>
    <div class="pull-left hidden-sm">
        <ul class="nav-list">
            <@navs>
                <#list categories as c>
                    <li <#if category.code==c.code>class="active"</#if>><a
                            href="${ctx}/category/${c.code}">${c.name}</a></li>
                </#list>
            </@navs>
        </ul>
    </div>

    <div class="pull-right show-sm hidden margin-right-20 toggle-panel">
        <div href="#" class="toggle-button">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            <ul class="toggle-list">
                <@navs>
                    <#list categories as c>
                        <li <#if category.code==c.code>class="active"</#if>><a
                                href="${ctx}/category/${c.code}">${c.name}</a></li>
                    </#list>
                </@navs>
            </ul>
        </div>
    </div>
</#if>

    <div class="pull-right">
        <form action="${ctx}/search" method="get" novalidate>
            <input class="search" type="text" name="key" value="${key!''}" placeholder="搜一搜:空格分词,支持拼音"/>
        </form>
    </div>
</nav>