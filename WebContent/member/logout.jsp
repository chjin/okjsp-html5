<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil"%>
<%
    CommonUtil.setCookie(response, "okid", "", 0);
    session.invalidate();
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
<script type="text/javascript">
$(document).ready(function() {
    setTimeout("top.location.replace('/')", 1000);
});
</script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../main/header.jsp" />
    <section>
        <div id="container">
            <div id="contentinner">
                <!-- ���� ������_����======================================= -->
                <p>�̿��� �ּż� �����մϴ�.</p>
                <!-- ���� ������_��======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->
        <jsp:include page="../main/left.jsp" />
    </section>
    <jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>