<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="yea.*"%>

<%
if(request.getParameter("submit") != null){
	Util util = (Util)application.getAttribute("util");
	Award award = new Award(
			request.getParameter("name"),
			request.getParameter("description"),
			request.getParameter("submitter"),
			request.getParameter("recipient")
			);
	award.insert();
	response.sendRedirect("index.jsp");
}
%>


<%@page import="yea.Award"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Submit Award</title>
</head>
<body>
<form action="" method="post">
<table>
<tr>
<td>Award name: </td>
<td><input type="text" name="name" /></td>
</tr>
<tr>
<td>Description: </td>
<td><input type="text" name="description" /></td>
</tr>
<tr>
<td>Submitter's name: </td>
<td><input type="text" name="submitter" /></td>
</tr>
<tr>
<td>Recipient's name: </td>
<td><input type="text" name="recipient" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="Submit" />
<input type="reset" /></td>
</tr>
</table>
</form>
</body>
</html>