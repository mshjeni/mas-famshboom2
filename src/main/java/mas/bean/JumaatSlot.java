package mas.bean;

//Jumaat Prayer class
import java.sql.*;

public class JumaatSlot {
	public int jp_ID;
	public String date;
	public String khutbahTitle;
	
	
	public JumaatSlot(int jp_ID, String date, String khutbahTitle) {
		super();
		this.jp_ID = jp_ID;
		this.date = date;
		this.khutbahTitle = khutbahTitle;
	}
	
	public int getJp_ID() {
		return jp_ID;
	}
	public void setJp_ID(int jp_ID) {
		this.jp_ID = jp_ID;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getKhutbahTitle() {
		return khutbahTitle;
	}
	public void setKhutbahTitle(String khutbahTitle) {
		this.khutbahTitle = khutbahTitle;
	}
	
	public JumaatSlot (ResultSet rs) throws SQLException{
		this.jp_ID = rs.getInt("jp_ID");
		this.date = rs.getString("date");
		this.khutbahTitle = rs.getString("khutbahTitle");
	}
}
