package com.datapackage.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Sample Admin Credentials (Replace with Database Check)
        String adminUser = "admin@gmail.com";
        String adminPass = "admin";

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (adminUser.equals(username) && adminPass.equals(password)) {
            // Create a session for admin
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");  // Set admin role
            
            response.sendRedirect("admin/adminDashboard.jsp"); // Redirect to Dashboard
        } else {
            response.sendRedirect("admin/adminLogin.jsp?error=invalid"); // Redirect with error
        }
    }
}

