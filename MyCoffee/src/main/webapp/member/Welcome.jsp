<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="../style.css">
</head>
<body>
	<div class="bg_color">
		<%@ include file="../menu.jsp"%>
		<div class="hello">
			<div class="hello_position">
				<p>
					안녕하세요. <br>MY COFFEE 입니다.
			</div>
		</div>
		<div class="main">
			<div class="main_photo">
				<img src="../resources/main_image.jpg">
			</div>
			<div class="main_text">
				<p>
					우리모두의 가을, <br>MY COFFEE와 함께 <br>풍성하게 즐겨보세요!
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>