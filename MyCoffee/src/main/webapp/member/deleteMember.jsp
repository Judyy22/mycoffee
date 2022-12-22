<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<%
String Id = request.getParameter("id");

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from member";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
 
if (rs.next()) {
	sql = "delete from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, Id);
	pstmt.executeUpdate();
} else
	out.println("일치하는 계정이 없습니다.");

if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

response.sendRedirect("resultMember.jsp?msg=delete");
%>