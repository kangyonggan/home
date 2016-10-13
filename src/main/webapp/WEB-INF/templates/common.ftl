<#--分页组件-->
<#macro pagination url param="">
    <#if page.list?? && page.total gt 0>
    <div class="pagination">
        <ul>
            <li>
                <#if page.hasPreviousPage>
                    <a href="${url}?p=${page.prePage}<#if param?has_content>&${param}</#if>">&lt;</a>
                <#else>
                    <a href="javascript:">&lt;</a>
                </#if>
            </li>

            <#list page.navigatepageNums as nav>
                <li <#if nav == page.pageNum>class="active"</#if>>
                    <a href="${url}?p=${nav}<#if param?has_content>&${param}</#if>">${nav}</a>
                </li>
            </#list>

            <li class="last-pagination">
                <#if page.hasNextPage>
                    <a href="${url}?p=${page.nextPage}<#if param?has_content>&${param}</#if>">&gt;</a>
                <#else>
                    <a href="javascript:">&gt;</a>
                </#if>
            </li>
        </ul>
    </div>
    </#if>
</#macro>