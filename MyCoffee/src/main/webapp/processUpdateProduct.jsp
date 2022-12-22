<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
String filename = "";
String realFolder = getServletContext().getRealPath("/") + "mycoffee";
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
String productId = multi.getParameter("productId");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String category = multi.getParameter("category");


Integer price;

if (unitPrice.isEmpty())
	price = 0;
else
	price = Integer.valueOf(unitPrice);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from product where p_id =?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, productId);
rs = pstmt.executeQuery();

if (rs.next()) {
	if (fileName != null) {
		sql = "UPDATE product SET p_name=?,p_category=?, p_unitPrice=?, p_description=?, p_fileName=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, category);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setString(5, fileName);
		pstmt.setString(6, productId);
		pstmt.executeUpdate();
	} else {
		sql = "UPDATE product SET p_name=?,p_category=?, p_unitPrice=?, p_description=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		System.out.println(name);
		pstmt.setString(2, category);
		System.out.println(category);
		pstmt.setInt(3, price);
		System.out.println(price);
		pstmt.setString(4, description);
		System.out.println(description);
		pstmt.setString(5, productId);
		System.out.println(productId);
		pstmt.executeUpdate();
	}
}
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

response.sendRedirect("editProduct.jsp?edit=updte");
%>
