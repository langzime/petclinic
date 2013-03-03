<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<c:choose>
	<c:when test="${pet['new']}"><c:set var="method" value="post"/></c:when>
	<c:otherwise><c:set var="method" value="put"/></c:otherwise>
</c:choose>

<h2><c:if test="${pet['new']}">新 </c:if>宠物</h2>

<b>主人:</b> ${pet.owner.firstName} ${pet.owner.lastName}
<br/>
<form:form modelAttribute="pet" method="${method}">
  <table>
    <tr>
      <th>
 		 名字: <form:errors path="name" cssClass="errors"/>
        <br/>
        <form:input path="name" size="30" maxlength="30"/>
      </th>
    </tr>
    <tr>
      <th>
 		生日: <form:errors path="birthDate" cssClass="errors"/>
        <br/>
        <form:input path="birthDate" size="10" maxlength="10"/> (yyyy-mm-dd)
      </th>
    </tr>
    <tr>
      <th>
 		种类: <form:errors path="type" cssClass="errors"/>
        <br/>
        <form:select path="type" items="${types}"/>
      </th>
    </tr>
    <tr>
      <td>
        <c:choose>
          <c:when test="${pet['new']}">
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

<c:if test="${!pet['new']}">
  <form:form method="delete">
    <p class="submit"><input type="submit" value="删除"/></p>
  </form:form>
</c:if>    

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
