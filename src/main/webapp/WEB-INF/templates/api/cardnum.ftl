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

<form action="${ctx}/api/cardnum" method="post">
    <div>
        <label class="label">银行卡号：</label>
        <input name="cardnum" placeholder="请输入想要查询的银行卡号..." class="text-input"/>
    </div>
    <div class="space-20"></div>
    <div>
        <input type="submit" value="查询" class="btn"/>
    </div>
</form>
</@override>

<@extends name="../layout.ftl"/>
