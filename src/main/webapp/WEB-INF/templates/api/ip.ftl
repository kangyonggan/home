<#assign title="${category.name}"/>

<@override name="content">
<div class="space-30"></div>

<ul class="breadcrumbs">
    <li>当前位置:</li>
    <li><a href="${ctx}/">${appAuthor}</a></li>
    <li>&gt;</li>
    <li class="active">${category.name}</li>
</ul>

<div class="space-10"></div>

<div class="line"></div>

<div class="space-20"></div>
<div class="space-20"></div>

<form action="${ctx}/api/ip" method="post">
    <div>
        <label class="label">IP地址：</label>
        <input name="ip" placeholder="请输入想要查询的ip..." class="text-input"/>
    </div>
    <div class="space-20"></div>
    <div>
        <input type="submit" value="查询" class="btn"/>
    </div>
</form>
</@override>

<@extends name="../layout.ftl"/>
