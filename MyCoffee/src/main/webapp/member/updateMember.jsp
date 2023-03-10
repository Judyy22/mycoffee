<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:orcl"
	driver="oracle.jdbc.driver.OracleDriver" user="cafe" password="cafe" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<link rel="stylesheet" href="../style.css">
<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>내 정보</h1>
			</div>
		</div>

		<c:forEach var="row" items="${resultSet.rows}">

			<div class="ap_container">
				<br style="background: #7D5A5A;">
				<form name="newMember" class="ap_se1"
					action="processUpdateMember.jsp" method="post"
					onsubmit="return checkForm()">
					<div class="ap_se2">
						<div class="ap_se3">
							<label>아이디</label>
							<div style="margin: auto 0px;">
								<input name="id" type="text"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;"
									placeholder="id" value="<c:out value='${row.id }'/>" />
							</div>
						</div>
						<div class="ap_se3">
							<label>비밀번호</label>
							<div style="margin: auto 0px;">
								<input name="password" type="text"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;"
									placeholder="password">
							</div>
						</div>
						<div class="ap_se3">
							<label>비밀번호확인</label>
							<div style="margin: auto 0px;">
								<input name="password_confirm" type="text"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;"
									placeholder="password_confirm">
							</div>
						</div>
						<div class="ap_se3">
							<label>성명</label>
							<div style="margin: auto 0px;">
								<input name="name" type="text"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;"
									placeholder="name" value="<c:out value='${row.name }'/>">
							</div>
						</div>

						<div class="ap_se3">
							<label>생일</label>
							<div style="margin: auto 0px;">
								<input type="text" name="birth" maxlength="12"
									placeholder="yyyy.mm.dd" size="12" value="${row.birth}"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;">
							</div>
						</div>
						<div class="ap_se3">
							<label>이메일</label>
							<div style="margin: auto 0px;">
								<input type="text" name="mail" maxlength="50"
									placeholder="email@email.com" value="${row.mail}"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;">
							</div>
						</div>
						<div class="ap_se3">
							<label>전화번호</label>
							<div style="margin: auto 0px;">
								<input name="phone" type="text"
									style="width: 400px; height: 40px; position: relative; left: -190px; font-size: 20px;"
									placeholder="phone" value="<c:out value='${row.phone}'/>">

							</div>
						</div>
						<div>
							<div>
								<input type="submit"
									style="color: #7D5A5A; font-size: 25px; border: none; background: none; cursor: pointer;"
									value="회원수정 "> <a href="deleteMember.jsp"
									style="color: #7D5A5A; font-size: 25px"> &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp;회원탈퇴</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm');
		for (i = 0, j = selectBirth.length; i < j; i++) {
			if (selectBirth.options[i].value == val) {
				selectBirth.options[i].selected = true;
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
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