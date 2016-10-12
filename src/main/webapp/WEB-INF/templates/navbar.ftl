<nav class="navbar navbar-fixed-top">
    <div class="pull-left margin-left-20">
        <a href="${ctx}/" class="font-22 letter-1">康永敢</a>
    </div>

    <div class="pull-left hidden-sm">
        <ul class="nav-list">
            <li><a href="#">原创博客</a></li>
            <li><a href="#">图文教程</a></li>
            <li><a href="#">学习笔记</a></li>
            <li><a href="#">代码片段</a></li>
            <li><a href="#">杂记</a></li>
        </ul>
    </div>

    <div class="pull-right show-sm hidden margin-right-20 toggle-panel">
        <div href="#" class="toggle-button">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
            <ul class="toggle-list">
                <li><a href="#">原创博客</a></li>
                <li><a href="#">图文教程</a></li>
                <li><a href="#">学习笔记</a></li>
                <li><a href="#">代码片段</a></li>
                <li><a href="#">杂记</a></li>
            </ul>
        </div>
    </div>

    <div class="pull-right">
        <form action="${ctx}/search" method="get" novalidate>
            <input class="search" type="text" name="key" value="${key!''}" placeholder="搜一搜:空格分词,支持拼音"/>
        </form>
    </div>
</nav>