<#assign title="${category.name}"/>

<@override name="content">
<div class="space-30"></div>

<ul class="breadcrumbs">
    <li>当前位置:</li>
    <li><a href="${ctx}/">${appAuthor}</a></li>
    <li>&gt;</li>
    <li><a href="${ctx}/api/${apiCode}">${apiName}</a></li>
    <li>&gt;</li>
    <li class="active">${category.name}</li>
</ul>

<div class="space-10"></div>

<div class="line"></div>

<div class="space-20"></div>
<div class="space-20"></div>

<#if results?? && results?keys?size gt 0>
    <#list results?keys as key>
    <div>${key}: ${results[key]}</div>
    <div class="space-20"></div>
    </#list>
<#else>
<div>暂无查询结果， 请稍后重试！</div>
</#if>

</@override>

<@extends name="../layout.ftl"/>
