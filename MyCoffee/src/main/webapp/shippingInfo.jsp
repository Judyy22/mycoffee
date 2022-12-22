<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="bg_color">
		<div class="pl_header">
			<div class="pl_secondheader">
				<h1>주문서</h1>
			</div>
		</div>
		<div class="ap_container">
			<br style="background: #7D5A5A;">
			<form action="./processShippingInfo.jsp" method="post" class="ap_se1">
				<input type="hidden" name="cartId"
					value="<%=request.getParameter("cartId")%>" />
				<div class="ap_se2">
					<div class="ap_se3">
						<label>성명</label>
						<div style="margin: auto 0px;">
							<input name="name" type="text"
								style="width: 400px; height: 40px; position: relative; left: -190px; font-size:25px;" />
						</div>
					</div>
					<div class="ap_se3">
						<label style="margin: auto 0px;">픽업 시간</label>
						<div
							style="margin: auto 0px;height: 40px; position: relative; left: -250px; font-size:25px;">
							<select name="pickupHH" style="width:100px; font-size:20px; height:40px">
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
							</select>&nbsp;&nbsp;시 &nbsp;&nbsp;<select name="pickupMM" style="width:100px; font-size:20px; height:40px;">
								<option value="00">00</option>
								<option value="30">30</option>
							</select>&nbsp;&nbsp;분
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
								style="color: #7D5A5A; font-size: 25px" role="button">이전
								&nbsp; &nbsp; &nbsp;</a> <input type="submit"
								style="color: #7D5A5A; font-size: 25px; border: none; background: none; cursor: pointer;"
								value="등록" /> <a href="./checkOutCancelled.jsp"
								style="color: #7D5A5A; font-size: 25px" role="button">&nbsp;
								&nbsp; &nbsp; 취소</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>