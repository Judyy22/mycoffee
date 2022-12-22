<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%-- <%@ page import="dao.ProductRepository"%> --%>
<%@ page import="java.sql.*"%>
<html>
<head>
<%
String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>장바구니</h1>
			</div>
		</div>
		<div>
			<div>
				<table width="100%">
					<tr>
						<td align="left" style="padding-left: 20px;"><a
							style="color: #7D5A5A; font-size: 20px"
							href="./deleteCart.jsp?cartId=<%=cartId%>">삭제하기</a></td>
						<td align="right" style="padding-right: 20px;"><a
							style="color: #7D5A5A; font-size: 20px;"
							href="./shippingInfo.jsp?cartId=<%=cartId%>">주문하기</a></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 50px">
				<table
					style="border: 1px #a39485 solid; font-size: 20px; box-shadow: 0 2px 5px rgba(0, 0, 0, .25); width: 100%; border-collapse: collapse; border-radius: 5px; overflow: hidden;">
					<thead style="font-weight: bold; color: black;">
						<tr>
							<th
								style="text-align: center; padding: 20px; vertical-align: middle;">상품</th>
							<th
								style="text-align: left; padding: 20px; vertical-align: middle;">가격</th>
							<th
								style="text-align: left; padding: 20px; vertical-align: middle;">수량</th>
							<th
								style="text-align: left; padding: 20px; vertical-align: middle;">가격</th>
							<th
								style="text-align: left; padding: 20px; vertical-align: middle;">비고</th>
						</tr>
					</thead>
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
							style="text-align: left; padding: 20px; vertical-align: middle;"><%=product.getProductId()%>
							- <%=product.getPname()%></td>
						<td
							style="text-align: left; padding: 20px; vertical-align: middle;"><%=product.getUnitPrice()%></td>
						<td
							style="text-align: left; padding: 20px; vertical-align: middle;"><%=product.getQuantity()%></td>
						<td
							style="text-align: left; padding: 20px; vertical-align: middle;"><%=total%></td>
						<td
							style="text-align: left; padding: 20px; vertical-align: middle;"><a
							href="./removeCart.jsp?id=<%=product.getProductId()%>"
							style="color: #73685d;">삭제</a></td>
					</tr>


					<%
					}
					%>

					<tr>
						<th></th>
						<th></th>
						<th
							style="text-align: left; padding: 20px; vertical-align: middle;">총액</th>
						<th
							style="text-align: left; padding: 20px; vertical-align: middle;"><%=sum%></th>
						<th></th>
					</tr>

				</table>
				<a href="./products.jsp" style="color: #7D5A5A; font-size: 20px">
					&laquo; 쇼핑 계속하기</a>
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>