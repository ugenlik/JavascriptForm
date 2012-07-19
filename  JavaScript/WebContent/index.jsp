<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>YEA Enterance Page</title>
</head>
<body>
<%
if(request.getParameter("logout") != null){
	session.invalidate();
	response.sendRedirect("login.jsp");
}else if(session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
%>
<form action="">
<ul>
<li><a href="guidelines.html">View Program Guidelines</a></li>
<li><a href="submit.jsp">Submit an Award</a></li>
<li><a href="view.jsp">View Awards Given and Received</a></li>
<li><a href="reports.jsp">Reports</a></li>
<li><a href="admin.jsp">Administrator Function</a></li>
</ul>
<input type="submit" name="logout" value="Logout" />
</form>
</body>
</html>