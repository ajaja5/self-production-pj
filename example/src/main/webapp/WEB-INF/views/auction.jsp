<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디비자바</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

.price_div, .day_div, .auction_div{
text-align: left;
font-size: 14pt;
color: #939393;
font-family: 'Noto Sans KR', sans-serif;
}

.main_img{
	position: relative;
	top: 0;
	left: 0;
	width:550px;
	height:380px;
	align-items: center;
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
		margin-left: 6%;
		font-size: 16.5pt;
		text-align: left;
	}
	
	#pMvAuction {
		font-family: 'Noto Sans KR', sans-serif;
		padding-left: 120px;
		padding-right: 120px;
	}

	#pMvAuction_div{
		margin-left: 40px;
		padding-top: 5px;
		padding-bottom: 2%;
		width: 600px;
		color: #4B4B4B;
	}

	#footer {
		float: left;
		padding-bottom: 350px;
		bottom: 0px; 
		height: 100px; 
		width: 100%;
		text-align: center;
	}
	
	a:visited {
		color: #5D5D5D;
	}
	
	#writer_info {
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>

</head>

<body>

	<div id="header">
		<jsp:include page="header.jsp"/>
	</div >
	<form action="auctionSearch" name="indexSearchFrm" method="get">
		<div id="form_div">
			<div id="form_in_div">
				<div style="margin-bottom: 30px; magin:auto; font-family: 'Noto Sans KR', sans-serif; color: #4B4B4B; font-size: 20pt;">
					<h1 tabindex="-1" class="base">경	매</h1>
				</div>
				<div id="destination_div">
					<div>
						<span class="base_s">목적지</span>
					</div>
					<div>
						<input type="text" id="destination_input" name="destination_input" class="d_input" value=""
							placeholder="모든 위치">
					</div>
				</div>
				<div id="check_div">
					<div>
						<span class="base_s">체크인-체크아웃</span>
					</div>
					<div>
						<input type="text" id="checkin_input" name="checkin_input" class="c_input" value=""
							readonly="readonly" placeholder="년/월/일">- <input
							type="text" id="checkout_input" name="checkout_input" class="c_input" value=""
							readonly="readonly" placeholder="년/월/일">
					</div>
				</div>
				<div id="person_div">
					<div>
						<span class="base_s">인원</span>
					</div>
						<div id="person_button_div">
							<button type="button" class="person_button" onclick="button_hide()">
							게스트 0 명
	        			</button>
					</div>
					<div id='person_select'>
						<div class="number">
							<a href="#" id="person_select_inc" style="text-decoration: none;"> <img style="text-decoration: none;" width="20px" height="20px" src="resources/images/plus.png"> </a>
								<span id="person_adult" style="margin-left: 10px;">게스트</span>
								<span id="personUpDown" style="margin-right: 10px;">0</span>
								<input id="personUpDownInput" name="person_count" value="" hidden="">
						    <a href="#" id="person_select_des"> <img width="20px" height="20px" src="resources/images/minus.png"> </a>
						</div>
					</div>
				</div>
				<div id="button_div">
					<div>
						&nbsp;
					</div>	
					<div id='searchdiv'>
						<button id="search">검색</button>
					</div>
				</div>
			</div>
		</div>
		
	</form>
	<hr>
	<div id="pMvAuction"></div>
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
		
		var dest=${destiny};
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
	//console.log(${auction});
	</script>
<script type="text/javascript">
	$(function main(){	
		var data=${auction};
		var rs = "";
		var ds = "";
 		for ( var i=0; i<data.length; i++) {
			rs+="<div class='pro_div'>"
				+	"<div class='proin_div'>"
				+		"<a href='auctionDetailInfo?au_code="+data[i].au_code+"'><img class='main_img' src='resources/upload/"+data[i].pp_sys+"' width='200'/></a><br>"
				+		"<div id='writer_info'> <div class='writer_img_div'>"
				+			"<a href='profileInfo?p_mid="+data[i].p_mid+"'><img class='writer_img' src='resources/upload/"+data[i].pf_picture+"'/></a>"
				+		"</div>"
				+		"<div class='writer_name'>"
			   	+			data[i].m_name +'님의&nbsp;'+ data[i].p_name
			   	+		"</div> </div>"
			   	+		"<div class='day_div'>"
				+		"<span >"+'숙박기간:&nbsp'+data[i].au_checkin+"&nbsp-&nbsp"+data[i].au_checkout+"</span><br>"
				+		"</div>"
				+		"<div class='price_div'>"
				+		"<span >"+'현재경매가:&nbsp'+data[i].aup_price+"원</span><br>"
				+		"</div>"
				+		"<div class='auction_div'>"
				+		"<span>"+'경매종료일:&nbsp'+data[i].au_endtime.substring(0,19)+"</span> <br> <br>"
				+		"</div>"
			   	+	"</div>"
			   	+"</div>";
		
				
				//manageProperty setTimeout
				var d=new Date();
				var endTime=
					leadingZeros(d.getFullYear(),4) + '-' +
			  		leadingZeros(d.getMonth() + 1,2) + '-' +
			  		leadingZeros(d.getDate(),2) + ' ' +
			  		leadingZeros(d.getHours(),2) + ':' +
			  		leadingZeros(d.getMinutes(),2) + ':' +
			  		leadingZeros(d.getSeconds(),2);
							
				var au_endtime=data[i].au_endtime.substring(0,19);
				var ssssssss=endTime.replace("-","").replace("-","").replace(/ /,"").replace(":","").replace(":","");
				var endtimes=au_endtime.replace("-","").replace("-","").replace(/ /,"").replace(":","").replace(":","");
				var issss=parseInt(ssssssss);
				var iendt=parseInt(endtimes);
				if(issss>=iendt){
					var p_code=data[i].p_code;
					$.ajax({
						type : "get",
						url : "ajaxEndATime",
						data : {
							p_code : p_code,
							endTime : ssssssss
							},
						dataType : "html",
						success : function(scc){
							console.log(scc);			
						},error : function(err){
							console.log(err);
						}						
					}); 
				};
				
				
 		
 		}
		$("#pMvAuction").html("<div id='pMvAuction_div'>"
								+"<h2>경매 현황</h2>"
								+"<span style='font-size: 15pt;'> 내 집 같은 편안함 그 이상을 누릴 수 있는 아름다운 숙소를 놓치지 마세요 </span>"
								+"</div>"
								+rs); 
	});
	
	
	
	function leadingZeros(n, digits) {
		var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
				}
			return zero + n;
	}
	
</script>
</html>