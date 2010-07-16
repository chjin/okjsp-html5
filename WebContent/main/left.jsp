<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation">
  <!-- Navigation Level 3 -->
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" id="left_menu">
  						
    <dt draggable="true" id='html5'         onClick="jump('html5'       )" class="dtcss">HTML5              </dt>
    <dt draggable="true" id='techtrend'     onClick="jump('techtrend'   )" class="dtcss">TECH TREND         </dt>
    <dt draggable="true" id='lecture'       onClick="jump('lecture'     )" class="dtcss">����                   </dt>
    <dt draggable="true" id='TOOL'          onClick="jump('TOOL'        )" class="dtcss">������             </dt>
    <dt draggable="true" id='TOOLqna'       onClick="jump('TOOLqna'     )" class="dtcss">������ QnA         </dt>
    <dt draggable="true" id='ajax'          onClick="jump('ajax'        )" class="dtcss">Ajax                   </dt>
    <dt draggable="true" id='ajaxqna'       onClick="jump('ajaxqna'     )" class="dtcss">Ajax QnA               </dt>
    <dt draggable="true" id='bbs2'          onClick="jump('bbs2'        )" class="dtcss">DB Tips                </dt>
    <dt draggable="true" id='bbs1'          onClick="jump('bbs1'        )" class="dtcss">DB QnA             </dt>
    <dt draggable="true" id='bbs4'          onClick="jump('bbs4'        )" class="dtcss">JSP Tips           </dt>
    <dt draggable="true" id='bbs3'          onClick="jump('bbs3'        )" class="dtcss">JSP QnA                </dt>
    <dt draggable="true" id='weblogic'      onClick="jump('weblogic'    )" class="dtcss">j2ee Tips          </dt>
    <dt draggable="true" id='weblgqna'      onClick="jump('weblgqna'    )" class="dtcss">j2ee QnA               </dt>
    <dt draggable="true" id='xmltip'        onClick="jump('xmltip'      )" class="dtcss">XML Tips           </dt>
    <dt draggable="true" id='xmlqna'        onClick="jump('xmlqna'      )" class="dtcss">XML QnA                </dt>
    <dt draggable="true" id='ruby'          onClick="jump('ruby'        )" class="dtcss">Ruby on Rails       </dt>
    <dt draggable="true" id='rubyqna'       onClick="jump('rubyqna'     )" class="dtcss">Ruby on Rails QnA   </dt>
    <dt draggable="true" id='flex'          onClick="jump('flex'        )" class="dtcss">Flex                   </dt>
    <dt draggable="true" id='flexqna'       onClick="jump('flexqna'     )" class="dtcss">Flex QnA               </dt>
    <dt draggable="true" id='bbs7'          onClick="jump('bbs7'        )" class="dtcss">�ҽ��ڷ��         </dt>
    <dt draggable="true" id='docs'          onClick="jump('docs'        )" class="dtcss">�����ڷ��         </dt>
    <dt draggable="true" id='etc'           onClick="jump('etc'         )" class="dtcss">��Ÿ�ڷ��         </dt>
    <dt draggable="true" id='bbs6'          onClick="jump('bbs6'        )" class="dtcss">��� ���          </dt>
    <dt draggable="true" id='japanlife'     onClick="jump('japanlife'   )" class="dtcss">�Ϻ���¾��           </dt>
    <dt draggable="true" id='bbs5'          onClick="jump('bbs5'        )" class="dtcss">�Ӹ������� ��      </dt>
    <dt draggable="true" id='movie'         onClick="jump('movie'       )" class="dtcss">movie story            </dt>
    <dt draggable="true" id='howmuch'       onClick="jump('howmuch'     )" class="dtcss">�󸶸��               </dt>
    <dt draggable="true" id='lifeqna'       onClick="jump('lifeqna'     )" class="dtcss">�ǰ���...          </dt>
    <dt draggable="true" id='news'          onClick="jump('news'        )" class="dtcss">�����������           </dt>
    <dt draggable="true" id='solo'          onClick="jump('solo'        )" class="dtcss">�̱��� ����            </dt>
    <dt draggable="true" id='recruit'       onClick="jump('recruit'     )" class="dtcss">����/����/ȫ��     </dt>
    <dt draggable="true" id='engdocs'       onClick="jump('engdocs'     )" class="dtcss">english bbs         </dt>
    <dt draggable="true" id='krtomcat'      onClick="jump('krtomcat'    )" class="dtcss">����                   </dt>
    <dt draggable="true" id='link'          onClick="jump('link'        )" class="dtcss">��õ����Ʈ         </dt>
    <dt draggable="true" id='goodjob'       onClick="jump('goodjob'     )" class="dtcss">����ȸ��               </dt>
    <dt draggable="true" id='market'        onClick="jump('market'      )" class="dtcss">����                   </dt>
    <dt draggable="true" id='model2jsp'     onClick="jump('model2jsp'   )" class="dtcss">��2JSPå����     </dt>
    <dt draggable="true" id='notice'        onClick="jump('notice'      )" class="dtcss">��������               </dt>
    <dt draggable="true" id='okboard'       onClick="jump('okboard'     )" class="dtcss">�ڷ�ǹ���         </dt>
    <dt draggable="true" id='useful'        onClick="jump('useful'      )" class="dtcss">������ ����            </dt>
    <dt draggable="true" id='mac'           onClick="jump('mac'         )" class="dtcss">�� ����                </dt>
    <dt draggable="true" id='ihaveadream'   onClick="jump('ihaveadream' )" class="dtcss">���δ� �����ڸ� ����</dt>
    <dt draggable="true" id='javastudy'     onClick="jump('javastudy'   )" class="dtcss">���α׷����ʽ��͵� </dt>
    <dt draggable="true" id='ns'            onClick="jump('ns'          )" class="dtcss">�ڹ�����1��            </dt>
    <dt draggable="true" id='dbstudy'       onClick="jump('dbstudy'     )" class="dtcss">DB���͵�               </dt>
    <dt draggable="true" id='springstudy'   onClick="jump('springstudy' )" class="dtcss">������ ���͵�      </dt>
    <dt draggable="true" id='xf'            onClick="jump('xf'          )" class="dtcss">SLF                    </dt>
    <dt draggable="true" id='twitter'       onClick="jump('twitter'     )" class="dtcss">Ʈ����             </dt>
    <dt draggable="true" id='trash'         onClick="jump('trash'       )" class="dtcss">«��                   </dt>
  </dl>
</div>

<script type="text/javascript">
//http://slides.html5rocks.com
//�� å�� ���� ����...
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
		var id_before = event.dataTransfer.getData('text');	//�ű�� ���̵�(�嵮 �̰� �ȴ� �̤�_text�� �ϴϱ� ��..)
		var id_before_inner = document.getElementById(id_before).innerHTML;					//�ű�� ����
		var dt = document.getElementById(id_before);

		var id_after = event.target.id;				//�ű���� �ִ� �� ���̵�
		var id_after_inner = document.getElementById(id_after).innerHTML;					//�ű���� �ִ� �� ����

		if(dt && dt.parentNode == event.currentTarget){		//���� ��� å�� Ʋ���ǰ�? ��...
			//å�� �ִ� �ҽ��� �� �ȵǼ�...�� cross ���״�.
			document.getElementById(id_after).innerHTML=id_before_inner;
			document.getElementById(id_before).innerHTML=id_after_inner;
		}

		//var id = event.dataTransfer.getData('text');
		//var dt = document.getElementById(id);
		//if(dt && dt.parentNode == event.currentTarget){		//���� ��� å�� Ʋ���ǰ�? ��...
			//dt.parentNode.removeChild(dt);
			//event.currentTarget.appendChild(dt);
		//}
		event.stopPropagation();
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


</script>