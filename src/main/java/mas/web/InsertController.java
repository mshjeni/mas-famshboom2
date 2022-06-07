package mas.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mas.dao.ConnectionManager;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = null;
	static Statement stmt = null;
	static PreparedStatement ps = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//retrieve input
		String date = request.getParameter("date");
		String khutbahTitle = request.getParameter("khutbahTitle");
		
		try {
			//call getConnection() method from ConnectionManager class
			con = ConnectionManager.getConnection();
			
			//3. create statement
			//stmt = con.createStatement();
			String sql = "INSERT INTO jumaat_prayer(date, khutbahTitle)VALUES(?, ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, date);
			ps.setString(2, khutbahTitle);
			
			//4. execute query
			ps.executeUpdate();
			
			//5.close connection
			ps.close();
			con.close();
			
			// Get a writer pointer 
            // to display the successful result
			response.sendRedirect("CreateSlotJumaat.jsp?success=1");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
