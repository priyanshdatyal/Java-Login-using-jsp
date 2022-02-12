package com.kapture.web;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kapture.main.DatabaseManager;
import com.kapture.main.LoginDao;
import com.kapture.model.GameInfo;

//@WebServlet(name = "LoginController", urlPatterns = {"/userlogin"})

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("loginmail");
 		String password = request.getParameter("l_password");
 		
 		LoginDao login = new LoginDao();
 		DatabaseManager db = new DatabaseManager();
 		db.makeConnection();
        String userValidate ="";
        try{

            userValidate=login.authenticateUser(userName,password,db);//Calling authenticateUser function
        }
        catch(Exception e) {
            request.setAttribute("error", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
 
        if(userValidate.contains("Success.")) //If function returns success string then user will be rooted to Home page
         {
        	request.setAttribute("error","");
        	request.setAttribute("name",userValidate.substring(userValidate.lastIndexOf(".") + 1));
        	request.setAttribute("message","Logged In Successfully");
        	
        	ResultSet games = db.getGames();
			GameInfo g = new GameInfo();
			List<GameInfo> gamesList =g.getGames(games);
			request.setAttribute("gamesinfo", gamesList);
			request.setAttribute("gamers", games);

			System.out.println("Checking in Forwarder\n\n");
			for (GameInfo model : gamesList) {
	            System.out.println(model.getName());
	            System.out.println(model.getDesc());
	            System.out.println(model.getLink());
	            System.out.println("--------------------------");
	        }
			
			
			db.closeConnection();
        	
    		RequestDispatcher r = request.getRequestDispatcher("homepage.jsp");
    		r.forward(request, response);
         }
         else
         {
        	 db.closeConnection();
             request.setAttribute("error", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
             request.getRequestDispatcher("/index.jsp").forward(request, response);//forwarding the request
         }
	        
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
