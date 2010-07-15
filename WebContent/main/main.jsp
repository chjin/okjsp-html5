<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
String cPath = request.getContextPath();

%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
    <%@ include file="header.jsp" %>

    <!-- ��� ī�װ�,�˻�_���� -->
    <aside class="header-breadcrumbs">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Category-1</a></li>
        <li><a href="#">Section-1.1</a></li>
        <li><a href="#">Content-1.1.1</a></li>          
      </ul>

      <!-- Search form -->                  
      <div class="searchform">
        <form action="index.html" method="get">
          <fieldset> 
            <input name="field" class="field"  placeholder="Search..." />
            <input type="submit" name="button" class="button" value="GO!" />
          </fieldset>
        </form>
      </div>
    </aside>
    <!-- ��� ī�װ�,�˻�_��-->
    
    <div class="main">
      <!-- �����޴� -->
      <%@ include file="left.jsp" %>
      
      <!-- ���� ������_����======================================= -->
      <div class="main-content">
        
        <!-- Pagetitle -->
        <h1 class="pagetitle">Multiflex-4 / Layout-4</h1>

        <!-- Content unit - One column -->
        <h1 class="block">1 - Column types</h1>
        <div class="column1-unit">
          <h1>Here comes the title</h1>                            
          <h3>Monday, 20 November 2006 at 20:30 GMT, by <a href="#">SiteAdmin </a></h3>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis. <a href="#">Read more &raquo;</a></p>
          <p class="details">| Posted by <a href="#">SiteAdmin </a> | Categories: <a href="#">General</a> | Comments: <a href="#">73</a> |</p>
          <h1><a href="">Heading h1 with link</a></h1>                            
          <h3>Heading h3</h3>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis. <a href="#">Read more &raquo;</a></p>
          <p class="details">Posting details ...  </p>
        </div>          
        <hr class="clear-contentunit" />

      </div>
      <!-- ���� ������_��========================================== -->
	  <!-- ���� ����_���� ȭ�� �ܿ��� ���� �ϰ� �۾�... -->
      <%@ include file="right.jsp" %> 
    </div>
    <!-- footer -->    
    <%@ include file="footer.jsp" %>
  </div> 
</body>
</html>