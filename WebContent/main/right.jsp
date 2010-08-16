<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//ContextPath
String cPath = request.getContextPath();

%> 
<script>
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

<aside id="right"><!-- start right sidebar -->	

	<div class="box">
		<h3>Login</h3>
		<div class="inner">
			
		  <c:if test="${empty member}">
	        <form method="post" action="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/login2.jsp"> 
	          <p><input type="hidden" name="returnPath" value="http://localhost:8080/html5" /></p>
	          <p><label for="username_2" class="top">ID:</label><br />
	            <input type="text" name="id" id="username_2" tabindex="1" class="field" required placeholder="input ID"></p>
	          <p><label for="password_2" class="top">Password:</label><br />
	            <input type="password" name="password" id="password_2" tabindex="2" class="field" required></p>
	          <p><input type="submit" class="button" value="LOGIN"  /></p>
	          <p>
	          <a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/form.jsp" id="forgotpsswd_2"><input type="button" id="forgotpsswd_2" class="button" value="ȸ������" /></a>
	          </p>
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
	</div><!-- .box -->

	<div class="box">
		<h3>Chatting</h3>
		<div class="inner">
			<p><a href="javascript:openSubWindow();">Chatting Popup</a></p>
    	</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>AD</h3>
			<div class="inner">
				<a href="<%=cPath %>/main/f.jsp?http://www.innorix.com/DS/" title="��뷮 ����/���� ���ε� ������Ʈ" target="innorix">
					���ε�� InnoDS
				</a><br/>
				<a href="<%=cPath %>/main/f.jsp?http://www.imaso.co.kr/" title="���α׷��Ӹ� ���� ����" target="imaso">
					���� Magazine
				</a><br/>
				<a href="<%=cPath %>/main/f.jsp?http://bit.ly/au0bGN" title="�������� ����ǽ�" target="godofmath">
					�������� ����ǽ�
				</a><br/>
				<a href="/f.jsp?http://bit.ly/cIQ7fA" title="�ȵ���̵� ����ȯ�� ����" target="android">
					[����]�ȵ���̵� ���߸Ŵ���1
				</a><br/>
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>LINK</h3>
			<div class="inner">
				<a href="http://cafe.naver.com/appleswing" title="���ý�����ī�� ����������ڿ��� ���� ��õ�մϴ�. ^^; ���� 14�� �����߽��ϴ�." target="swing">
   					���ý�����ī��
   				</a><br/>
   				<a href="http://it.nodong.net/zbxe/?mid=JOBQNA01" title="ȸ��,����,��� ���� �̾߱� it.nodong.net" target="jobqna">
   					����Q&amp;A
   				</a>
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>sponsored by</h3>
			<div class="inner">
				<a href="http://www.80port.com/community" target="_blank" title="www.80port.com
	 				okjsp standalone ȣ���� ����, ���� �����ϴ�."> 
					<img src="http://www.okjsp.pe.kr/images/bnr_80port.gif" width="88" height="31" border="0"></a> 
				<br /> 
				<a href="/f.jsp?http://www.cubrid.com/" target="_blank" title="okjsp Database"> 
					<img src="http://www.okjsp.pe.kr/images/banner/cubrid_88x31.gif" width="88" height="31" border="0"></a> 
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	