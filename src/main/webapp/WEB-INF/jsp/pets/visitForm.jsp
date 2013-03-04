<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2><c:if test="${visit['new']}">新 </c:if>访问者:</h2>

<form:form modelAttribute="visit">
  <b>宠物:</b>
  <table width="333">
    <thead>
      <th>名字</th>
      <th>生日</th>
      <th>种类</th>
      <th>主人</th>
    </thead>
    <tr>
      <td>${visit.pet.name}</td>
      <td><fmt:formatDate value="${visit.pet.birthDate}" pattern="yyyy-MM-dd"/></td>
      <td>${visit.pet.type.name}</td>
      <td>${visit.pet.owner.firstName} ${visit.pet.owner.lastName}</td>
    </tr>
  </table>

  <table width="333">
    <tr>
      <th>
 		日期:
        <br/><form:errors path="date" cssClass="errors"/>
      </th>
      <td>
        <form:input path="date" size="10" maxlength="10"/> (yyyy-mm-dd)
      </td>
    <tr/>
    <tr>
      <th valign="top">
 		描述:
        <br/><form:errors path="description" cssClass="errors"/>
      </th>
      <td>
        <form:textarea path="description" rows="10" cols="25"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="hidden" name="petId" value="${visit.pet.id}"/>
        <p class="submit"><input type="submit" value="添加访问者"/></p>
      </td>
    </tr>
  </table>
</form:form>

<br/>
<b>以前 的访问者:</b>
<table width="333">
  <tr>
    <th>日期</th>
    <th>描述</th>
  </tr>
  <c:forEach var="visit" items="${visit.pet.visits}">
    <c:if test="${!visit['new']}">
      <tr>
        <td><fmt:formatDate value="${visit.date}" pattern="yyyy-MM-dd"/></td>
        <td>${visit.description}</td>
      </tr>
    </c:if>
  </c:forEach>
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
