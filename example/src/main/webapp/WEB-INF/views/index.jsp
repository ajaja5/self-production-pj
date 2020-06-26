<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디비자바</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">

	#destination_div{
		width: 200px; float: left;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 13pt;
		color: #4B4B4B;
	}

	#check_div{
		width: 380px; float: left;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 13pt;
		color: #4B4B4B;
		margin-left: 50px;
	}

	#person_div{
		width: 100px; float: left;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 13pt;
		color: #4B4B4B;
	}

	#button_div{
		width: 100px; float: left;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 13pt;
		font-weight: bold;
	}

	#form_div{
		padding-left:30px;
		padding-right:30px;
		height: 170px;
	}

	#form_in_div{
		margin-left: 150px;
		margin-top : 50px;
		width: 900px;
		height: 150px;
	}
	
	#destination_input, #checkin_input, #checkout_input {
		height: 40px;
		border-radius: 3px;
		box-shadow: 0px 0px 5px #DBDBDB;
		border: 1px solid #C9C9C9;
	}
	
	#checkin_input, #checkout_input {
		width: 180px;
	}
	
	.person_button, #search {
		height: 40px;
		border-radius: 3px;
	}
	
	.person_button {
		width: 150px;
		margin-right: 100px;
		color: #4B4B4B;
		box-shadow: 0px 0px 5px #DBDBDB;
		background-color: white;
	}
	
	#search {
		width: 70px;
		background-color: #12C49A;
		color: white;
		font-size: 15pt;
		border: 1px solid #12C49A;
		
	}
	
	#searchdiv {
		margin-left: 60px;
	}
	
	#person_select {
		width: 150px;
		height: 35px;
		font-size: 14pt;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: center;
		color: #4B4B4B;
		border: 1px solid #C9C9C9;
	}
	
	#person_select_inc, #person_select_des {
		color: black;
		font-size: 16pt;
		font-weight: bolder;
	}
	
	#number {
		padding: 5%;
	}

	.grade_div{
		text-align: left;
		font-size: 15pt;
		padding-top: 5px;
		padding-bottom: 5px;
		color: #939393;
	}

	.main_img{
		position: relative;
		top: 0;
		left: 0;
		width:500px;
		height:340px;
		align-items: center;
		border-radius: 5px;
	}

	.pro_div{
		width: 33%;
		align-items: center; 
		float: left;
		text-align: center;
		color: #4B4B4B;
		margin-bottom: 50px;
		margin-right: 5px;
	}

	.proin_div{
		display: inline-block;
	}

	.writer_img_div{
		width: 25px;
		height: 25px;
		float: left;
		text-align: left;
		margin-top: 4px;
	}

	.writer_img{
		width: 25px;
		height: 25px;
		border-radius: 70px;
		align-items: center; 
	}

	.writer_name{
		width: 400px;
		height: 50px;
		margin-left: 6%;
		font-size: 16.5pt;
		text-align: left;
	}
	
	#mainProPerty {
		font-family: 'Noto Sans KR', sans-serif;
		padding-left: 120px;
		padding-right: 120px;
	}

	#mainProPerty_div{
		margin-left: 40px;
		padding-top: 5px;
		padding-bottom: 2%;
		width: 700px;
		color: #4B4B4B;
		font-family: 'Noto Sans KR', sans-serif;
	}

	#footer {
		float: left;
		padding-bottom: 350px;
		bottom: 0px; 
		height: 100px; 
		width: 100%;
		text-align: center;
	}
	
	#gopr {
		font-family: 'Noto Sans KR', sans-serif;
		color: #4B4B4B;
	}
	
	a:visited {
		color: #5D5D5D;
	}
	
</style>

</head>

<body>

	<div id="header">
		<jsp:include page="header.jsp"/>
	</div >
	
	
	<hr>
	<div id="mainProPerty"></div>
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>

<script type="text/javascript">
$("#person_select").hide();

function button_hide() {
	$("#person_select").toggle();
}


$(function(){
	$('#person_select_des').click(function(e){
		e.preventDefault();
		var stat = $('#personUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<0){
			alert('더이상 줄일 수 없습니다.');
			num =1;
			}
		$('#personUpDown').text(num);
		$('#personUpDownInput').val(num);
		$('.person_button').text("게스트 "+num+"명");
	});
	$('#person_select_inc').click(function(e){
		e.preventDefault();
		var stat = $('#personUpDown').text();
		var num = parseInt(stat,10);
		num++;

	if(num>10){
		alert('더이상 늘릴 수 없습니다.');
		num=5;
		}
	$('#personUpDown').text(num);
	$('#personUpDownInput').val(num);
	$('.person_button').text("게스트 "+num+"명");
		});
	});

	$(function() {
		$("#checkin_input").datepicker({
			 dateFormat: "yy/mm/dd"
		});
		
		$("#checkout_input").datepicker({
			 dateFormat: "yy/mm/dd",
			 onSelect : function(dateText,inst){
				 var checkindate = $("#checkin_input").val();
				 var checkoutdate = $(this).val();
				 var checkinnum = checkindate.replace(/[/]/g,"");
				 var checkoutnum = checkoutdate.replace(/[/]/g,"");
				 var checknum = checkoutnum-checkinnum;
				 if(checknum<=0){
				 	alert("체크인 체크아웃 날짜를 확인해주세요.");
				 	$("#checkout_input").val("")
				 }
			 }
		});
		
		var dest=${des};
		var availableCity = new Array();
			
			for(var i=0; i<dest.length; i++) {
				availableCity[i]=dest[i].dest;
			};
			console.log(availableCity);
			
		$("#destination_input").autocomplete({
			source : availableCity,
			select : function(event, ui) {
				console.log(ui.item);
			},
			focus : function(event, ui) {
				return false;
				//event.preventDefault();
			}
		});
	});
	console.log(${pro});
	$(function main(){	
		var data=${pro};
		var rs = "";
		var ds = "";
 		for ( var i=0; i<data.length; i++) {
			rs+="<div class='pro_div'>"
				+	"<div class='proin_div'>"
				+		"<a href='detailPropertyInfo?p_code="+data[i].p_code+"'><img class='main_img' src='resources/upload/"+data[i].pp_sys+"' width='200'/></a><br>"
				+		"<div class='grade_div'>"
				+		"<span >"+'평점&nbsp'+data[i].g_grade+"&nbsp/&nbsp5</span><br>"
				+		"</div>"
				+		"<div class='writer_img_div'>"
				+			"<a href='profileInfo?p_mid="+data[i].p_mid+"'><img class='writer_img' src='resources/upload/"+data[i].pf_picture+"'/></a>"
				+		"</div>"
				+		"<div class='writer_name'>"
			   	+			data[i].m_name +'님의&nbsp;'+ data[i].p_name
			   	+		"</div>"
			   	+	"</div>"
			   	+"</div>"
		}
		$("#mainProPerty").html("<div id='mainProPerty_div'>"
								+"<h2>베스트 숙소</h2>"
								+"<span style='font-size: 15pt;'> 내 집 같은 편안함 그 이상을 누릴 수 있는 아름다운 숙소를 확인해보세요 </span>"
								+"</div>"
								+rs); 
	});
	
	
</script>
</html>