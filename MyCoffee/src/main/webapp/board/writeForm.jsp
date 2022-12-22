<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String name = (String) request.getAttribute("name");
%>
<html>
<head>
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>게시판</h1>
			</div>
		</div>

		<div>

			<form name="newWrite" action="./BoardWriteAction.do" method="post"
				onsubmit="return checkForm()">
				<input name="id" type="hidden" value="${sessionId}">
				<table border="1" style="margin: auto;">
					<tr>
						<td style="padding: 20px;">성명</td>
						<td style="padding: 20px;"><input name="name" type="text"
							style="font-size: 20px;" value="<%=name%>" placeholder="name"></td>
						<%-- <td style="padding: 20px; font-size:20px;"><%=name%></td> --%>
					</tr>
					<tr>
						<td style="padding: 20px;">제목</td>
						<td style="padding: 20px;"><input name="subject" type="text"
							style="width: 810px; height: 30px; font-size: 20px;"
							placeholder="subject"></td>
					</tr>
					<tr>
						<td style="text-align: center;">내용</td>
						<td colspan="2"
							style="height: 200px; width: 800px; vertical-align: top; padding: 20px;"><textarea
								name="content" cols="50" rows="5"
								style="width: 810px; height: 300px; font-size: 20px;"
								placeholder="content"></textarea></td>
					</tr>
				</table>




				<div>
					<div>
						<input type="submit" value="등록 "
							style="padding-left: 20px; color: #7D5A5A; font-size: 20px; border: none; background: none; cursor: pointer;">
						<input type="reset" value="취소 "
							style="padding-left: 20px; color: #7D5A5A; font-size: 20px; border: none; background: none; cursor: pointer;">
					</div>
				</div>
			</form>
			<hr>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



