<#assign title="${category.name}"/>
<#assign key = RequestParameters.key!'' />

<@override name="content">
<div class="space-30"></div>

<ul class="breadcrumbs">
    <li>当前位置:</li>
    <li><a href="${ctx}/">康永敢</a></li>
    <li>&gt;</li>
    <li class="active">${category.name}</li>
</ul>

<div class="space-10"></div>

<div class="line"></div>

<div class="space-20"></div>

    <#if page.list?? && page.list?size gt 0>
    <ul class="article-list">
        <#list page.list as article>
            <li>
                <a href="${ctx}/category/${article.categoryCode}/article/${article.id}"
                   class="article-title">${article.title}</a>
                <div class="space-5"></div>
                <div class="article-header">
                    <a href="${ctx}/category/${article.categoryCode}"><span>${article.categoryName}</span></a>
                    <em>${article.createdTime?datetime}</em>
                </div>
                <div class="space-10"></div>
                <div>${article.summary}</div>
            </li>
            <div class="space-30"></div>
            <#if article_has_next>
                <li class="article-split"></li>
                <div class="space-20"></div>
            </#if>
        </#list>
    </ul>
        <#if category.code=='all'>
            <@c.pagination url="${ctx}/"/>
        <#elseif category.code=='search'>
            <@c.pagination url="${ctx}/search" param="key=${key}"/>
        <#else>
            <@c.pagination url="${ctx}/category/${category.code}"/>
        </#if>
    <#else>
    <div class="space-30"></div>
    <div class="text-center">
        暂时没有符合条件的文章, 看看其它文章吧!
    </div>
    </#if>

<div class="space-30"></div>
<div class="space-30"></div>
<div class="space-30"></div>
<div class="space-30"></div>
</@override>

<@extends name="layout.ftl"/>
