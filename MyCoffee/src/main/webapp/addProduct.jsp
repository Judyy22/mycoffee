<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style.css">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>상품 등록</h1>
			</div>
		</div>
		<div class="ap_container">
			<br style="background: #7D5A5A;">
			<form name="newProduct" action="./processAddProduct.jsp"
				method="post" enctype="multipart/form-data" class="ap_se1">
				<div class="ap_se2">
					<div class="ap_se3">
						<label>상품코드</label>
						<div style="margin: auto 0px; font-sie: 20px;">
							<input type="text" name="productId"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>상품상품명</label>
						<div style="margin: auto 0px;">
							<input type="text" name="name"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>가격</label>
						<div style="margin: auto 0px;">
							<input type="text" name="unitPrice"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>상세 정보</label>
						<div style="margin: auto 0px;">
							<textarea name="description" cols="50" rows="2"
								style="width: 400px; height: 40px; position: relative; left: -190px;"></textarea>
						</div>
					</div>
					<div class="ap_se3">
						<label>분류</label>
						<div
							style="margin: auto; position: relative; left: -190px; font-size: 30px;">
							<input type="radio" name="category" value="espresso">
							espresso <input type="radio" name="category" value="frappuccino">
							frappuccino <input type="radio" name="category" value="tea">
							tea <input type="radio" name="category" value="blended">
							blended
						</div>
					</div>
					<div class="ap_se3">
						<label>이미지</label>
						<div class="box-file-input">
							<label><input type="file" name="filename"
								class="file-input" accept="image/*"></label><span
								class="filename" style="">파일을 선택해주세요.</span>
						</div>
					</div>
					<div style="margin: auto;">
						<div>
							<input type="submit" value="등록"
								style="width: 80px; height: 40px; font-size: 20px; border-radius: 15px; border-color: #7D5A5A; background: #7D5A5A; color: #FAF2F2">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(document).on("change", ".file-input", function() {

			$filename = $(this).val();

			if ($filename == "")
				$filename = "파일을 선택해주세요.";

			$(".filename").text($filename);

		})
	</script>
</body>
</html>