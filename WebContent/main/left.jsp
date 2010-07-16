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
  						ondrop="onDrop(event)" >
  						
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
	//�� �ȵǳ� ��.....
	//���ۿ��� �۾�.....
	//event.dataTransfer ���� ������ �� �԰� ���� ����....
	var aaaa = '';
	function jump(tmp) {
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}

	//�巡�� ���۽� ó��
	function onDragStart(event){
		//alert('onDragStart : '+event.target.id);
		if(event.target.tagName.toLowerCase() == 'dt'){
			//event.dataTransfer.setData("listItemId",event.target.id);
			//event.dataTransfer.setData("text/uri-list",event.target.id);
			event.dataTransfer.setData("URL",event.target.id);
			aaaa = event.target.id;
		}else{
			event.preventDefault();
		}
	}

	//drop�̺�Ʈ �ڵ鷯
	function onDrop(event){
		//var id = event.dataTransfer.getData('listItemId');		//���� �������� ���ϴ� ������....
		//var id = event.dataTransfer.getData('text/uri-list');
		//var id = event.dataTransfer.getData('URL');
		var id = aaaa;
		var dt = document.getElementById(id);
		if(dt && dt.parentNode == event.currentTarget){		//���� ��� å�� Ʋ���ǰ�? �ƴϸ� ���� �쿬�� �����ǰ�? ��..
			dt.parentNode.removeChild(dt);
			event.currentTarget.appendChild(dt);
		}
		event.stopPropagation();
	}

	//dragover�̺�Ʈ �ڵ鷯_����� �޾Ƶ��̵��� �⺻ ���¸� �����
	function onDragOver(event){
		//alert('onDragOver');
		event.preventDefault();
	}	

	//dataTransfer�� ����ִ� ������ Ÿ���� 'listItemId'�� ������������ �巡�׸� �޾Ƶ���
	function onDragEnter(event){
		var d_types = event.dataTransfer.types;
		for(var i=0 ; i<d_types.length ; i++){
			//if(types[i] == 'listItemId'){
			//if(types[i] == 'text/uri-list'){
			if(d_types[i] == 'URL'){
				//alert('2onDragEnter : '+types[i]);
				event.preventDefault();
				return;
			}
		}
	}


</script>