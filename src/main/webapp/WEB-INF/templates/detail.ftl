<#assign title="${article.title}"/>

<@override name="content">
<div class="space-30"></div>

<ul class="breadcrumbs">
    <li>当前位置:</li>
    <li><a href="${ctx}/">康永敢</a></li>
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
    <div class="space-10"></div>
    <div class="article-header">
        <a href="${ctx}/category/${article.categoryCode}"><span>${article.categoryName}</span></a>
        <span>${article.hits}次浏览</span>
    </div>
</div>
<div class="space-20"></div>
<div id="article-body-md" class="text-center">正在把markdown语法转成html...</div>
<div id="article-body" class="hidden"></div>
<div class="space-240"></div>
<div class="article-fixed-bottom">
    <div class="pull-right"><@spring.message "app.author"/></div>
    <div class="space-10"></div>
    <div class="pull-right">${article.createdTime?datetime}</div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/libs/markdown/marked.min.js"></script>
<script>
    $.get("${ctx}/category/${article.categoryCode}/article/${article.id}/body", function (data) {
        data = eval('(' + data + ')');
        var $body = $("#article-body");
        $body.html(marked(data.body));

        $("#article-body-md").addClass("hidden");
        $body.removeClass("hidden");

        $("#article-body a").prop("target", "_blank");
    });
</script>
</@override>

<@extends name="layout.ftl"/>
