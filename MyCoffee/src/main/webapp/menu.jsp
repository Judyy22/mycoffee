<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style.css">
<style>
.dropdown {
	margin-right: 50px;
}

.dropbtn {
	border: hidden;
	font-weight: 400;
	color: #7D5A5A;
	padding-top: 14px;
	text-align: left;
	cursor: pointer;
	border: hidden;
	font-size: 20px;
}

.dropdown-content {
	display: none;
	position: absolute;
	z-index: 1; /*다른 요소들보다 앞에 배치*/
	/* font-weight: 400; */
	background-color: #f9f9f9;
	min-width: 150px;
}

.dropdown-content a {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 20px;
	padding-left: 12px;
}

.dropdown-content a:hover {
	background-color: #ececec
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<nav>
		<div class="title">
			<h1>MY COFFEE</h1>
		</div>
		<div class="header">
			<div style="width: 300px; margin-top: 15px; text-align: center;">
				<a href="Welcome.jsp" style="font-size: 20px; color: #7D5A5A;">
					HOME </a>
			</div>
			<ul
				style="display: flex; justify-content: flex-end; line-height: 50px; width: 980px; list-style: none;">
				<c:choose>
					<c:when test="${empty sessionId }">
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;"
							href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;"
							href="<c:url value="/member/addMember.jsp"/>">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="margin-right: 50px; color: black">[<%=sessionId%>님]
						</li>
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;"
							href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;"
							href="<c:url value="/member/updateMember.jsp"/>">내정보</a></li>
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;"
							href="<c:url value="/cart.jsp"/>">장바구니</a></li>
						<li style="margin-right: 50px;"><a
							style="font-size: 20px; color: #7D5A5A;" href="#">주문내역</a></li>
					</c:otherwise>
				</c:choose>

				<%-- <li style="margin-right: 50px;"><a
					style="font-size: 20px; color: #7D5A5A;"
					href="<c:url value="/products.jsp"/>">상품 목록</a></li> --%>
				

				<li class="dropdown"><a href="<c:url value="/products.jsp"/>"><button
							class="dropbtn">상품목록</button></a>
					<div class="dropdown-content">
						<a href="<c:url value="/products.jsp?category=espresso"/>">ESPRESSO</a>
						<a href="<c:url value="/products.jsp?category=tea"/>">TEA</a><a
							href="<c:url value="/products.jsp?category=blended"/>">BLENDED</a><a
							href="<c:url value="/products.jsp?category=frappuccino"/>">FRAPPUCCINO</a>
					</div></li>


				<%-- <li class="dropdown">
					<button class="dropbtn">상품 목록</button>
					<div class="dropdown-content">
						<a href="<c:url value="/products.jsp"/>">상품 등록</a> <a
							href="<c:url value="/products.jsp"/>">상품 수정</a>
					</div>
				</li> --%>

				<li style="margin-right: 50px;"><a
					style="font-size: 20px; color: #7D5A5A;"
					href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>

				<li class="dropdown">
					<button class="dropbtn">관리자</button>
					<div class="dropdown-content">
						<a href="<c:url value="/addProduct.jsp"/>">상품등록</a> <a
							href="<c:url value="/editProduct.jsp"/>">상품수정</a>
					</div>
				</li>
			</ul>
		</div>


	</nav>
	<script>
		function dp_menu() {
			let click = document.getElementById("drop-content");
			if (click.style.display === "none") {
				click.style.display = "block";

			} else {
				click.style.display = "none";

			}
		}
	</script>
</body>
</html>
