<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
	<%
	String pickup_cartId = "";
	String pickup_name = "";
	String pickup_pickupHH = "";
	String pickup_pickupMM = "";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Pickup_cartId"))
		pickup_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Pickup_pickupHH"))
		pickup_pickupHH = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Pickup_pickupMM"))
		pickup_pickupMM = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	%>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>주문 완료</h1>
			</div>
		</div>

		<div class="container">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
			<p>
				음료는
				<%
			out.println(pickup_pickupHH);
			%>
				시
				<%
			out.println(pickup_pickupMM);
			%>
				분 에 제조 완료 될 예정입니다!
			<p>
				주문번호 :
				<%
			out.println(pickup_cartId);
			%>
			
		</div>
		<div class="container">
			<p>
				<a href="./products.jsp" style="color: #7D5A5A; font-size:20px">&laquo; 상품 목록</a>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
<%
session.invalidate();

for (int i = 0; i < cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if (n.equals("Pickup_cartId"))
		thisCookie.setMaxAge(0);
	if (n.equals("Pickup_name"))
		thisCookie.setMaxAge(0);
	if (n.equals("Pickup_pickupHH"))
		thisCookie.setMaxAge(0);
	if (n.equals("Pickup_pickupMM"))
		thisCookie.setMaxAge(0);

	response.addCookie(thisCookie);
}
%>