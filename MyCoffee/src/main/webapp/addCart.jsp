<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
//전송된 상품 id
String id = request.getParameter("id");

//상품 id 넘어오지 않았을 때 강제로 products.jsp 이동시키고 종료
if (id == null || id.trim().equals("")) {
	response.sendRedirect("products.jsp");
	return;
}

//상품 데이터 접근 클래스의 인스턴스 생성
ProductRepository dao = ProductRepository.getInstance();

//해단 id값을 이용해서 상품상세정보 얻어오는 코드
Product product = dao.getProductById(id);
if (product == null) { //해당 상품이 없을경우
	response.sendRedirect("exceptionNoProductId.jsp");
}

//모든 상품을 가져옴
ArrayList<Product> goodsList = dao.getAllProducts();
Product goods = new Product();
for (int i = 0; i < goodsList.size(); i++) {
	//상품 리스트 중에서 사용자 주문을 한 그 상품의 id가 일치하는 코드를 얻어서 Product 에 대입
	goods = goodsList.get(i);
	if (goods.getProductId().equals(id)) {
		break;
	}
}

//세션 속성의 이름이 cartList인 session정보(장바구니에 담겨져있는 물품 목록)를 가져와서 ArrayList에 대입
ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
if (list == null) {
	//cartlist 값이 null이라면 새로운 ArrayList를 만들고 세션에 cartlist이름으로 list라는 값을 대입
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

//사용자가 주문한 상품이 장바구니에 이미 담긴 물품인지 검색해서 있다면 수량을 증가
int cnt = 0;
Product goodsQnt = new Product();

for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuantity);
	}
}

if (cnt == 0) {
	goods.setQuantity(1);
	list.add(goods);
}

response.sendRedirect("product.jsp?id=" + id);
%>