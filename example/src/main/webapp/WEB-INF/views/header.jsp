<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.showDetail{
		width: 350px;
		height: 400px;
		float: right;
		font-family: 'Noto Sans KR', sans-serif;
	}

	input[type=button]{
		border-style: none;
		background-color: white;
	}

	#bfLogin, #afLogin{
		text-align: right;	
		margin-top: -1%;
		font-size: 15pt;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#addProperty{
		position: absolute; 
		background-color: white;
		margin-left: 730px;
		margin-top: 70px;
		border: 1px solid #E1E1E1;
		overflow: hidden; 
		z-index: 200; 
	}

	#auctionBtn_div{
		font-size: 25px;
		width: 200px;
		height:27px;
		float: left;
		margin-right:200px;
		text-align: center;
		cursor: pointer;
	}
	
	#reverseABtn_div{
		font-size: 25px;
		width: 200px;
		height:27px;
		float: left;
		margin-right:200px;
		text-align: center;
		cursor: pointer;
	}
	
	#addProBtn_div{
		font-size: 25px;
		height:27px;
		width: 200px;
		float: left;
		text-align: center;
		cursor: pointer;
	}

	#btn_div{
		margin-top: 2%;
		padding-left: 24%;
		align-items:center;
		text-align:center;
		height: 30px;
		color: #5D5D5D;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#logo {
		margin-left: 20px;
		margin-top: 25px;
	}
	
	#login, #memberjoin, #myPageBnt, #logout, #msgCount, #noticBtn, #pointBtn  {
		color: #5D5D5D;
		font-weight: bold;
		margin-right: 25px;
	}
	
	#noticBtn:hover, #pointBtn:hover {
		text-decoration: underline;
	}
	
	#addProperty_div {
		padding: 5%;
		font-size: 13pt;
	}
	
	#notic, #myPoint {
		margin-top: 20px;
		border: 1px solid #E1E1E1;
		background-color: white;
		padding: 2%;
		overflow: auto;
		font-size: 14pt;
		color: #5D5D5D;
		z-index: 200; 
	}
	
	#myPoint {
		position: absolute; 
		margin-left: 68.5%;
	}
	
	#notic {
		position: absolute; 
		margin-left: 63.5%;
	}
	
	a:visited {
		color: #5D5D5D;
	}
</style>
</head>
<body>

<img width="155px" height="50px" style="cursor: pointer;" src="resources/images/dbjava_logo2.png" id="logo" />
<div id="bfLogin">
<a class="atag" id="login" href=login>로그인</a>
<a class="atag"id="memberjoin" href=memberjoin>회원가입</a>
</div>

<div id="afLogin">
<span id="msgCount"></span>
<input type="button" value="알림" id="noticBtn" />
<input type="button" value="적립금" id="pointBtn" />
<a href="myPage" id="myPageBnt" >마이페이지</a>
<a class="atag" id="logout" href="logout">로그아웃</a>
</div>

<div class="showDetail" id="notic"></div>
<div class="showDetail" id="myPoint"></div>
<div class="showDetail" id="joinLogin"></div>
<hr>
<div id="btn_div">
	<div  id="auctionBtn_div">
		<span>새장</span>
	</div>
	<div id="reverseABtn_div">
		<span>새모이</span>
	</div>
	<div id="addProBtn_div">
		<span>장난감</span>
	</div>
	<div class="showDetail" id="addProperty"></div>
</div>
<br>
<hr>
</body>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script>
$("#auctionBtn_div").click(function() {
	location.href="auction";
	//auction.jsp
});


$("#reverseABtn_div").click(function() {
	location.href="reverseAuction";
	//reverseAuction.jsp
});

$("#pointBtn").click(function() {
	location.href="myPoint";
	//myPoint.jsp
});


$("#addProBtn_div").mouseenter(function() {	
	$("#addProperty").show();
	var data="";
	data+=
		"<div id=addProperty_div>"
		+"<h4 style='color: #939393; text-align: left;'> 숙 소 </h4> <br><br>"
		+"<a style='float: left; font-size: 17pt; color: #5D5D5D; font-weight: bolder;' href='addProperty'>숙소 등록하기</a> <img style='float: right;' width='35px' height='35px' src='resources/images/home.png'>"
		+"<br><br><br> <span style='float: left; font-size: 14pt; color: #5D5D5D;'> 호스트가 되어 숙소를 등록해보세요! </span> <br>"
		+"<a style='float: left; font-size: 16pt; color: #5D5D5D; font-weight: bolder;' href='goInfoCenter'>숙소 호스팅에 관해 알아보기</a>"
		+"</div>";	
		
	$("#addProperty").html(data);
	
});

$("#addProperty_div").mouseleave(function() {
	$("#addProperty").hide();
});

$("#logo").click(function() {
	location.href="index";
	//index.jsp
});


 $("#noticBtn").mouseenter(function() {	
	$("#notic").show();
	$("#addProBtn").attr("type","hidden");
	$.ajax({
		type : "get",
		url : "ajaxMsgNoticeDetail",
		dataType : "json",
		success : function(data) {
			var mm="";
			
			if(data.length==0){
				mm+="<p>새로운 메시지가 없습니다.</p>"					
			}
			else{			
				for(var i=0; i<data.length;i++){
					mm+=data[i].me_s_mid+"님께 "+" 새로운 메시지가 왔습니다. <br> →　"+data[i].me_contents+"<hr>"					
				}
			}			
			
			$("#notic").html(mm);
			
			
		},//success
		error : function(err) {
			console.log(err);
		}//error
	}); //ajax end
	
});

$("#noticBtn").mouseleave(function() {
	$("#addProBtn").attr("type","button");
	$("#notic").hide();
	
});

$("#noticBtn").click(function() {	
	location.href="messageMain";	
});

$("#pointBtn").mouseenter(function() {	
	$("#myPoint").show();
	$("#addProBtn").attr("type","hidden");
	$.ajax({
		type : "get",
		url : "ajaxMyPoint",
		dataType : "json",
		success : function(data) {
			var pp="";
			var tp=0;
			if(data.length==0){
				pp+="<p>적립금이 없습니다.</p>"					
			}
			else{			
				for(var i=0; i<data.length;i++){
					pp+=data[i].pt_point+" Point - "+data[i].pt_contents+"("+data[i].pt_date.substring(0,19)+")<hr/>"
					tp+=data[i].pt_point;
				}
			}			
			
			$("#myPoint").html(pp+"적립금 합계 : "+tp+" Point");
			
			
		},//success
		error : function(err) {
			console.log(err);
		}//error
	}); //ajax end
	
});



$("#myPoint").mouseleave(function() {
	$("#addProBtn").attr("type","button");
	$("#myPoint").hide();	
	
});


$("#addProperty").mouseenter(function() {	
	$("#addProperty").show();
	$("#addProBtn").attr("type","hidden");
});

$("#addProperty").mouseleave(function() {
	$("#addProBtn").attr("type","button");
	$("#addProperty").hide();
});


function onOpen(evt) {
	console.log("onOpen");
	websocket.send("${id}");
};

function onMessage(evt) {
	console.log("onMessage");
	$("#noticNew").show();
};

function onError(err) {
	console.log(err);
};
</script>

<script type="text/javascript">
var socket=null;


$(document).ready(function(){
	
	$(".showDetail").hide();
	$("#noticNew").hide();	
	
	var chk = "${m_id}";
	if (chk == null || chk == "") {
		$("#afLogin").hide();
		$("#bfLogin").show();
	}else{
		$("#afLogin").show();
		$("#bfLogin").hide(); 
	}
	
	connectWS();
	$.ajax({
		type : "get",
		url : "ajaxMsgCount",
		dataType : "html",
		success : function(data) {
			console.log(data)
			$("#msgCount").html('새 메시지&nbsp;'+data);
		},//success
		error : function(err) {
			console.log(err);
		}//error
	}); //ajax end
});

function connectWS(){
	var ws = new WebSocket("ws://localhost:80/dbjava/meSoket");
	socket=ws;

	ws.onopen = function(){
		console.log('Info: connection opened.');
	};

	ws.onmessage = function(){
		console.log("ReceiveMessage:",event.data+'\n');
		
		$('#msgCount').html('새 메시지&nbsp;'+event.data);
	};

	ws.onclose = function (event) { 
		console.log('Info: connection closed.');
		//setTimeout(function(){connect();},1000); //retry connection!!
	};
	ws.onerror = function (err) { console.log('Error:',err);};	
}
</script>
</html>