<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
request.setCharacterEncoding("UTF-8");

Cookie cartId = new Cookie("Pickup_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
Cookie name = new Cookie("Pickup_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
Cookie hour = new Cookie("Pickup_pickupHH",URLEncoder.encode(request.getParameter("pickupHH"), "utf-8"));
Cookie minute = new Cookie("Pickup_pickupMM",URLEncoder.encode(request.getParameter("pickupMM"), "utf-8"));

cartId.setMaxAge(24 * 60 * 60);
name.setMaxAge(24 * 60 * 60);


response.addCookie(cartId);
response.addCookie(name);
response.addCookie(hour);
response.addCookie(minute);


response.sendRedirect("orderConfirmation.jsp");
%>
