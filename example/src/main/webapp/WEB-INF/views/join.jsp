<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	
	#name, #birth, #phone {
		box-shadow: 0px 0px 5px #DBDBDB;
		border: 1px solid #C9C9C9;
		width: 300px;
		height: 40px;
		margin-bottom: 3px;
	}
	
	#joinNotice {
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		position: absolute;
		width: 550px;
		height: 800px;
		left: 690px;
		top: 17%;
	}
	
	#joinDiv {
		position: absolute;
		width: 20%;
		height: 25%;
		left: 40%;
		top: 29%;
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 13pt;
	}
	
	#inp2 {
		width: 390px;
		height: 50px;
		color: white;
		font-size: 17pt;
		border: 1px solid #12C49A;
		background-color: #12C49A;
		border-radius: 7px;
		left: -10px;
	}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
</head>
<body>
<div id='joinFrm'>
<div id='joinNotice'>
	<span style='font-size: 21pt; font-weight: bold;'> 정보 입력을 완료하세요 </span> <br>
	<span style='font-size: 16pt;'>회원 가입 절차를 완료하려면 회원님의 정보를 입력해주세요.</span>
</div>
		<form action="../../join" method="post" onsubmit="return allCheck()">
			<div id="joinDiv" class="joinDiv">
			<span style='margin-right: 33px;'>이     름</span>
			<input class="inp1" type="text" name="m_name" id="name" placeholder="예)홍길동" ><br> <br>
			<span style='margin-right: 10px;'>생년월일</span>
			<input class="inp1" type="text" name="m_birth" id="birth" placeholder="예)19890121"><br> <br>
			<span style='margin-left: -215px; margin-right: 33px;'>성     별</span>
			<input class="radio1" type="radio" name="m_gender" value="남자" checked="checked">남자
			<input class="radio1" type="radio" name="m_gender" value="여자">여자<br><br>
			<span style='margin-right: 10px;'>전화번호</span>
			<input class="inp1" type="text" name="m_phone" id="phone" placeholder=" -를 제외하고 입력" maxlength="11"><br><br>
			<button id="inp2" type="submit">회원가입</button>
			<input class="inp1" type="text" name="m_id" id="id" hidden=""><br>
			</div>
		</form>
</div>
</body>
<script type="text/javascript">
	function allCheck() {
		
	if ($('#name').val() != "") {
		var namestr = $('#name').val();
		if (namestr.length > 5) {
			alert("이름이 너무 깁니다.");
			return false;
		} 
	}else {
			alert("이름을 입력해 주세요.");
			$('#name').focus();
			return false;
		}
	
	if ($('#birth').val() != "") {
		var birthstr = $('#birth').val();
		if (birthstr.length != 8) {
			alert("생년월일 형식이 아닙니다.");
			return false;
		} 
	}else {
			alert("생년월일을 입력해 주세요.");
			$('#birth').focus();
			return false;
		}
	
	if ($('#phone').val() != "") {
		var phonestr = $('#phone').val();
		if (phonestr.length != 11) {
			alert("전화번호 형식이 아닙니다.");
			return false;
		} 
	}else {
			alert("전화번호를 입력해 주세요.");
			$('#phone').focus();
			return false;
		}
	
	return true;
	}
	
$(function() {
	$("#id").val("${result.email}");
	$("#name").val("${result.uname}");
	});
</script>
</html>