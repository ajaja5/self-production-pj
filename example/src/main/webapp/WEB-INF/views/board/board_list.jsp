<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<h2>board_list 페이지입니다.</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.bno}</td>
			<td>${row.title}</td>
			<td>${row.writer}</td>
			<td>
				<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
			</td>
			<td>${row.viewcnt}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>