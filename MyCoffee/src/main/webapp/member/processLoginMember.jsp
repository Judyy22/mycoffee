<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- <%@ include file="../dbconn.jsp" %> --%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:orcl" 
	driver="oracle.jdbc.driver.OracleDriver" user="cafe" password="cafe" /> 

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE id=? and password=?  
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="Welcome.jsp" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />
