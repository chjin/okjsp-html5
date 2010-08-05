<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
session.removeAttribute("member");
String cPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- ũ��  ������ ���� -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />
<style type="text/css">
</style>
<script type="text/javascript" src="<%=cPath%>/js/prototype.js"></script>
<script type="text/javascript">
  Event.observe(window, 'load', function(e) {
    Event.observe('icon-drop', 'dragover', function(e) {
      e.stopPropagation();
      e.preventDefault();
    }, true);
    Event.observe('icon-drop', 'drop', function(e) {
      e.stopPropagation();
      e.preventDefault();
      
      var files = e.dataTransfer.files;
      alert(files.length);
    }, true);
  }, true);
</script>
<title>OKJSP_HTML5</title>
</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">

    <!-- header -->
    <jsp:include page="/main/header.jsp" />

    <!-- ��� ī�װ�(���ο����� ���� �˸�),�˻�_���� -->
    <aside class="header-breadcrumbs">
      <!-- ���۾˸� -->   
      <ul>
        <li>13���� ���ñ��� �ö�Խ��ϴ�</li>
      </ul>

      <!-- �˻�_���� -->                  
      <div class="searchform">
        <form action="index.html" method="get">
          <fieldset> 
            <input name="field" class="field"  placeholder="Search..." />
            <input type="submit" name="button" class="button" value="GO!" />
          </fieldset>
        </form>
      </div>
      <!-- �˻�_�� -->
    </aside>
    <!-- ��� ī�װ�,�˻�_��-->
    
    <div class="main">
      <!-- �����޴� -->
      <jsp:include page="/main/left.jsp" />
      
      <!-- ���� ������_����======================================= -->
      <div class="main-content">

        <div class="column1-unit">
          <div class="contactform">
            <form method="post" action="index.html">
              <fieldset><legend>&nbsp;okjsp.pe.kr ȸ������&nbsp;</legend>
                <p><label for="contact_email" class="left">Email:</label>
                   <input type="email" name="contact_email" id="contact_email" class="field" autofocus required /></p>
                <p><label for="contact_id" class="left">ID:</label>
                   <input type="text" name="contact_id" id="contact_id" class="field" required /></p>
                <p><label for="contact_name" class="left">Name:</label>
                   <input type="text" name="contact_name" id="contact_name" class="field" required /></p>
                <p><label for="contact_url" class="left">Website:</label>
                   <input type="text" name="contact_url" id="contact_url" class="field" /></p>
                <p><label for="contact_url" class="left">Mailling:</label>
                   <span class="item first"><input type="radio" name="contact_mailling" id="contact_mailling_y" /><label class="" for="contact_mailling_y">���</label></span>
                   <span class="item"><input type="radio" name="contact_mailling" id="contact_mailling_n" checked /><label class="" for="contact_mailling_n">�ź�</label></span>
                   <span class="guide">okjsp���� ������������ �����ϴ� �������Ϳ� ȫ������ ���� �����Դϴ�.</span>
                   </p>
              </fieldset>
              <fieldset><legend>&nbsp;Icon&nbsp;</legend>
                <div style="padding:10px;">
                  <p id="icon-drop" style="padding:25px; border:2px dashed #bbb; color:#bbb; display:block; border-radius:5px; font:normal normal normal 20pt/normal bold, Tahoma;"
                      ondragover="" ondragleave="">Drop files here</p>
                </div>
              </fieldset>
              <fieldset><legend>&nbsp;Info&nbsp;</legend>
                <p style="padding-left:15px;">���Խ� �ӽú�й�ȣ�� ���Ϸ� �߼۵˴ϴ�.<br>�α��� �� ��й�ȣ�� �ٲ��ֽñ� �ٶ��ϴ�.</p>
              </fieldset>
            </form>
          </div>              
        </div>

      </div>
      <!-- ���� ������_��========================================== -->
      <!-- ���� ����_���� ȭ�� �ܿ��� ���� �ϰ� �۾�... -->
      <!-- �α��ο��� �������� ��� �ɵ�. -->
      <!-- jsp:include page="/main/right.jsp" / -->
    </div>

    <!-- footer -->
    <jsp:include page="/main/footer.jsp" />
  </div>
</body>
</html>