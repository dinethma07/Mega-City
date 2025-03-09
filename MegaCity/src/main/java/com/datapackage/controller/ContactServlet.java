package com.datapackage.controller;

import java.io.IOException;
import java.sql.SQLException;
import com.datapackage.dao.ContactDAO;
import com.datapackage.model.Contact;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDAO;

    @Override
    public void init() {
        contactDAO = new ContactDAO(); // Initialize DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form inputs
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Validate form fields
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || message == null || message.isEmpty()) {
            response.sendRedirect("error.jsp?msg=All fields are required!");
            return;
        }

        // Create a new Contact object
        Contact contact = new Contact(name, email, message);

        // Save contact using DAO
        try {
            boolean isInserted = contactDAO.insertContact(contact);
            if (isInserted) {
                response.sendRedirect("success.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("error.jsp?msg=Failed to save message!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=Database error occurred!");
        }
    }
}
