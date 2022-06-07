<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="AdminHeader.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>

<body>
	<br><h2 align="center"><font><strong>New Slot</strong></font></h2>
	<br>
	<div class="d-flex justify-content-center">
  		<a href="ManageSlot2.jsp"><button class="btn btn-dark" type="button">Back</button></a>
	</div>
	<br><br>
	
	<!-- Create Slot Jumaat form -->
	<div class="row justify-content-center">
    <div class="col-auto">
		<form action="InsertController" method="post" style="align:center;">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Choose Date</label>
			  <input type="text" name="date" class="form-control" id="exampleFormControlInput1" placeholder="dd/mm/yyyy">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">Khutbah Title</label>
			  <textarea  name="khutbahTitle" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			<div class="mb-3">
			  <input class="btn btn-dark" type="submit" value="Create Now">
			  <input class="btn btn-dark" type="reset" value="Reset">
			</div>
		</form>
	</div>
	</div>
</body>
</html>