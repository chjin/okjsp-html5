<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//ContextPath
String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<style type="text/css">
.contactform {
	width: 568px;
	margin: 1.0em 0 0 0;
	/*padding: 10px 10px 0 10px;*/ /*border: solid 1px #C8C8C8;*/
	/*background-color: #F2F2F2;*/
}

.contactform fieldset {
	padding: 20px 0 10px 0 !important /*Non-IE6*/;
	padding: 0 /*IE6*/;
	margin: 0 0 20px 0;
	background-color: #F2F2F2;
	border: solid 1px #DCDCDC;
}

.contactform fieldset legend {
	margin: 0 0 0 5px !important /*Non-IE*/;
	margin: 0 0 20px 5px /*IE6*/;
	padding: 0 2px 0 2px;
	color: #505050;
	font-weight: bold;
	font-size: 1em;
}

.contactform label.left {
	float: left;
	width: 100px;
	margin: 0 0 0 10px;
	padding: 2px;
	font-size: 1.2em;
}

.contactform input.field {
	width: 275px;
	padding: 2px;
	border: solid 1px #C8C8C8;
	font-size: 1.2em;
}

.contactform span.guide {
    clear: both;
    margin-left: 110px;
	width: 285px;
	display: block;
	color: #268887;
	font-size: 1.1em;
}

.contactform span.item {
	float: left;
	color: #5A5A5A;
	font-size: 100%;
	vertical-align: middle;
	padding-left: 1.2em;
}

.contactform span.item label {
	margin: 0 0 0 3px !important;
}

.contactform span.item.first {
	padding-left: 0;
}

.contactform #profile {
	padding: 10px 10px 0 10px;
}

.contactform #profile-drop {
	margin-bottom: 15px;
	padding: 25px;
	border: 2px dashed #bbb;
	color: #bbb;
	border-radius: 5px;
	font: normal normal normal 20pt/normal bold, Tahoma;
}

.contactform #profile-drop.droppable {
	border-color: red !important;
}

.contactform #preview {
	margin-bottom: 15px;
	padding: 25px;
	border: 2px dashed #bbb;
	color: #bbb;
	display: none;
	border-radius: 5px;
	font: normal normal normal 20pt/normal bold, Tahoma;
}

.contactform #preview img {
	max-width: 320px;
    opacity: 0;
    -webkit-transition: opacity 1.2s ease-in-out;
}

.contactform fieldset.info p {
    font-weight: bold;
}

input.field:invalid {
	background-color: #ffdddd;
}
</style>
<title>OKJSP_HTML5</title>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#profile-drop').bind({
        dragover: function(e) {
            var dataTransfer = e.originalEvent.dataTransfer;
            if (dataTransfer.types) {
                var accepted = false;
                for (var i = 0; i < dataTransfer.types.length; i++) {
                    if ('Files' == dataTransfer.types[i]) {
                        accepted = true;
                        break;
                    }
                }
                if (!accepted) {
                    return;
                }
            }
            dataTransfer.dropEffect = 'copy'; 
            e.preventDefault();
            $(this).addClass('droppable');
        },
        dragleave: function(e) {
            setTimeout(function() {
                $(e.target).removeClass('droppable');
            }, 100);
        },
        drop: function(e) {
            setTimeout(function() {
                $(e.target).removeClass('droppable');
            }, 50);

            var files = e.originalEvent.dataTransfer.files;
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
                $('#preview').hide().empty();
                $('<img src="' + responseJSON['path'] + '">').appendTo('#preview')
                    .load(function() {
                        $('#preview').slideDown(600, function() {
                            $('#preview img').css({opacity: 1});
                        });
                    });
                $(':hidden[name=file]').remove();
                $('<input type="hidden" name="file" value="' + responseJSON['path'] + '">')
                    .appendTo('#joinform');
            };
            xhr.setRequestHeader('Content-Type', 'multipart/form-data');
            xhr.setRequestHeader('X-File-Name', file.fileName);
            xhr.setRequestHeader('X-File-Size', file.fileSize);
            xhr.send(file);

            e.preventDefault();
        }
    });
});
</script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../main/header.jsp" />
    <section>
        <div id="container">
            <div id="contentinner">
                <!-- 메인 컨텐츠_시작======================================= -->
                    <div class="contactform">
                        <form id="joinform" method="post" action="register.jsp">
                            <fieldset><legend>&nbsp;okjsp.pe.kr 회원가입&nbsp;</legend>
                                <p><label for="contact_email" class="left">Email:</label>
                                     <input type="email" name="email" id="contact_email" class="field" autofocus required /></p>
                                <p><label for="contact_id" class="left">ID:</label>
                                     <input type="text" name="id" id="contact_id" class="field" required /></p>
                                <p><label for="contact_name" class="left">Name:</label>
                                     <input type="text" name="name" id="contact_name" class="field" required /></p>
                                <p><label for="contact_url" class="left">Website:</label>
                                     <input type="text" name="homepage" id="contact_url" class="field" /></p>
                                <p><label for="contact_url" class="left">Mailling:</label>
                                     <span class="item first"><input type="radio" name="mailing" id="contact_mailling_y" value="Y" /><label class="" for="contact_mailling_y">허용</label></span>
                                     <span class="item"><input type="radio" name="mailing" id="contact_mailling_n" value="N" checked /><label class="" for="contact_mailling_n">거부</label></span>
                                     <span class="guide">okjsp에서 비정기적으로 발행하는 뉴스레터와 홍보메일 수신 설정입니다.</span>
                                     </p>
                            </fieldset>
                            <fieldset><legend>&nbsp;Profile&nbsp;</legend>
                                <div id="profile">
                                    <div id="profile-drop">Drop the image</div>
                                    <div id="preview"></div>
                                </div>
                            </fieldset>
                            <fieldset class="info"'><legend>&nbsp;Information&nbsp;</legend>
                                <p style="padding-left:15px;">가입시 임시비밀번호가 메일로 발송됩니다.<br>로그인 후 비밀번호를 바꿔주시기 바랍니다.</p>
                            </fieldset>
                            <p>
                                <input type="submit" class="button" value="JOIN" style="float:none;">
                                <input type="button"" class="button" value="CANCEL" style="float:none;">
                            </p>
                        </form>
                    </div>
                <!-- 메인 컨텐츠_끝======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->
        <jsp:include page="../main/left.jsp" />
    </section>
    <jsp:include page="../main/footer.jsp" />
</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
