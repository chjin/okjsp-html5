<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<h3>����</h3>
		<div class="inner" align="center">
			<a href="<%=cPath %>/main/f.jsp?http://open.egovframe.go.kr/seminar/20100723.html" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/egovframe.gif"
				alt="�������� ǥ�������ӿ�ũ egovframe"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.adoberia.co.kr/iwt/blog/blog.php?tn=flex&id=468&src=image&kw=00003B" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/welove_134x60.gif"
			alt="WE Love the Web, Flash, HTML5, Choice"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.apptalk.tv" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/apptalk_134x60.jpg"
				alt="http://www.okjsp.pe.kr������ ��� ���� ��������. ���� ��� ��, ����"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.devgear.co.kr/" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/embarcadero_134x60.gif"
				alt="���ߵ����� ��, ������ Ʃ���Դϴ�."
			></a>
    	</div>
	</div><!-- .box -->

	<div class="box">
		<h3>Chatting</h3>
		<div class="inner">
			<p align="center"><a href="javascript:openSubWindow();">Chatting Popup</a></p>
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
				<a href="<%=cPath %>/main/f.jsp?http://bit.ly/cIQ7fA" title="�ȵ���̵� ����ȯ�� ����" target="android">
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
			<div class="inner" align="center">
				<a href="http://www.80port.com/community" target="_blank" title="www.80port.com
	 				okjsp standalone ȣ���� ����, ���� �����ϴ�."> 
					<img src="http://www.okjsp.pe.kr/images/bnr_80port.gif" width="88" height="31" border="0"></a> 
				<br /> 
				<a href="<%=cPath %>/main/f.jsp?http://www.cubrid.com/" target="_blank" title="okjsp Database"> 
					<img src="http://www.okjsp.pe.kr/images/banner/cubrid_88x31.gif" width="88" height="31" border="0"></a> 
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>Maso Widget</h3>
			<div class="inner" id="imaso_div" align="center">
				<script type="text/javascript">
				<!--
				imaso_ad_client = "pub-31415924";
				//-->
				</script> 
				<script type="text/javascript" src="http://widget.imaso.co.kr/pagead/show_ads.js"></script>  
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>���ͻ���Ʈ</h3>
			<div class="inner" align="center">
				<a href="http://simples.kr/" target="_blank"> 
					<img src="http://www.okjsp.pe.kr/images/bnr_simples.png" alt="simples.kr"></a>
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	