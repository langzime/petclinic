<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<c:choose>
	<c:when test="${owner['new']}"><c:set var="method" value="post"/></c:when>
	<c:otherwise><c:set var="method" value="put"/></c:otherwise>
</c:choose>

<h2><c:if test="${owner['new']}">新 </c:if>主人:</h2>
<form:form modelAttribute="owner" method="${method}">
  <table>
    <tr>
      <th>
 		名字: <form:errors path="firstName" cssClass="errors"/>
        <br/>
        <form:input path="firstName" size="30" maxlength="80"/>
      </th>
    </tr>
    <tr>
      <th>
 		姓: <form:errors path="lastName" cssClass="errors"/>
        <br/>
        <form:input path="lastName" size="30" maxlength="80"/>
      </th>
    </tr>
    <tr>
      <th>
       	 地址: <form:errors path="address" cssClass="errors"/>
        <br/>
        <form:input path="address" size="30" maxlength="80"/>
      </th>
    </tr>
    <tr>
      <th>
      	城市: <form:errors path="city" cssClass="errors"/>
        <br/>
        <form:input path="city" size="30" maxlength="80"/>
      </th>
    </tr>
    <tr>
      <th>
 		手机号: <form:errors path="telephone" cssClass="errors"/>
        <br/>
        <form:input path="telephone" size="20" maxlength="20"/>
      </th>
    </tr>
    <tr>
      <td>
        <c:choose>
          <c:when test="${owner['new']}">
            <p class="submit"><input type="submit" value="添加"/></p>
          </c:when>
          <c:otherwise>
            <p class="submit"><input type="submit" value="更新"/></p>
          </c:otherwise>
        </c:choose>
      </td>
    </tr>
  </table>
</form:form>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
