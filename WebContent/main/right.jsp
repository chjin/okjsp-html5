<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
      <form method="post" action="index.html"> 
        <p><input type="hidden" name="rememberme" value="0" /></p>
        <fieldset>
          <p><label for="username_2" class="top">User:</label><br />
            <input type="text" name="username_2" id="username_2" tabindex="1" class="field" onkeypress="return webLoginEnter(document.loginfrm.password);" value="" /></p>
       <p><label for="password_2" class="top">Password:</label><br />
            <input type="password" name="password_2" id="password_2" tabindex="2" class="field" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></p>
       <p><input type="checkbox" name="checkbox" id="checkbox_2" class="checkbox" tabindex="3" size="1" value="" onclick="webLoginCheckRemember()" /><label for="checkbox_1" class="right">Remember me</label></p>
       <p><input type="submit" name="cmdweblogin" class="button" value="LOGIN"  /></p>
       <p><a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpsswd_2">Password forgotten?</a></p>
     </fieldset>
      </form>
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
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
  </div>
  
  <div class="subcontent-unit-border-green">
    <div class="round-border-topleft"></div><div class="round-border-topright"></div>
    <h1 class="green">���� ����2</h1>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
  </div>
  
</div>