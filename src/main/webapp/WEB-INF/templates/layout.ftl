<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>${appAuthor} - ${title!''}</title>
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

<div class="scroll-bar">
    <a href="javascript:scroll(0,0)" class="top">&uarr;</a>
    <a href="javascript:scroll(0, 9999999999)" class="bottom">&darr;</a>
</div>

<@block name="script"/>

</body>
</html>
