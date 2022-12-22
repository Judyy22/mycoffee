<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>

<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>상품 수정</h1>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<%
		String productId = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div>
			<div style="margin: auto;">
				<div>
					<img src="./mycoffee/<%=rs.getString("p_fileName")%>" alt="image"
						style="width: 400px; padding-left: 50px; padding-tio: 10px;" />
				</div>
				<div style="position: relative; left: 500px; top: -400px;">
					<form name="newProduct" action="./processUpdateProduct.jsp"
						method="post" enctype="multipart/form-data">
						<div>
							<label style="font-size: 25px;">상품 코드</label>
							<div style="position: relative; left: 110px; top: -30px;">
								<input type="text" id="productId" name="productId"
									style="height: 30px; font-size: 20px; padding-left: 10px"
									value='<%=rs.getString("p_id")%>'>
							</div>
						</div>
						<div>
							<label style="font-size: 25px;">상품명</label>
							<div style="position: relative; left: 110px; top: -30px;">
								<input type="text" id="name" name="name"
									style="height: 30px; font-size: 20px; padding-left: 10px"
									value="<%=rs.getString("p_name")%>">
							</div>
						</div>
						<div>
							<label style="font-size: 25px;">가격</label>
							<div style="position: relative; left: 110px; top: -30px;">
								<input type="text" id="unitPrice" name="unitPrice"
									style="height: 30px; font-size: 20px; padding-left: 10px"
									value="<%=rs.getInt("p_unitPrice")%>">
							</div>
						</div>
						<div>
							<label style="font-size: 25px;">상세 설명</label>
							<div>
								<textarea name="description" cols="50" rows="2"
									style="height: 80px; font-size: 20px; padding-left: 10px; padding-top: 10px;"><%=rs.getString("p_description")%></textarea>
							</div>
						</div>
						<div>
							<div>
								<label style="font-size: 25px; position: relative; top: 10px;">분류</label>
							</div>
							<div style="font-size: 25px; position: relative; top: 10px;">
								<input type="radio" name="category" value="espresso">
								espresso <input type="radio" name="category" value="frappuccino">
								frappuccino <input type="radio" name="category" value="tea">
								tea <input type="radio" name="category" value="blended">
								blended
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 25px; position: relative; top: 13px;">이미지</label>
							<div class="col-sm-5">
								<input type="file" name="productImage"
									style="font-size: 25px; position: relative; top: 13px;">
							</div>
						</div>
						<div>
							<div>
								<input type="submit"
									style="position: relative; top: 30px; width: 80px; height: 40px; font-size: 20px; border-radius: 15px; border-color: #7D5A5A; background: #7D5A5A; color: #FAF2F2"
									value="등록">
							</div>
						</div>
					</form>

				</div>
			</div>
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
	<jsp:include page="footer.jsp" />
</body>
</html>
