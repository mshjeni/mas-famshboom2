<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="AdminHeader.jsp" %>


<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("jp_ID");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "MAS_FAMSHBOOM";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Masjid Appointment System Admin</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>


<body>
	<br><h2 align="center"><font><strong>Slot List</strong></font></h2>
	<br>
	<!-- Tabs for slot category -->
	<ul class="nav nav-tabs nav-fill">
		<li class="nav-item">
	    	<a class="nav-link active" aria-current="page" href="ManageSlot.jsp">Jumaat Prayer</a>
		</li>
	  	<li class="nav-item">
	    	<a class="nav-link disabled" href="MengajiClass.jsp">Mengaji Class</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link disabled" href="HajiUmrah.jsp">Haji/Umrah</a>
	  	</li>
	</ul>
	<br>
	
	<!-- New Slot button -->
	<div class="d-flex justify-content-center">
  		<a href="CreateSlotJumaat.jsp"><button class="btn btn-dark" type="button">New Slot</button></a>
	</div>
	<br>
	
	<!-- Jumaat Prayer Slot Table-->
	<div class="row justify-content-center">
    <div class="col-auto">
    <table class="table table-responsive">
		<tr></tr>
		<tr bgcolor="#060606" style="color:white;">
			<td><b>Id</b></td>
			<td><b>Date</b></td>
			<td><b>Khutbah Title</b></td>
			<td><b>Action</b></td>
		</tr>
		<%
			try{ 
			connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
			statement=connection.createStatement();
			String sql ="select * from jumaat_prayer";
			
			resultSet = statement.executeQuery(sql);
			int i=0;
			while(resultSet.next()){
		%>
		<tr bgcolor="#E3E3E3">
	
			<td><%=resultSet.getString("jp_ID") %></td>
			<td><%=resultSet.getString("date") %></td>
			<td><%=resultSet.getString("khutbahTitle") %></td>
			<td>
	             <a href="slotUpd.jsp?id=<%=resultSet.getString("jp_ID")%>">Edit</a>
 					&nbsp;&nbsp;&nbsp;&nbsp;
	              <a href="/DeleteSlot.jsp?id=<%=resultSet.getString("jp_ID") %> />">Delete</a>                     
            </td>
		</tr>
	
		<% 
		i++;
		}
		
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	</div>
	</div>
</body>
</html>
 