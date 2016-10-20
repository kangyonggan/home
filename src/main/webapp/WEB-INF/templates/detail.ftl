<#assign title="${article.title}"/>

<@override name="content">
<div class="space-30"></div>

<ul class="breadcrumbs">
    <li>当前位置:</li>
    <li><a href="${ctx}/">${appAuthor}</a></li>
    <li>&gt;</li>
    <li><a href="${ctx}/category/${category.code}">${category.name}</a></li>
    <li>&gt;</li>
    <li class="active">${article.title}</li>
</ul>

<div class="space-10"></div>

<div class="line"></div>

<div class="space-20"></div>

<div class="text-center">
    <div class="article-title">${article.title}</div>
</div>
<div class="space-20"></div>
<div class="markdown-body">${article.body}</div>
<div class="space-240"></div>
<div class="article-fixed-bottom">
    <div class="pull-right">${appAuthor}</div>
    <div class="space-10"></div>
    <div class="pull-right">${article.createdTime?datetime}</div>
</div>

</@override>

<@extends name="layout.ftl"/>
