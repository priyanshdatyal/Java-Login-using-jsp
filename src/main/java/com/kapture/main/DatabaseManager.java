package com.kapture.main;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseManager {
	private java.sql.Statement statement=null;
	private java.sql.Connection connection=null;
	
	public void makeConnection() {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	          String url = "jdbc:mysql://localhost:3306/kapturecrm";
	        
	          connection = DriverManager.getConnection(url,"root","root");
	        
	          statement = (java.sql.Statement) connection.createStatement();
		}
	    catch(Exception e) {
	        System.out.println(e);
	    }
	}

	public String addUser(String f,String l,String u,String p) {
		try {
			
			
			java.sql.PreparedStatement st = connection.prepareStatement("insert into registeredusersinfo values(?, ?,?,?)");

	        st.setString(1,f);
	        st.setString(2,l);
	        st.setString(3,u);
	        st.setString(4,p);
	        st.executeUpdate();
	        return "Success";
		}
		catch(Exception e) {
	        return e.toString();
		}
	}	
	
	public void finalize() throws Throwable{
	    if (connection != null) {
	        try {
	        	connection.close();
	        } catch (SQLException e) { }
	    }
	}

	public void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	public ResultSet getGames() {
		
		ResultSet res = null;
		try {
			res = statement.executeQuery("select * from gameinfo;");
		} catch (SQLException e) {
			System.out.println("Error is "+e);
			e.printStackTrace();
		}
		return res;
		
	}

	public ResultSet getUsers() {

		ResultSet res = null;
		try {
			res = statement.executeQuery("select FirstName,UserName,Password from registeredusersinfo;");
		} catch (SQLException e) {
			System.out.println("Error is "+e);
			e.printStackTrace();
		}
		return res;
	}

	
}
