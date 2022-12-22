<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
List boardList = (List) request.getAttribute("boardlist");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
<link rel="stylesheet" href="../style.css">
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>게시판</h1>
			</div>
		</div>


		<div>
			<form action="<c:url value="../BoardListAction.do"/>" method="post">
				<div style="padding: 0px 0px 5px 40px;">
					<span style="font-size: 17px;">전체 <%=total_record%>건
					</span> <span style="font-size: 20px; align: right;"><a href="#"
						onclick="checkForm(); return false;"
						style="color: #7D5A5A; font-size: 20px">&laquo;글쓰기</a></span>
				</div>
				<div>
					<table
						style="border: 1px #a39485 solid; font-size: 20px; box-shadow: 0 2px 5px rgba(0, 0, 0, .25); width: 100%; border-collapse: collapse; border-radius: 5px; overflow: hidden;">
						<tr
							style="font-weight: bold; color: black; border-bottom: 1px solid gray;">
							<th
								style="text-align: center; padding: 10px; vertical-align: middle; width: 40px;">번호</th>
							<th
								style="text-align: center; padding: 10px; vertical-align: middle; width: 700px;">제목</th>
							<th
								style="text-align: center; padding: 10px; vertical-align: middle;">작성일</th>
							<th
								style="text-align: left; padding: 10px; vertical-align: middle;">조회</th>
							<th
								style="text-align: left; padding: 10px; vertical-align: middle;">글쓴이</th>
						</tr>
						<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
						%>
						<tr>
							<td
								style="text-align: center; padding: 10px; vertical-align: middle;"><%=notice.getNum()%></td>
							<td
								style="text-align: center; padding: 10px; vertical-align: middle;"><a
								href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
							<td
								style="text-align: center; padding: 10px; vertical-align: middle;"><%=notice.getRegist_day()%></td>
							<td
								style="text-align: left; padding: 10px; vertical-align: middle;"><%=notice.getHit()%></td>
							<td
								style="text-align: left; padding: 10px; vertical-align: middle;"><%=notice.getName()%></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
				<div align="center">
					<c:set var="pageNum" value="<%=pageNum%>" />
					<c:forEach var="i" begin="1" end="<%=total_page%>">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'><b> [${i}]</b></font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'> [${i}]</font>

								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>
				</div>
				<div>
					<table>
						<tr>
							<td align="left" style="padding:10px;">&nbsp;&nbsp; <select name="items"  style="background:none; width:100px; height:30px;">
									<option value="subject">제목</option>
									<option value="content">본문</option>
									<option value="name">글쓴이</option>
							</select> <input name="text" type="text" style="background:none; width:200px; height:30px;" /> <input type="submit"
								id="btnAdd" class="btn btn-primary " value="검색 "
								style="color: #7D5A5A; font-size: 20px; border: none; background: none; cursor: pointer;" />
							</td>

						</tr>
					</table>
				</div>
			</form>
			<hr>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>





