<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//ContextPath
String cPath = request.getContextPath();

%> 

<aside id="left"><!-- start left sidebar -->
    <div class="box">
        <h3>Login</h3>
        <div class="inner">
          <c:if test="${empty member}">
            <form method="post" action="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/login2.jsp"> 
              <p><input type="hidden" name="returnPath" value="http://localhost:8080/html5" /></p>
              <p><label for="username_2" class="top">ID:</label><br />
                <input type="text" name="id" id="username_2" tabindex="1" class="field" required placeholder="input ID"></p>
              <p><label for="password_2" class="top">Password:</label><br />
                <input type="password" name="password" id="password_2" tabindex="2" class="field" required></p>
              <p><input type="submit" class="button" value="LOGIN"  /></p>
              <p>
              <a href="<%= cPath %>/member/agreement.jsp" id="forgotpsswd_2"><input type="button" id="forgotpsswd_2" class="button" value="ȸ������" /></a>
              </p>
            </form>
          </c:if>
          <c:if test="${!empty member}">
            <fieldset class="member">
              <p align="center"><a href="#">${member.id}[�α�����]</a></p>
              <p align="center"><a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/info.jsp">${member.id} /info</a></p>
              <a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/logout.jsp"><input type="button" class="button" value="LOGOUT"  /></a>
              <input type="button" class="button" value="å����"  />
            </fieldset>
          </c:if>
        </div>
    </div><!-- .box -->

	<div class="box">
		<h3>BBS LIST</h3>
		<div class="inner">
			<ul ondragstart="onDragStart(event)"
				ondragenter="onDragEnter(event)" 
				ondragover="onDragOver(event)" 
				ondrop="onDrop(event)" 
				ondragleave="onDragLeave(event)"    id="left_menu">
			</ul>
		</div>
		<div align="center">
			<input type="button" class="button_two" value="�޴��ʱ�ȭ" onclick="javascript:reload()">
		</div>
	</div><!-- .box -->
</aside><!-- end left sidebar -->


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
		if(event.target.tagName.toLowerCase() == 'li'){
			event.dataTransfer.setData('text',event.target.id);		//text�� �ϴϱ� �Դ´� ������~
			document.getElementById(event.target.id).className = 'hovering';
		}else{
			event.preventDefault();
		}
	}

	//drop�̺�Ʈ �ڵ鷯
	function onDrop(event){
		var drag_zone = event.dataTransfer.getData('text');	//�ű�� ���̵�(�嵮 �̰� �ȴ� �̤�_text�� �ϴϱ� ��..)
		var drag_zone_outer = document.getElementById(drag_zone).outerHTML;					//�ű�� ����
		var li = document.getElementById(drag_zone);

		var drop_zone = event.target.id;				//�ű���� �ִ� �� ���̵�
		var drop_zone_outer = document.getElementById(drop_zone).outerHTML;					//�ű���� �ִ� �� ����

		if(li && li.parentNode == event.currentTarget){		//���� ��� å�� Ʋ���ǰ�? ��...
			//å�� �ִ� �ҽ��� �� �ȵǼ�...�� cross ���״�.
			document.getElementById(drag_zone).outerHTML = 
				"<div id='one'>"+document.getElementById(drag_zone).outerHTML+"</div>";

			document.getElementById(drop_zone).outerHTML = 
				"<div id='two'>"+document.getElementById(drop_zone).outerHTML+"</div>";

			document.getElementById('one').outerHTML = drop_zone_outer;
			document.getElementById('two').outerHTML = drag_zone_outer;
			
			//document.getElementById(drop_zone).innerHTML = '';
			//document.getElementById(drop_zone).outerHTML = drag_zone_outer;
			//document.getElementById(drag_zone).innerHTML = '';
			//document.getElementById(drag_zone).outerHTML = drop_zone_outer;
			
			document.getElementById(drop_zone).className = 'dtcss';
			document.getElementById(drag_zone).className = 'dtcss';
		}

		//var id = event.dataTransfer.getData('text');
		//var li = document.getElementById(id);
		//if(li && li.parentNode == event.currentTarget){
			//li.parentNode.removeChild(li);
			//event.currentTarget.appendChild(li);
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

	function reload(){
		localStorage.clear();	//���丮�� ����
		self.location.href = '<%=cPath%>';
	}

	function start(){
		//localStorage.clear();	//���丮�� ����(�ӽ�)
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
								'<li draggable="true" id="'
								+ item['id']
								+'" onClick="jump(\''
								+item['id']
								+'\')" class="dtcss" >'
								+item['name']
								+'</li>';
						}
						left_menu.innerHTML = tmp2;
					});
				});
			});
		}
	}

	start();
</script>