<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation" style='text-overflow: ellipsis;'>
  <!-- Navigation Level 3 -->
  <div id="db_results"></div>
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" id="left_menu">
  </dl>
</div>

<script type="text/javascript">
//drag and drop �̺�Ʈ �ڵ鷯
//���� ���丮��
//Web SQL Database
//http://slides.html5rocks.com �� å�� �Բ� ����

	var left_menu = document.querySelector('#left_menu');
	//�ش� �Խ��� url�� �̵�
	function jump(tmp) {
		//alert(document.getElementById('left_menu').innerHTML);
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}

	//�巡�� ���۽� ó��
	function onDragStart(event){
		if(event.target.tagName.toLowerCase() == 'dt'){
			event.dataTransfer.setData('text',event.target.id);		//text�� �ϴϱ� �Դ´� ������~
		}else{
			event.preventDefault();
		}
	}

	//drop�̺�Ʈ �ڵ鷯
	function onDrop(event){
		//alert(event.target.outerHTML);
		var drag_zone = event.dataTransfer.getData('text');	//�ű�� ���̵�(�嵮 �̰� �ȴ� �̤�_text�� �ϴϱ� ��..)
		var drag_zone_inner = document.getElementById(drag_zone).innerHTML;					//�ű�� ����
		var dt = document.getElementById(drag_zone);

		var drop_zone = event.target.id;				//�ű���� �ִ� �� ���̵�
		var drop_zone_inner = document.getElementById(drop_zone).innerHTML;					//�ű���� �ִ� �� ����

		if(dt && dt.parentNode == event.currentTarget){		//���� ��� å�� Ʋ���ǰ�? ��...
			//å�� �ִ� �ҽ��� �� �ȵǼ�...�� cross ���״�.
			document.getElementById(drop_zone).innerHTML = '';
			document.getElementById(drop_zone).innerHTML = drag_zone_inner;
			document.getElementById(drag_zone).innerHTML = '';
			document.getElementById(drag_zone).innerHTML = drop_zone_inner;
		}

		//var id = event.dataTransfer.getData('text');
		//var dt = document.getElementById(id);
		//if(dt && dt.parentNode == event.currentTarget){
			//dt.parentNode.removeChild(dt);
			//event.currentTarget.appendChild(dt);
		//}
		event.stopPropagation();

		//���� ���丮�� ����
		localStorage['leftmenu_storage'] = left_menu.innerHTML;
	}

	//dragover�̺�Ʈ �ڵ鷯_drop�� �޾Ƶ��̵��� �⺻ ���¸� �����
	function onDragOver(event){
		if (event.preventDefault) event.preventDefault(); // allows us to drop
	    event.dataTransfer.dropEffect = 'copy';
	    return false;
	}	

	function onDragEnter(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    return false;
	}

	window.onload = function (){ 
		//localStorage.clear();	//���丮�� ����
		//���� ���丮�� �ҷ�����
		var tmp = localStorage['leftmenu_storage'];
		if(!(tmp == 'undefined' || tmp == '' || tmp == 'null' || tmp == null)){
			//���� ���丮���� �����Ͱ� ������ �ش� �����͸� �����ͼ� ����
			left_menu.innerHTML = tmp;
		}else{
			//���� ���丮���� �����Ͱ� ������ Web SQL Database�� ������ �ҷ�����
			var db;
			db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 200000);
			db.transaction(function(tx) {
				tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
					//alert(result.rows.length);
					var tmp2 = '';
					for (var i = 0, item = null; i < result.rows.length; i++) {
						item = result.rows.item(i);
						tmp2 = tmp2 + 
							'<dt draggable="true" id="'
							+ item['id']
							+'" onClick="jump(\''
							+item['id']
							+'\')" class="dtcss" >'
							+item['name']
							+'</dt>';
					}
					left_menu.innerHTML = tmp2;
				});
			});
		}
	}

</script>