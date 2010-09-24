<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session" />
<%
	String loginName = ( member.getId() == null ) ? "Anonymous" : member.getId();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<!-- If Google's chrome frame installed, use it! -->
		<!-- Comment needs to be BELOW this meta tag! -->
<%--
//	****************************************************************************
//	jWebSocket Simple Chat (uses jWebSocket Client and Server)
//	Copyright (c) 2010 Alexander Schulze, Innotrade GmbH, Herzogenrath
//	****************************************************************************
//	This program is free software; you can redistribute it and/or modify it
//	under the terms of the GNU Lesser General Public License as published by the
//	Free Software Foundation; either version 3 of the License, or (at your
//	option) any later version.
//	This program is distributed in the hope that it will be useful, but WITHOUT
//	ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//	FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for
//	more details.
//	You should have received a copy of the GNU Lesser General Public License along
//	with this program; if not, see <http://www.gnu.org/licenses/lgpl.html>.
//	****************************************************************************
--%>
		<meta http-equiv="Content-Language" content="en">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<title>jWebSocket Chat Demo</title>
		<link rel="stylesheet" type="text/css" href="chat/res/css/jwebsocketMain.css">
		<script src="chat/res/js/jWebSocket.js" type="text/javascript"></script>
		<script type="text/javascript" language="JavaScript">
			var lJWSID = "jWebSocket Chat",
			lWSC = null,
			eLog = null,
			eUsername = null,
			ePool = null,
			eMessage = null,
			//eDebug = null,
			eKeepAlive = null;

			var IN = 0;
			var OUT = 1;
			var EVT = 2;
			var SYS = "OKJSP Server";
			var USR = null;

			// append a line to the log text area
			function log( aUsername, aEvent, aString ) {
				var lFlag;
				switch( aEvent ) {
					case IN: lFlag = "<"; break;
					case OUT: lFlag = ">"; break;
					case EVT: lFlag = "*"; break;
					default: lFlag = "?";
				}
				// set a default user name if not yet logged in
				if( !aUsername ) {
					aUsername = lWSC.getUsername();
				}
				if( !aUsername ) {
					aUsername = "USR";
				}
				eLog.innerHTML +=
					"<b>" +
					aUsername + " " +
					lFlag + 
					"</b>" +
					" " +
					aString + "<br>";
				if( eLog.scrollHeight > eLog.clientHeight ) {
					eLog.scrollTop = eLog.scrollHeight - eLog.clientHeight;
				}
			}

			function clearLog() {
				eLog.innerHTML = "";
				eLog.scrollTop = 0;
			}

			function doFocus( aElement ) {
				aElement.focus();
				aElement.select();
			}

			function doOpen() {
				// adjust this URL to your jWebSocket server
				var lURL = jws.JWS_SERVER_URL + "/;prot=json,timeout=360000";
				//log( SYS, OUT, "Connecting to " + lJWSID + " at " + lURL + "..." );

				// try to establish connection to jWebSocket server
				lWSC.logon( lURL, eUsername.value, "", {

					// OnOpen callback
					OnOpen: function( aEvent ) {
						//log( SYS, IN, "Connection to " + lJWSID + " established." );
						// start keep alive if user selected that option
						checkKeepAlive({ immediate: false });
					},

					// OnMessage callback
					OnMessage: function( aEvent, aToken ) {
						// for debug purposes
						/* // for debug purposes
						if( eDebug.checked ) {
							log( SYS, EVT, "<font style='color:#888'>" +
								( aToken ? aToken.type : "-" ) + ": " +
								aEvent.data + "</font>");
						}*/
						if( aToken ) {
							// is it a response from a previous request of this client?
							if( aToken.type == "response" ) {
								// figure out of which request
								if( aToken.reqType == "login" ) {
									if( aToken.code == 0 ) {
										log( SYS, IN, "Welcome '" + aToken.username + "'" );
										// select message field for convenience
										doFocus( eMessage );
										// call getAuthClients method from
										// jWebSocket System Client Plug-In
										lWSC.getAuthClients({
											pool: null
										});
									} else {
										log( SYS, IN, "Error logging in '" + + "': " + aToken.msg );
										// select username again for convenience
										doFocus( eUsername );
									}
								} else if( aToken.reqType == "getClients" ) {
									log( SYS, IN, "Clients (" + aToken.count + "): " + aToken.clients );
								}
								// is it an event w/o a previous request ?
							} else if( aToken.type == "event" ) {
								// interpret the event name
								// :
							} else if( aToken.type == "goodBye" ) {
								log( SYS, IN, lJWSID + " says good bye (reason: " + aToken.reason + ")!" );
								doFocus( eUsername );
								// is it any token from another client
							} else if( aToken.type == "broadcast" ) {
								if( aToken.data ) {
									log( aToken.sender, IN, aToken.data );
								}
							}
						}
					},

					// OnClose callback
					OnClose: function( aEvent ) {
						lWSC.stopKeepAlive();
						log( SYS, IN, "Disconnected from " + lJWSID + "." );
						doFocus( eUsername );
					}
					
				});
			}

			function getClients() {
				var lRes = lWSC.getAuthClients({
					pool: null
				});
				//log( SYS, OUT, "getClients: " + lRes.msg );
			}

			function doClose() {
				// disconnect automatically logs out!
				lWSC.stopKeepAlive();
				var lRes = lWSC.close({
					// wait a maximum of 3 seconds for server good bye message
					timeout: 3000
				});
				log( SYS, OUT, "logout: " + lRes.msg );
			}

			function broadcast() {
				var lMsg = eMessage.value;
				if( lMsg.length > 0 ) {
					log( USR, OUT, lMsg );
					var lRes = lWSC.broadcastText(
					"",		// broadcast to all clients (not limited to a certain pool)
					lMsg	// broadcast this message
				);
					// log error only, on success don't confuse the user
					if( lRes.code != 0 ) {
						log( SYS, OUT, "broadcast: " + lRes.msg );
					}
					eMessage.value = "";
				}
				doFocus( eMessage );
			}

			function checkKeepAlive( aOptions ) {
				if( !aOptions ) {
					aOptions = {};
				}
				aOptions.interval = 30000;
				if( eKeepAlive.checked ) {
					lWSC.startKeepAlive( aOptions );
				} else {
					lWSC.stopKeepAlive();
				}
			}

			function usrKeyDnLsnr( aEvent ) {
				// on enter in username field try to login
				if( aEvent.keyCode == 13 ) {
					doOpen();
				}
			}

			function msgKeyDnLsnr( aEvent ) {
				// on enter in message field send broadcast the message
				if( !aEvent.shiftKey && aEvent.keyCode == 13 ) {
					broadcast();
				}
			}

			function elemFocusLsnr( aEvent ) {
				// on focus select full text of element (for username and message)
				jws.events.getTarget( aEvent ).select();
			}

			var lNextWindowId = 1;

			function openSubWindow() {
				window.open(
				// "http://www.jwebsocket.org/demos/chat/chat.htm"
				"chat.htm",
				"chatWindow" + lNextWindowId,
				"width=900,height=700,left=" + (50 + lNextWindowId * 30) + ",top=" + (50 + lNextWindowId * 25)
			);
				lNextWindowId++;
				if( lNextWindowId > 10 ) {
					lNextWindowId = 1;
				}
			}

			function initPage() {
				// get some required HTML elements
				eLog = jws.$( "sdivChat" );
				eUsername = jws.$( "stxfUsername" );
				ePool = jws.$( "stxfPool" );
				eReceiver = jws.$( "stxfReceiver" );
				eMessage = jws.$( "stxaMsg" );
				//eDebug = jws.$( "schkDebug" );
				eKeepAlive = jws.$( "schkKeepAlive" );
					
				// check if WebSockets are supported by the browser
				if( jws.browserSupportsWebSockets() ) {
					// instaniate new TokenClient, either JSON, CSV or XML
					lWSC = new jws.jWebSocketJSONClient();
					// lWSC = new jws.jWebSocketCSVClient();

					jws.events.addEventListener( eUsername, "keydown", usrKeyDnLsnr );
					jws.events.addEventListener( eMessage, "keydown", msgKeyDnLsnr );
					jws.events.addEventListener( eUsername, "focus", elemFocusLsnr );
					jws.events.addEventListener( eMessage, "focus", elemFocusLsnr );
/*
					eUsername.addEventListener( "keydown", usrKeyDnLsnr, false );
					eMessage.addEventListener( "keydown", msgKeyDnLsnr, false );
					eUsername.addEventListener( "focus", elemFocusLsnr, false );
					eMessage.addEventListener( "focus", elemFocusLsnr, false );
*/
					eUsername.focus();
					eUsername.select();
				} else {
					jws.$( "sbtnSend" ).setAttribute( "disabled", "disabled" );
					jws.$( "sbtnLogin" ).setAttribute( "disabled", "disabled" );
					jws.$( "sbtnLogout" ).setAttribute( "disabled", "disabled" );
					jws.$( "sbtnGetClients" ).setAttribute( "disabled", "disabled" );
					jws.$( "sbtnClearLog" ).setAttribute( "disabled", "disabled" );
					
					//eDebug.setAttribute( "disabled", "disabled" );
					eKeepAlive.setAttribute( "disabled", "disabled" );
					eUsername.setAttribute( "disabled", "disabled" );
					eMessage.setAttribute( "disabled", "disabled" );
					
					var lMsg = jws.MSG_WS_NOT_SUPPORTED;
					alert( lMsg );
					log( SYS, IN, lMsg );
				}
			}

			function exitPage() {
				// this allows the server to release the current session
				// immediately w/o waiting on the timeout.
				if( lWSC ) {
					lWSC.close({
						// force immediate client side disconnect
						timeout: 0
					});
				}
			}

		</script>
	</head>

	<body
		onload="initPage();"
		onunload="exitPage();"
		>
<!--	remarked temporarily due to chrome 5 browser bug
		<script type="text/javascript">
			var lFrameElem = this.frameElement;
			if( !lFrameElem ) {
				location.replace( "../../index.htm?page=demos/chat/chat.htm" );
			}
		</script>
-->		
		<h4>OKJSP Chatting</h4>
		<div class="sdivContainer">
			<table class="stlbDlgBorder" border="0" cellpadding="3" cellspacing="0" width="100%">
				<tr class="strDlg">
					<td class="stdDlg" width="5">Username </td>
					<td class="stdDlg" width="5"><input class="stxfDlg" id="stxfUsername" type="text" value="<%= loginName %>" size="20"></td>
					<td class="stdDlg" width="5"><input class="sbtnDlg" id="sbtnLogin" type="button" value="Login" onclick="doOpen();"></td>
					<td class="stdDlg" width="5"><input class="sbtnDlg" id="sbtnLogout" type="button" value="Logout" onclick="doClose();"></td>
					<td class="stdDlg" width="5"><input class="sbtnDlg" id="sbtnGetClients" type="button" value="Clients" onclick="getClients();"></td>
					<td class="stdDlg" width="" align="right">
						<input id="schkKeepAlive" type="checkbox" value="off" onclick="checkKeepAlive();">&nbsp;Keep-Alive&nbsp;
						<%//<input id="schkDebug" type="checkbox" value="on" checked="checked">&nbsp;Debug&nbsp;%>
					</td>
				</tr>
			</table>
		</div>
		<div id="sdivChat" class="sdivContainer"
			 style="position:relative; height:160px; overflow:auto;">
		</div>
		<div class="sdivContainer">
			<table class="stlbDlgBorder" border="0" cellpadding="3" cellspacing="0" width="100%">
				<tr class="strDlg">
					<td valign="top" class="stdDlg" width="5">Message</td>
					<td valign="top" class="stdDlg" width=""><textarea class="stxaDlg" id="stxaMsg" cols="255 "rows="2" style="width:100%" onFocus="javascript:if( this.value == 'Please type your message here!' ) this.value = '';">Please type your message here!</textarea></td>
					<td valign="top" class="stdDlg" width="5"><input class="sbtnDlg" id="sbtnSend" type="button" value="Send" onclick="broadcast();" style="margin-left:6pt"></td>
				</tr>
			</table>
		</div>
	</body>
</html>
