<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="../style.css">
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>회원 정보</h1>
			</div>
		</div>
		<div class="container">
			<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0")) {
					out.println("<h2>회원정보 수정이 되었습니다..</h2>");
				} else if (msg.equals("1")) {
					out.println("<h2>회원가입 해주셔서 감사합니다.</h2>");
				} else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2>" + loginId + "님 환영합니다</h2>");
				}
			} else {
				out.println("<h2 >회원정보가 삭제되었습니다.</h2>");
			}
			%>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
