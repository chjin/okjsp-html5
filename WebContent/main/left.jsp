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
  <dl class="nav3-grid">
	<dt><a href="javascript:jump('html5"      )">HTML5					</a></dt>
	<dt><a href="javascript:jump('techtrend'  )">TECH TREND				</a></dt>
	<dt><a href="javascript:jump('lecture'    )">����					</a></dt>
	<dt><a href="javascript:jump('TOOL'       )">������					</a></dt>
	<dt><a href="javascript:jump('TOOLqna'    )">������ QnA				</a></dt>
	<dt><a href="javascript:jump('ajax'       )">Ajax					</a></dt>
	<dt><a href="javascript:jump('ajaxqna'    )">Ajax QnA				</a></dt>
	<dt><a href="javascript:jump('bbs2'       )">DB Tips				</a></dt>
	<dt><a href="javascript:jump('bbs1'       )">DB QnA					</a></dt>
	<dt><a href="javascript:jump('bbs4'       )">JSP Tips				</a></dt>
	<dt><a href="javascript:jump('bbs3'       )">JSP QnA				</a></dt>
	<dt><a href="javascript:jump('weblogic'   )">j2ee Tips				</a></dt>
	<dt><a href="javascript:jump('weblgqna'   )">j2ee QnA				</a></dt>
	<dt><a href="javascript:jump('xmltip'     )">XML Tips				</a></dt>
	<dt><a href="javascript:jump('xmlqna'     )">XML QnA				</a></dt>
	<dt><a href="javascript:jump('ruby'       )">Ruby on Rails			</a></dt>
	<dt><a href="javascript:jump('rubyqna'    )">Ruby on Rails QnA		</a></dt>
	<dt><a href="javascript:jump('flex'       )">Flex					</a></dt>
	<dt><a href="javascript:jump('flexqna'    )">Flex QnA				</a></dt>
	<dt><a href="javascript:jump('bbs7'       )">�ҽ��ڷ��				</a></dt>
	<dt><a href="javascript:jump('docs'       )">�����ڷ��				</a></dt>
	<dt><a href="javascript:jump('etc'        )">��Ÿ�ڷ��				</a></dt>
	<dt><a href="javascript:jump('bbs6'       )">��� ���				</a></dt>
	<dt><a href="javascript:jump('japanlife'  )">�Ϻ���¾��			</a></dt>
	<dt><a href="javascript:jump('bbs5'       )">�Ӹ������� ��			</a></dt>
	<dt><a href="javascript:jump('movie'      )">movie story			</a></dt>
	<dt><a href="javascript:jump('howmuch'    )">�󸶸��				</a></dt>
	<dt><a href="javascript:jump('lifeqna'    )">�ǰ���...				</a></dt>
	<dt><a href="javascript:jump('news'       )">�����������			</a></dt>
	<dt><a href="javascript:jump('solo'       )">�̱��� ����				</a></dt>
	<dt><a href="javascript:jump('recruit'    )">����/����/ȫ��			</a></dt>
	<dt><a href="javascript:jump('engdocs'    )">english bbs			</a></dt>
	<dt><a href="javascript:jump('krtomcat'   )">����					</a></dt>
	<dt><a href="javascript:jump('link'       )">��õ����Ʈ				</a></dt>
	<dt><a href="javascript:jump('goodjob'    )">����ȸ��				</a></dt>
	<dt><a href="javascript:jump('market'     )">����					</a></dt>
	<dt><a href="javascript:jump('model2jsp'  )">��2JSPå����			</a></dt>
	<dt><a href="javascript:jump('notice'     )">��������				</a></dt>
	<dt><a href="javascript:jump('okboard'    )">�ڷ�ǹ���				</a></dt>
	<dt><a href="javascript:jump('useful'     )">������ ����				</a></dt>
	<dt><a href="javascript:jump('mac'        )">�� ����					</a></dt>
	<dt><a href="javascript:jump('ihaveadream')">���δ� �����ڸ� ����		</a></dt>
	<dt><a href="javascript:jump('javastudy'  )">���α׷����ʽ��͵�		</a></dt>
	<dt><a href="javascript:jump('ns'         )">�ڹ�����1��				</a></dt>
	<dt><a href="javascript:jump('dbstudy'    )">DB���͵�				</a></dt>
	<dt><a href="javascript:jump('springstudy')">������ ���͵�			</a></dt>
	<dt><a href="javascript:jump('xf'         )">SLF					</a></dt>
	<dt><a href="javascript:jump('twitter'    )">Ʈ����					</a></dt>
	<dt><a href="javascript:jump('trash'      )">«��					</a></dt>
  </dl>                        
</div>

<script type="text/javascript">
	function jump(tmp) {
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}
</script>