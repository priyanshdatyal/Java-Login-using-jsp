package com.kapture.web;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kapture.main.DatabaseManager;
import com.kapture.model.GameInfo;

public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String fname="",lname="";
		
		try {
			String usrName = request.getParameter("name").toLowerCase(); 
			String crpassword = request.getParameter("crpassword"); 
			String cnpassword = request.getParameter("cnpassword"); 
			
			try {
				fname = usrName.substring(0 , usrName.indexOf("."));
				lname =  usrName.substring(usrName.lastIndexOf(".") + 1);
				if(crpassword.length()>=6) {
					if(crpassword.equals(cnpassword)) {
						
						DatabaseManager db = new DatabaseManager();
						db.makeConnection();
						String status=db.addUser(fname,lname,usrName,crpassword);
						if(status.contains("Duplicate entry")) {
							showIssue(request,response,"Username already taken by someone else");
						}
						else if(status.contains("Success")) {
							request.setAttribute("name", fname);
				        	request.setAttribute("error","");
				        	request.setAttribute("message","Account created Successfully");

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
						else {
							showIssue(request,response,status);
						}
					}
					else {
						showIssue(request,response,"Create Password and Confirm password do not match");
					}
				}
				else {
					showIssue(request,response,"Password Length should be greater than 6 characters");
				}
			}
			catch(Exception e) {
				System.out.println(e);
//	        	request.setAttribute("error",e);
				showIssue(request,response, "Invalid Username format");
//				showIssue(request,response, e.toString());
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void  showIssue(HttpServletRequest request, HttpServletResponse response,String problem) {
		System.out.println("The problem is "+problem);
		request.setAttribute("error", problem);
		try {
			RequestDispatcher r = request.getRequestDispatcher("index.jsp");
			r.include(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
