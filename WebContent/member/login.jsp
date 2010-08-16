<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%
//ContextPath
session.removeAttribute("member");
String cPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- ũ��  ������ ���� -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/member.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../main/header.jsp" />
    <section>
        <div id="container">
            <div id="contentinner">
                <!-- ���� ������_����======================================= -->
                <div class="contactform">
                    <form method="post" action="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/login2.jsp"> 
                        <input type="hidden" name="returnPath" value="<%= CommonUtil.nchk(request.getParameter("returnPath"), "/") %>">
                        <fieldset><legend>Login</legend>
                            <p><label for="username_1" class="top left">ID:</label><br />
                                <input type="text" name="id" id="username_1" tabindex="1" class="field" autofocus required /></p>
                            <p><label for="password_1" class="top left">Password:</label><br />
                                <input type="password" name="password" id="password_1" tabindex="2" class="field" required /></p>
                             <p>
                                <input type="submit" class="button" value="JOIN" style="float:none;">
                                <input type="button"" class="button" value="CANCEL" style="float:none;">
                            </p>
                            <p><input type="submit" name="cmdweblogin" class="button" value="�α���"  /></p>
                            <p><a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/form.jsp" id="forgotpsswd_1">ȸ������</a></p>
                        </fieldset>
                    </form>
                </div>
                <!-- ���� ������_��======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->
        <jsp:include page="../main/left.jsp" />
    </section>
    <jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>