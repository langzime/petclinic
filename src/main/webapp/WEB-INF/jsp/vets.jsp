<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2>兽医:</h2>

<table>
  <thead>
    <th>名字</th>
    <th>专长</th>
  </thead>
  <c:forEach var="vet" items="${vets.vetList}">
    <tr>
      <td>${vet.firstName} ${vet.lastName}</td>
      <td>
	    <c:forEach var="specialty" items="${vet.specialties}">
          ${specialty.name}
        </c:forEach>
        <c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
      </td>
    </tr>
  </c:forEach>
</table>
<table class="table-buttons">
  <tr>
    <td>
      <a href="<spring:url value="/vets.xml" htmlEscape="true" />">XML查看</a>
    </td>
  </tr>
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
