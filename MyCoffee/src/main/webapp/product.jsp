<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style.css">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addform.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>상품 정보</h1>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<%
		String id = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where p_id ='" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		%>

		<div style="border-radius: 15px; text-align: center; padding: 9px;">
			<div>
				<img src="./mycoffee/<%=rs.getString("p_fileName")%>"
					style="width: 500px; padding-top: 30px;">
			</div>
			<div>
				<h3 style="padding-top: 30px; font-size: 50px;"><%=rs.getString("p_name")%></h3>
				<p style="padding-top: 15px; font-size: 30px;">
					상품 코드 : <span><%=rs.getString("p_id")%></span>
				<p style="padding-top: 15px; font-size: 30px;">
					분류 : <span> <%=rs.getString("p_category")%></span>
				<p
					style="padding-top: 30px; font-size: 40px; width: 950px; margin: auto;">
					<%=rs.getString("p_description")%>
				<h4 style="padding-top: 30px; font-size: 40px;">가격 : <%=rs.getString("p_UnitPrice")%>원
				</h4>

				<form name="addForm"
					action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
					<p style="border: 2px solid #7D5A5A; width: 200px; height:40px; border-radius: 15px; background: #7D5A5A; margin:20px auto; font-size:20px;padding-top:5px;" >
						<a style ="color:white;"href="#" onclick="addToCart()">장바구니 추가 &raquo;</a>
					<p style="border: 2px solid #7D5A5A; width: 200px; height:40px; border-radius: 15px; background: #7D5A5A; margin:20px auto; font-size:20px; padding-top:5px;">
						<a style ="color:white;"href="./products.jsp">상품 목록 &raquo;</a>
				</form>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>