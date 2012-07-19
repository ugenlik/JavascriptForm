<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="yea.Util"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>YEA - Login</title>
</head>
<body>
<form action="" method="post">
<table border="0">
<tr>
<td>User name: </td>
<td><input type="text" name="username" /></td>
</tr>
<tr>
<td>Password: </td>
<td><input type="password" name="password" /></td>
</tr>
<tr>
<td>
</td>
<td>
<input type="submit" value="Login"/>
</td>
</tr>
<tr>
<td>
</td>
<td>
<%
Util util = (Util)application.getAttribute("util");
String username = request.getParameter("username");
String password = request.getParameter("password");
if(username != null && password != null){
	if(util.checkLogin(username, password)){
		session.setAttribute("username", username);
		response.sendRedirect("index.jsp");
	}else{
		out.println("Login incorrect");
	}
}
%>
</td>
</tr>
</table>
</form>
</body>
</html>