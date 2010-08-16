<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>    
<%
	String cPath  = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- ũ��  ������ ���� -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="<%=cPath%>/js/prototype.js"></script>
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
	<section>
		<div id="container">
			<div id="contentinner">
	   			<article> 
	   			<!-- ���� ������_����======================================= -->
					<h1>����������޹�ħ �� ȸ�����Ծ��</h1>
					<br/>
					<section>
						<h2>����������޹�ħ</h2>
						<br/>
						<jsp:include page="privacyPolicy.jsp" />
					</section>
					<section>
						<h2>ȸ�����Ծ��</h2>
						<br/>
						<jsp:include page="agree.html" />
					</section>
					<section align="center">
						�� ����������޹�ħ�� ȸ�����Ծ���� �����Ͻʴϱ�?
						<br/>
							<a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/form.jsp" id="forgotpsswd_2">
								<input type="button" id="forgotpsswd_2" class="button_two" value="�����մϴ�" />
							</a>
							<input type="button" class="button_two" value="���������ʽ��ϴ�" onClick="window.close()"/>
					</section>
			    <!-- ���� ������_��========================================== -->
				</article>
			</div><!-- #content-->
		</div><!-- #container--> 
		<jsp:include page="../main/left.jsp"></jsp:include>
	</section>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
