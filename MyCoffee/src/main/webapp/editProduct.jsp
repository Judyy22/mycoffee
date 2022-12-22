<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style.css">
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!" == true))
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>상품 편집</h1>
			</div>
		</div>
		<div class="container">
			<div
				style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px;">
				<%@include file="dbconn.jsp"%>
				<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
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
					<div>
						<p>

							<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"
								role="button"
								style="color: #FAF2F2; border: 2px solid #7D5A5A; width: 500px; margin: auto; border-radius: 5px; background: #7D5A5A">수정
								&raquo;</a> <a href="#"
								onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
								role="button"
								style="color: #FAF2F2; border: 2px solid #7D5A5A; width: 200px; margin: auto; border-radius: 5px; background: #7D5A5A">삭제
								&raquo;</a>
					</div>
				</div>
				<%
				}
				if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
				%>
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>