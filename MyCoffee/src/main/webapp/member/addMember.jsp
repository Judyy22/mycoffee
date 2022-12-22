<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../style.css">
<script type="text/javascript">
	function checkForm() {

		let form1 = "newMember";

		if (!document.forms[form1].elements["id"].value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>회원 가입</h1>
			</div>
		</div>

		<div class="ap_container">
			<br style="background: #7D5A5A;">
			<form name="newMember" action="processAddMember.jsp" method="post"
				onsubmit="return checkForm()" class="ap_se1">
				<div class="ap_se2">
					<div class="ap_se3">
						<label>아이디</label>
						<div style="margin: auto 0px;">
							<input name="id" type="text" placeholder="id"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>비밀번호</label>
						<div style="margin: auto 0px;">
							<input name="password" type="text" placeholder="password"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>비밀번호확인</label>
						<div style="margin: auto 0px;">
							<input name="password_confirm" type="text"
								placeholder="password confirm"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>성명</label>
						<div style="margin: auto 0px;">
							<input name="name" type="text" placeholder="name"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>생일</label>
						<div style="margin: auto 0px;">
							<input type="text" name="birth" maxlength="12"
								placeholder="yyyy.mm.dd" size="12"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>이메일</label>
						<div style="margin: auto 0px;">
							<input type="text" name="mail" maxlength="50"
								placeholder="email@email.com"
								style="width: 400px; height: 40px; position: relative; left: -190px;">
						</div>
					</div>
					<div class="ap_se3">
						<label>전화번호</label>
						<div style="margin: auto 0px;">
							<input name="phone" type="text" placeholder="phone"
								style="width: 400px; height: 40px; position: relative; left: -190px;">

						</div>
					</div>

					<div style="margin: auto;">
						<div>
							<input type="submit" value="등록 "
								style="width: 80px; height: 40px; font-size: 20px; border-radius: 15px; border-color: #7D5A5A; background: #7D5A5A; color: #FAF2F2">
							<input type="reset" value="취소 " onclick="reset()"
								style="width: 80px; height: 40px; font-size: 20px; border-radius: 15px; border-color: #7D5A5A; background: #7D5A5A; color: #FAF2F2">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>