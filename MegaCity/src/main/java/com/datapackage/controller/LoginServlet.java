package com.datapackage.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.datapackage.dao.UserDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
       @Override
       public void init()throws ServletException{
    	   userDAO = new UserDAO();
       }
   
       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    String username = request.getParameter("username");
    	    String password = request.getParameter("password");

    	    System.out.println("Received login request for: " + username);

    	    if (userDAO.validateUser(username, password)) {
    	        HttpSession session = request.getSession();
    	        session.setAttribute("username", username);
    	        System.out.println("Redirecting to home.jsp");
    	        response.sendRedirect("views/home.jsp");  // Ensure home.jsp exists
    	    } else {
    	        System.out.println("Redirecting to Signup.jsp?error=invalid");
    	        response.sendRedirect("views/Signup.jsp?error=invalid");
    	    }
    	}
}


