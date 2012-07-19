<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View Awards</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection dbCon = DriverManager.getConnection("jdbc:mysql://localhost/alti", "alti", "56978100");
Statement s = dbCon.createStatement();
String sql = "SELECT award_id,name,description,submitter,recipient FROM Awards";
ResultSet rs = s.executeQuery(sql);
%>
<table border=1>
<tr>
<th>Name</th>
<th>Description</th>
<th>Submitter</th>
<th>Recipient</th>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("description") %></td>
<td><%= rs.getString("submitter") %></td>
<td><%= rs.getString("recipient") %></td>
</tr>
<%
}         
dbCon.close();
%>
</table>
</body>
</html>