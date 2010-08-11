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
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<style type="text/css">
#preview { padding:10px 10px 0 10px; }
#icon-drop { margin-bottom: 15px; padding: 25px; border: 2px dashed #bbb; color: #bbb; border-radius: 5px; font: normal normal normal 20pt/normal bold, Tahoma; }
#icon-drop.drop { border-color: red !important; }
#icon { margin-bottom: 15px; padding: 25px; border: 2px dashed #bbb; color: #bbb; display: none; border-radius: 5px; font: normal normal normal 20pt/normal bold, Tahoma; }
#icon img { max-width: 320px; }
</style>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery.ndd.js"></script>
<script>
  $(document).ready(function() {
    $('#icon-drop').droppable(
        'Files',
        function() {
          $(this).addClass('drop');
        },
        function() {
          $(this).removeClass('drop');
        },
        function(e) {
          e.stopPropagation();
          e.preventDefault();

          var files = e.dataTransfer.files;
          if (files.length != 1) {
              return;
          }

          var file = files[0];
          if (!file.type.match(/image.*/)) {
            return;
          }

          var img = document.createElement('img');
          img.file = file;

          var xhr = new XMLHttpRequest();
          xhr.open('post', 'upload.jsp', true);
          xhr.onreadystatechange = function() {
            if (this.readyState != 4) {
              return;
            }
            var responseJSON = eval('(' + this.responseText + ')');
            $('#icon').hide().empty();
            $('<img src="' + responseJSON['path'] + '">').appendTo('#icon')
              .load(function() {
                $(this).css({opacity: 0});
            	$('#icon').slideDown(600, function() {
                  $('#icon img').animate({opacity: 1}, 1200);
            	});
              });
          };
          xhr.setRequestHeader('Content-Type', 'multipart/form-data');
          xhr.setRequestHeader('X-File-Name', file.fileName);
          xhr.setRequestHeader('X-File-Size', file.fileSize);
          xhr.send(file);
        }
      );
  });
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
                <div id="preview">
                  <div id="icon-drop">Drop the image</div>
                  <div id="icon"></div>
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