<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let sock = null; <%--서버로 데이터 전송해줄거임--%>
	window.onload =()=>{
		let wsUri = "ws://localhost:8085/root/test/websocket";
		sock = new WebSocket(wsUri);
		sock.onmessage = onMessage;
		
		$("#sendBtn").click(()=>{
			sendMessage();
		})
	}	

	function sendMessage(){
		
		sock.send( $("#send_msg").val() );
		$("#send_msg").val("");
	}
	function onMessage( msg ){
		$("#rec_data").append(msg.data+"<br>");
	}
	
</script>
</head>
<body>
	<div id="rec_data">
	</div>
	<input type="text" id="send_msg"><br>
	<button type="button" id="sendBtn">전송</button>
			
</body>
</html>