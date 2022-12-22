<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%
request.setCharacterEncoding("UTF-8");

String cartId = session.getId();

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
		if (n.equals("Pickup_name"))
	pickup_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Pickup_pickupHH"))
	pickup_pickupHH = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Pickup_pickupMM"))
	pickup_pickupMM = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>영수증</h1>
			</div>
		</div>
		<div>
			<div align="left" style="padding-left:20px;">
				<br> 성명 :
				<%
				out.println(pickup_name);
				%>
			</div>
			<div align="right" style="padding-right:50px;">
				<p>
					<em>픽업 시간 : <%
					out.println(pickup_pickupHH);
					%> 시 <%
					out.println(pickup_pickupMM);
					%> 분
					</em>
			</div>
			<table
				style="border: 1px #a39485 solid; font-size: 20px; box-shadow: 0 2px 5px rgba(0, 0, 0, .25); width: 100%; border-collapse: collapse; border-radius: 5px; overflow: hidden;">
				<tr style="font-weight: bold; color: black;">
					<th
						style="text-align: center; padding: 20px; vertical-align: middle;">상품명</th>
					<th
						style="text-align: left; padding: 20px; vertical-align: middle;">#</th>
					<th
						style="text-align: left; padding: 20px; vertical-align: middle;">가격</th>
					<th
						style="text-align: left; padding: 20px; vertical-align: middle;">소계</th>
				</tr>
				<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
				%>
				<tr>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><em><%=product.getPname()%></em></td>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><%=product.getQuantity()%></td>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><%=product.getUnitPrice()%>원</td>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><%=total%>원</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td></td>
					<td></td>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><strong>총액
							: </strong></td>
					<td
						style="text-align: left; padding: 20px; vertical-align: middle;"><strong><%=sum%></strong></td>
				</tr>
			</table>

			<a href="./shippingInfo.jsp?cartId=<%=pickup_cartId%>"
				style="color: #7D5A5A; font-size: 20px" role="button"> 이전 &nbsp;
				&nbsp; &nbsp;</a> <a href="./thankCustomer.jsp"
				style="color: #7D5A5A; font-size: 20px" role="button">주문
				완료&nbsp; &nbsp; &nbsp;</a> <a href="./checkOutCancelled.jsp"
				style="color: #7D5A5A; font-size: 20px" role="button">취소</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>