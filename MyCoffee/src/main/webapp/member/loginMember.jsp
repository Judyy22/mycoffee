<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="../style.css">
</head>
<body>
	<div class="bg_color">
		<jsp:include page="../menu.jsp" />
		<div class="login_main">
			<div class="login_first">
				<div class="login_second">
					<h1>로그인</h1>
					<br>
					<div>
						<%
						String error = request.getParameter("error");
						if (error != null) {
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해 주세요");
							out.println("</div>");
						}
						%>
						<form action="processLoginMember.jsp" method="post">
							<div>
								<div>
									<label for="inputUserName"></label> <input class="textbox"
										type="text" placeholder="ID" name='id' required
										autofocus>
								</div>
								<br>
								<div>
									<label for="inputPassword"></label> <input class="textbox"
										type="password" placeholder="Password" name='password'
										required>
								</div>
							</div>
							<br> <br>
							<button class="button" type="submit">로그인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>