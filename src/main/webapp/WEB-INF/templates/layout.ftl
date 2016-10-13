<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>康永敢 - ${title!''}</title>
    <link rel="icon" type="image/ico" href="${ctx}/static/app/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- inline styles related to this page -->
    <link rel="stylesheet" href="${ctx}/static/app/css/app.css"/>
<@block name="style"/>
</head>
<body>

<#include "navbar.ftl">

<div class="container">
<@block name="content"/>
</div>

<#include "footer.ftl">

<script>var ctx = '${ctx}';</script>
<@block name="script"/>

</body>
</html>