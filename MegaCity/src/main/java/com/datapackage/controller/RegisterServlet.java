package com.datapackage.controller;

import com.datapackage.dao.UserDAO;
import com.datapackage.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(name, address, contact, username, password);
        UserDAO userDAO = new UserDAO();
        
        if (userDAO.registerUser(user)) {
            response.sendRedirect("views/Signup.jsp?success=true");
        } else {
            response.sendRedirect("views/Register.jsp?error=true");
        }
    }
}