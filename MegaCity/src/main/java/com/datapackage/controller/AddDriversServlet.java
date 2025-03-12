package com.datapackage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddDriversServlet")
@MultipartConfig(maxFileSize = 16177215) // 15MB limit
public class AddDriversServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/car_booking";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Imandi1234@#$";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("driverId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        
        Part filePart = request.getPart("image");
        String fileName = (filePart != null && filePart.getSize() > 0) ? extractFileName(filePart) : null;

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        new File(uploadPath).mkdirs();

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            if (driverId == null || driverId.isEmpty()) {
                // INSERT NEW DRIVER
                String sql = "INSERT INTO drivers (name, email, contact, image) VALUES (?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, contact);
                stmt.setString(4, fileName);
            } else {
                // UPDATE EXISTING DRIVER
                if (fileName == null) {
                    String sql = "UPDATE drivers SET name=?, email=?, contact=? WHERE id=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, contact);
                    stmt.setString(4, driverId);
                } else {
                    String sql = "UPDATE drivers SET name=?, email=?, contact=?, image=? WHERE id=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, contact);
                    stmt.setString(4, fileName);
                    stmt.setString(5, driverId);
                }
            }

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                if (fileName != null) {
                    filePart.write(uploadPath + File.separator + fileName);
                }
                response.sendRedirect("admin/ViewDrivers.jsp?message=Driver saved successfully");
            } else {
                response.sendRedirect("admin/ViewDrivers.jsp?error=Failed to save driver");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/ViewDrivers.jsp?error=" + e.getMessage());
        } finally {
            try { if (stmt != null) stmt.close(); if (conn != null) conn.close(); } 
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }
}