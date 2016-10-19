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
<div>${article.body}</div>
<div class="space-240"></div>
<div class="article-fixed-bottom">
    <div class="pull-right">${appAuthor}</div>
    <div class="space-10"></div>
    <div class="pull-right">${article.createdTime?datetime}</div>
</div>

<audio class="hidden" autoplay="autoplay" src="http://tsn.baidu.com/text2audio?tex=${txt!'作者比较懒，没有写这篇文章的摘要！'}&lan=zh&tok=24.6033eb52a02cf7c0a98355196b2d621d.2592000.1479459140.282335-8767892&ctp=1&cuid=ac:bc:32:d4:d5:47&spd=5&pit=5&vol=5&per=0"></audio>

</@override>

<@extends name="layout.ftl"/>
