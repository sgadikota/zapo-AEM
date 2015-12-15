<%--
  ~ Copyright 2013 T-Mobile
  ~ All Rights Reserved.
  ~
  ~ NOTICE: All information contained herein is, and remains the property
  ~ of T-Mobile. The intellectual and technical concepts contained herein
  ~ are proprietary to T-Mobile and may be covered by U.S.
  ~ and Foreign Patents, patents in process, and are protected by trade
  ~ secret or copyright law. Dissemination of this information or
  ~ reproduction of this material is strictly forbidden unless prior written
  ~ permission is obtained from T-Mobile Incorporated.
--%>
<%@include file="/apps/tmo-wem/components/global.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page session="false" %>
<c:if test="${isAuthorMode && (empty properties.numberofitems)}">
    <span>Please configure this component.</span>
</c:if>
<!-- Accordion Component -->
<div class="accordion accordion-comp" id="accordion2">

<c:choose>
    <c:when test="${properties.numberofitems == 1}">
    
        <c:set var="title" value="${properties.accordion_head_title}"/>
        <c:set var="hidden_id" value="${properties.accordion_hidden}"/>
        
        <c:choose>
            <c:when test="${properties.accordion_open == 'yes'}">
                <c:set var="open_window" value="in"/>
            </c:when>
            <c:otherwise>
                <c:set var="open_window" value=""/>
            </c:otherwise>
        </c:choose>

          <!-- Accordion group -->
            <div class="accordion-group">
             <div class="accordion-heading">
                <a class="accordion-toggle ${ open_window == '' ? 'collapsed' : '' }" ${ isAuthorMode ? '' : 'data-toggle="collapse"'} href="#collaps-${hidden_id}">
                   <i class="icon-plus-circle"></i><i class="icon-minus-circle"></i>&nbsp;<c:out value="${title}"/>
                </a>
             </div>
             <div id="collaps-${hidden_id}" class="accordion-body collapse ${ isAuthorMode ? 'in' : open_window } "><!-- To Default open add class [in] -->
                <div class="accordion-inner">
                   <!-- Parsys -->
                       <cq:include path="accordion-parsys-${hidden_id}" resourceType="foundation/components/parsys" />
                   <!-- /Parsys -->
                </div>
             </div>
            </div>
          <!-- /Accordion group -->
    </c:when>
    <c:when test="${properties.numberofitems > 1}">
        <c:forEach var="i" begin="0" end="${properties.numberofitems -1}">
        
            <c:set var="title" value="${properties.accordion_head_title[i]}"/>
            <c:set var="hidden_id" value="${properties.accordion_hidden[i]}"/>
            
            <c:choose>
                <c:when test="${properties.accordion_open[i] == 'yes'}">
                    <c:set var="open_window" value="in"/>
                </c:when>
                <c:otherwise>
                    <c:set var="open_window" value=""/>
                </c:otherwise>
            </c:choose>
            
            <!-- Accordion group -->
            <div class="accordion-group">
             <div class="accordion-heading">
                <a class="accordion-toggle ${ open_window == '' ? 'collapsed' : '' }" ${ isAuthorMode ? '' : 'data-toggle="collapse"'} href="#collaps-${hidden_id}">
                   <i class="icon-plus-circle"></i><i class="icon-minus-circle"></i>&nbsp;<c:out value="${title}"/>
                </a>
             </div>
             <div id="collaps-${hidden_id}" class="accordion-body collapse ${ isAuthorMode ? 'in' : open_window } "><!-- To Default open add class [in] -->
                <div class="accordion-inner">
                   <!-- Parsys -->
                       <cq:include path="accordion-parsys-${hidden_id}" resourceType="foundation/components/parsys" />
                   <!-- /Parsys -->
                </div>
             </div>
            </div>
            <!-- /Accordion group -->        
        </c:forEach>
    </c:when>
 </c:choose>



</div>
<!-- /Accordion Component -->