package com.kapture.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class LoginDao {
     public String authenticateUser(String u, String p,DatabaseManager db)
     {
    	 
         ResultSet resultSet = null;
 
         String userNameDB = "";
         String passwordDB = "";
 
         try
         {
        	 resultSet=db.getUsers();
             while(resultSet.next()) // Until next row is present otherwise it return false
             {
              userNameDB = resultSet.getString("UserName"); //fetch the values present in database
              passwordDB = resultSet.getString("Password");
 
               if(u.equals(userNameDB) && p.equals(passwordDB))
               {
                  return "Success."+resultSet.getString("FirstName"); ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials"; // Return appropriate message in case of failure
         }
}