<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String cPath = request.getContextPath();
%>
<script type="text/javascript" language="JavaScript">
	var lNextWindowId = 1;	// Chatting Popup �� �׻� ���ο� �̸����� ���������ϴ� ���а�

	// OKJSP Chatting Popup
	function openSubWindow() {
		window.open(
		"<%=cPath%>/chat/chat.jsp",
		"chatWindow" + lNextWindowId,
		"width=900,height=550,left=" + (50 + lNextWindowId * 30) + ",top=" + (50 + lNextWindowId * 25)
	);
		lNextWindowId++;
		if( lNextWindowId > 10 ) {
			lNextWindowId = 1;
		}
	}
</script>
<div class="main-subcontent">
  <!-- ���� �α���_���� -->
  <div class="subcontent-unit-border-blue">
    <div class="round-border-topleft"></div><div class="round-border-topright"></div>
    <h1 class="blue">Login</h1>
    <div class="loginform">
      <c:if test="${empty member}">
        <form method="post" action="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/login2.jsp"> 
          <p><input type="hidden" name="returnPath" value="http://localhost:8080/html5" /></p>
          <fieldset>
            <p><label for="username_2" class="top">ID:</label><br />
              <input type="text" name="id" id="username_2" tabindex="1" class="field" required></p>
            <p><label for="password_2" class="top">Password:</label><br />
              <input type="password" name="password" id="password_2" tabindex="2" class="field" required></p>
            <p><input type="submit" class="button" value="LOGIN"  /></p>
            <p><a href="#" id="forgotpsswd_2">Password forgotten?</a></p>
          </fieldset>
        </form>
      </c:if>
      <c:if test="${!empty member}">
        <fieldset class="member">
          <p><a href="#">${member.id} /info</a></p>
          <p><a href="#">Logout</a></p>
          <p><a href="#">å����</a></p>
        </fieldset>
      </c:if>
    </div>
  </div>
  <!-- ���� �α���_�� --> 
  
  
  <div class="subcontent-unit-border-orange">
    <div class="round-border-topleft"></div><div class="round-border-topright"></div>
    <h1 class="orange">ä�� ����</h1>
    <p><a href="javascript:openSubWindow();">Chatting Popup</a></p>
  </div>
  
  <div class="subcontent-unit-border">
    <div class="round-border-topleft"></div><div class="round-border-topright"></div>
    <h1>���� ����1</h1>
    <p> <a href="bbs?act=LIST&bbs=lifeqna">�Խ��� ��¾��</a> </p>
  </div>
  
  <div class="subcontent-unit-border-green">
    <div class="round-border-topleft"></div><div class="round-border-topright"></div>
    <h1 class="green">���� ����2</h1>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
  </div>
  
</div>