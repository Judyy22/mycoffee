<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>

<%
BoardDTO notice = (BoardDTO) request.getAttribute("board");
int num = ((Integer) request.getAttribute("num")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<title>Board</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>게시판</h1>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10 ">
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:choose>
					<c:when test="${sessionId==userId}">
						<div>
							<form name="newUpdate"
								action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
								method="post">
								<div style="padding: 20px;">
									<table border="1" style="margin: auto;">
										<tr>
											<td style="padding: 20px;">성명</td>
											<td style="padding: 20px;"><input name="name"
												style="width: 810px; height: 30px; font-size: 20px;"
												type="text" value="<%=notice.getName()%>"></td>
										</tr>
										<tr>
											<td style="padding: 20px;">제목</td>
											<td style="padding: 20px;"><input name="name"
												style="width: 810px; height: 30px; font-size: 20px;"
												type="text" value="<%=notice.getSubject()%>"></td>
										</tr>
										<tr>
											<td style="text-align: center;">내용</td>
											<td colspan="2"
												style="height: 200px; width: 800px; vertical-align: top; padding: 20px;"><textarea
													name="content" cols="50" rows="5"
													style="width: 810px; height: 300px; font-size: 20px;"><%=notice.getContent()%></textarea></td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<p>
							<a
								href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
								style="color: #7D5A5A; font-size: 20px"> 삭제</a> <input
								type="submit" value="수정 "
								style="color: #7D5A5A; font-size: 20px; border: none; background: none; cursor: pointer;">
					</c:when>
					<c:otherwise>
						<div>
							<form name="newUpdate"
								action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
								method="post">
								<div style="padding: 20px;">
									<table border="1" style="margin: auto;">
										<tr>
											<td style="padding: 20px;">성명</td>
											<td style="padding: 20px;"><%=notice.getName()%></td>
										</tr>
										<tr>
											<td style="padding: 20px;">제목</td>
											<td style="padding: 20px;"><%=notice.getSubject()%></td>
										</tr>
										<tr>
											<td style="text-align: center;">내용</td>
											<td colspan="2"
												style="height: 200px; width: 800px; vertical-align: top; padding: 20px;"><%=notice.getContent()%></td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
				<a href="./BoardListAction.do?pageNum=<%=nowpage%>"
					style="color: #7D5A5A; font-size: 20px"> 목록</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>


