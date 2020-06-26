<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> </script>
<title> 경매검색 결과 </title>
<style>
	#propertyInfo {
		margin-left: 18%;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.sListdiv {
		border: 1px solid #E1E1E1;
		width: 75%;
		padding: 10px;
		color: #4B4B4B;
	}
	
	#pimage {
		width: 260px;
		height: 170px;
	}
	
	a:link {
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	
	<div style='font-family: "Noto Sans KR", sans-serif; margin-top: 50px; margin-bottom: 50px; color: #4B4B4B; text-align: center; font-size: 21pt; font-weight: bold; font-family: "Noto Sans KR", sans-serif;'> <span> <img width='35px' height='40px' src='resources/images/coins.png'> &nbsp경매 검색 결과&nbsp <img width='35px' height='40px' src='resources/images/coins.png'> </span></div>

	<div id="propertyInfo">
		${aucList}
	</div>
</body>
<script>
</script>
</html>