<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 취소</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>주문 취소</h1>
			</div>
		</div>
		<div>
			<h2">주문이 정상적으로 취소되었습니다.</h2>
		</div>
		<div>
			<p>
				<a href="./products.jsp" style="color: #7D5A5A; font-size: 20px">
					&laquo; 상품 목록</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>