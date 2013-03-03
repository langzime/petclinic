<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>


<h2>找主人:</h2>

<spring:url value="/owners" var="formUrl"/>
<form:form modelAttribute="owner" action="${fn:escapeXml(formUrl)}" method="get">
  <table>
    <tr>
      <th>
		  姓: <form:errors path="*" cssClass="errors"/>
        <br/> 
        <form:input path="lastName" size="30" maxlength="80" />
      </th>
    </tr>
    <tr>
      <td><p class="submit"><input type="submit" value="找主人"/></p></td>
    </tr>
  </table>
</form:form>

<br/>
<a href='<spring:url value="/owners/new" htmlEscape="true"/>'>添加主人</a>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
