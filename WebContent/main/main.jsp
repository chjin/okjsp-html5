<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
String cPath = request.getContextPath();

%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- ũ��  ������ ���� -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />
<script type="text/javascript">

</script>
<title>OKJSP_HTML5</title>
</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">
	
	<!-- header -->
    <jsp:include page="header.jsp"></jsp:include>

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
      <jsp:include page="left.jsp"></jsp:include>
      
      <!-- ���� ������_����======================================= -->
      <div class="main-content">
        <!-- ��õ ����_���� -->
        <div class="column1-unit">
          <h1 class="pagetitle">��õ ����</h1>
          <p/> 
	        <table border='1' bordercolor='blue' width="100%">
	          <tr>
	      		<td height="180" width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	          </tr>
	        </table>
          <p/>
        </div>
        <!-- ��õ ����_��-->
 
        <!-- ��������_���� -->
        <div class="column1-unit">
          <h1 class="pagetitle">���� ����</h1>
          <p/> 
		    <table border='1' bordercolor='blue' width="100%">
	          <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
	        </table>
	      <p/> 
        </div>
        <!-- ��������_�� -->
 
        <!-- ��ü�Խ���_���� -->
        <div class="column1-unit">
          <h1 class="pagetitle">��ü�Խ���</h1>
          <p/> 
			<table border='1' bordercolor='blue' width="100%">
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
			</table>
	      <p/> 
        </div>
        <!-- ��ü�Խ���_�� --> 
      </div>
      <!-- ���� ������_��========================================== -->
	  <!-- ���� ����_���� ȭ�� �ܿ��� ���� �ϰ� �۾�... -->
	  <jsp:include page="right.jsp"></jsp:include> 
    </div>
    <!-- footer -->    
    <jsp:include page="footer.jsp"></jsp:include> 
  </div> 
</body>
</html>