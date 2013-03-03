<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h2>主人 信息</h2>

  <table>
    <tr>
      <th>名字</th>
      <td><b>${owner.firstName} ${owner.lastName}</b></td>
    </tr>
    <tr>
      <th>地址</th>
      <td>${owner.address}</td>
    </tr>
    <tr>
      <th>城市</th>
      <td>${owner.city}</td>
    </tr>
    <tr>
      <th>手机 </th>
      <td>${owner.telephone}</td>
    </tr>
  </table>
  <table class="table-buttons">
    <tr>
      <td colspan="2" align="center">
        <spring:url value="{ownerId}/edit" var="editUrl">
        	<spring:param name="ownerId" value="${owner.id}" />
        </spring:url>
        <a href="${fn:escapeXml(editUrl)}">编辑</a>
      </td>
      <td>
        <spring:url value="{ownerId}/pets/new" var="addUrl">
        	<spring:param name="ownerId" value="${owner.id}" />
        </spring:url>
        <a href="${fn:escapeXml(addUrl)}">添加</a>
      </td>
    </tr>
  </table>

  <h2>宠物 和 访问者</h2>

  <c:forEach var="pet" items="${owner.pets}">
    <table width="94%">
      <tr>
        <td valign="top">
          <table>
            <tr>
              <th>名字</th>
              <td><b>${pet.name}</b></td>
            </tr>
            <tr>
              <th>生日时间</th>
              <td><fmt:formatDate value="${pet.birthDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
              <th>种类</th>
              <td>${pet.type.name}</td>
            </tr>
          </table>
        </td>
        <td valign="top">
          <table>
            <thead>
              <th>访问 时间</th>
              <th>描述</th>
            </thead>
            <c:forEach var="visit" items="${pet.visits}">
              <tr>
                <td><fmt:formatDate value="${visit.date}" pattern="yyyy-MM-dd"/></td>
                <td>${visit.description}</td>
              </tr>
            </c:forEach>
          </table>
        </td>
      </tr>
    </table>
    <table class="table-buttons">
      <tr>
        <td>
          <spring:url value="{ownerId}/pets/{petId}/edit" var="petUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
            <spring:param name="petId" value="${pet.id}"/>
          </spring:url>
          <a href="${fn:escapeXml(petUrl)}">编辑宠物</a>
        </td>
        <td></td>
        <td>
          <spring:url value="{ownerId}/pets/{petId}/visits/new" var="visitUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
            <spring:param name="petId" value="${pet.id}"/>
          </spring:url>
          <a href="${fn:escapeXml(visitUrl)}">添加访问者</a>
        </td>
        <td></td>
        <td>
          <spring:url value="{ownerId}/pets/{petId}/visits.atom" var="feedUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
            <spring:param name="petId" value="${pet.id}"/>
          </spring:url>
          <a href="${fn:escapeXml(feedUrl)}" rel="alternate" type="application/atom+xml">订阅</a>
        </td>
      </tr>
    </table>
  </c:forEach>
  
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
