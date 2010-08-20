<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.DomainUtil, kr.pe.okjsp.util.CommonUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memberHandler" class="kr.pe.okjsp.member.MemberHandler" />
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login</title>
</head>
<body>
<c:catch var="except">
<%
  if (memberHandler.doLogin(member) == 1) {
    pageContext.setAttribute("returnPath", DomainUtil.getFixedURL(request.getParameter("returnPath")));
    int daysOfCookieRemain = 60 * 24 * 90;
    CommonUtil.setCookie(response, "sid", Long.toString(member.getSid()), daysOfCookieRemain);
    CommonUtil.setCookie(response, "okid", member.getId(), daysOfCookieRemain);
%>
    <p>${member.id}님 반갑습니다.</p>
<%
  }
%>
</c:catch>

${except.message}
<c:if test="${!empty returnPath}">
<p><a href="${returnPath}">${returnPath}</a></p>
</c:if>
<c:if test="${empty returnPath}">
<a href="#" onclick="history.go(-2)">뒤로</a>
</c:if>
</body>
</html>