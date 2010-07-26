<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation" style='text-overflow: ellipsis;'>
  <!-- Navigation Level 3 -->
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" 
  						ondragleave="onDragLeave(event)"    id="left_menu">
  </dl>
</div>

<script>
//drag and drop �̺�Ʈ �ڵ鷯
//���� ���丮��
//Web SQL Database
//http://slides.html5rocks.com �� å�� �Բ� ����

	var left_menu = document.querySelector('#left_menu');
	//�ش� �Խ��� url�� �̵�
	function jump(tmp) {
		//alert(document.getElementById('left_menu').innerHTML);
		document.location.href='/html5/bbs?act=LIST&bbs='+tmp;
	}

	//�巡�� ���۽� ó��
	function onDragStart(event){
		if(event.target.tagName.toLowerCase() == 'dt'){
			event.dataTransfer.setData('text',event.target.id);		//text�� �ϴϱ� �Դ´� ������~
			document.getElementById(event.target.id).className = 'hovering';
		}else{
			event.preventDefault();
		}
	}

	//drop�̺�Ʈ �ڵ鷯
	function onDrop(event){
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

			document.getElementById(drop_zone).className = 'dtcss';
			document.getElementById(drag_zone).className = 'dtcss';
		}

		//var id = event.dataTransfer.getData('text');
		//var dt = document.getElementById(id);
		//if(dt && dt.parentNode == event.currentTarget){
			//dt.parentNode.removeChild(dt);
			//event.currentTarget.appendChild(dt);
		//}
		event.stopPropagation();

		//���� ���丮�� ����_���� �Űܳ��� �޴� �״�� �����ϱ� ����...
		localStorage['leftmenu_storage'] = left_menu.innerHTML;
	}

	//dragover�̺�Ʈ �ڵ鷯_drop�� �޾Ƶ��̵��� �⺻ ���¸� �����
	function onDragOver(event){
		if (event.preventDefault) event.preventDefault(); // allows us to drop
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'hovering';
	    return false;
	}	

	function onDragEnter(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'hovering';
	    return false;
	}

	//drag�� �������� �� �� �߻�
	function onDragLeave(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'dtcss';
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
			db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 2 * 1024 * 1024);
			db.transaction(function(tx) {
				tx.executeSql('CREATE TABLE IF NOT EXISTS okboard_category ( seq  numeric, id text, name text)');
				tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
					var tmp2 = '';
					if(result.rows.length == 0){
						//�׳� �غ��� �;�� ������~
						tx.executeSql("insert into okboard_category(seq,id,name) values(1,'html5'       ,'HTML5')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(2,'techtrend'   ,'TECH TREND')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(3,'lecture'     ,'����')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(4,'TOOL'        ,'������')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(5,'TOOLqna'     ,'������ QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(6,'ajax'        ,'Ajax')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(7,'ajaxqna'     ,'Ajax QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(8,'bbs2'        ,'DB Tips')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(9,'bbs1'        ,'DB QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(10,'bbs4'       ,'JSP Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(11,'bbs3'       ,'JSP QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(12,'weblogic'   ,'j2ee Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(13,'weblgqna'   ,'j2ee QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(14,'xmltip'     ,'XML Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(15,'xmlqna'     ,'XML QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(16,'ruby'       ,'Ruby on Rails')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(17,'rubyqna'    ,'Ruby on Rails QnA')	");
						tx.executeSql("insert into okboard_category(seq,id,name) values(18,'flex'       ,'Flex')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(19,'flexqna'    ,'Flex QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(20,'bbs7'       ,'�ҽ��ڷ��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(21,'docs'       ,'�����ڷ��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(22,'etc'        ,'��Ÿ�ڷ��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(23,'bbs6'       ,'��� ���')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(24,'japanlife'  ,'�Ϻ���¾��')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(25,'bbs5'       ,'�Ӹ������� ��')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(26,'movie'      ,'movie story')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(27,'howmuch'    ,'�󸶸��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(28,'lifeqna'    ,'�ǰ���...')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(29,'news'       ,'�����������')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(30,'solo'       ,'�̱��� ����')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(31,'recruit'    ,'����/����/ȫ��')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(32,'engdocs'    ,'english bbs')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(33,'krtomcat'   ,'����')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(34,'link'       ,'��õ����Ʈ')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(35,'goodjob'    ,'����ȸ��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(36,'market'     ,'����')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(37,'model2jsp'  ,'��2JSPå����')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(38,'notice'     ,'��������')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(39,'okboard'    ,'�ڷ�ǹ���')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(40,'useful'     ,'������ ����')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(41,'mac'        ,'�� ����')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(42,'ihaveadream','���δ� �����ڸ� ����')");
						tx.executeSql("insert into okboard_category(seq,id,name) values(43,'javastudy'  ,'���α׷����ʽ��͵�')	");
						tx.executeSql("insert into okboard_category(seq,id,name) values(44,'ns'         ,'�ڹ�����1��')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(45,'dbstudy'    ,'DB���͵�')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(46,'springstudy','������ ���͵�')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(47,'xf'         ,'SLF')					");
						tx.executeSql("insert into okboard_category(seq,id,name) values(48,'twitter'    ,'Ʈ����')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(49,'trash'      ,'«��')				");
					}
					tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
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
			});
		}





		



















		
	}

</script>