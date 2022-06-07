<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.io.IOException" %>
<%
	String jp_ID = request.getParameter("jp_ID");
	String driver = "com.mysql,jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "MAS_FAMSHBOOM";
	String userid = "root";
	String password = "";
	
	try{
		Class.forName(driver);
	}
	catch (ClassNotFoundException e){
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<%
	try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		statement =connection.createStatement();
		String sql = "select * from jumaat_prayer where jp_ID="+jp_ID;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Masjid Appointment System Admin</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
	</script>
<title>UPDATE SOLAT JUMAAT</title>
</head>
<body>
<br><h2 align="center"><font><strong>SOLAT JUMAAT UPDATE</strong></font></h2>
	<br>
	<div class="d-flex justify-content-center">
  		<a href=""><button class="btn btn-dark" type="button">Back</button></a>
	</div>
	<br><br>
	<!-- Update Slot Jumaat form -->
	<div class="row justify-content-center">
    <div class="col-auto">
		<form action="updProcess.jsp" method="post" style="align:center;">
			<div class="mb-3">
				<input type="hidden" name="jp_ID" value="<%=resultSet.getString("jp_ID") %>">
			  <label for="exampleFormControlInput1" class="form-label">Choose Date</label>
			  <input type="text" name="date" class="form-control" id="exampleFormControlInput1" value="<%=resultSet.getString("date") %>">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">Khutbah Title</label>
			  <input type="text" name="khutbahTitle" class="form-control" id="exampleFormControlInput1" value="<%=resultSet.getString("khutbahTitle") %>">

			</div>
			<div class="mb-3">
			  <input class="btn btn-dark" type="submit" value=" Update">
			  <input class="btn btn-dark" type="reset" value="Reset">
			</div>
		</form>
	</div>
	</div>
	<%
		}
		connection.close();
	} catch (Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>