<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/MAS_FAMSHBOOM";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
	String id = request.getParameter("jp_ID");
	String date = request.getParameter("date");
	String khutbahTitle = request.getParameter("khutbahTitle");
	
	if(id != null)
	{
		Connection con = null;
		PreparedStatement ps = null;
		int personID = Integer.parseInt(id);
	try
	{
		Class.forName(driverName);
		con = DriverManager.getConnection(url,user,psw);
		String sql="Update jumaat_prayer set jp_ID=?,date=?,khutbahTitle=? where jp_ID="+id;
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, date);
		ps.setString(3, khutbahTitle);
		
		int i = ps.executeUpdate();
		if(i > 0)
		{
		out.print("Record Updated Successfully");
		}
		else
		{
		out.print("There is a problem in updating Record.");
		} 
		}
		catch(SQLException sql)
		{
		request.setAttribute("error", sql);
		out.println(sql);
	}
	}
%>