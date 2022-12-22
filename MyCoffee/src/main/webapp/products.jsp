<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./style.css">
<title>상품 목록</title>
</head>
<body>
	<%

	%>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>상품 목록</h1>
			</div>
		</div>
		<div
			style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px;">
			<%@ include file="dbconn.jsp"%>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String category = request.getParameter("category");

			if (category != null) {
				pstmt = conn.prepareStatement("select * from product where p_category ='" + category + "'");
			} else {
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div
				style="background: #FAF2F2; border-radius: 15px; text-align: center; padding: 9px;">
				<img src="./mycoffee/<%=rs.getString("p_fileName")%>"
					style="width: 300px;">
				<h3 style="padding: 3px;"><%=rs.getString("p_name")%></h3>
				<p style="width: 320px; margin: auto; padding: 6px;"><%=rs.getString("p_description")%>
				<p style="padding: 3px;"><%=rs.getString("p_UnitPrice")%>원
				<div
					style="border: 2px solid #7D5A5A; width: 100px; margin: auto; border-radius: 15px; background: #7D5A5A">
					<p>
						<a href="./product.jsp?id=<%=rs.getString("p_id")%>" role="button"
							style="color: #FAF2F2;">상세정보 &raquo;</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>