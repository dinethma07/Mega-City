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

@WebServlet("/AddVehicleServlet")
@MultipartConfig(maxFileSize = 16177215) // Limit file size (15MB)
public class AddVehicleServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/car_booking";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Imandi1234@#$";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleId = request.getParameter("vehicleId");
        String name = request.getParameter("vehicleName");
        String number = request.getParameter("vehicleNumber");
        String capacity = request.getParameter("capacity");
        String price = request.getParameter("price");
        
        Part filePart = request.getPart("vehicleImage");
        String fileName = (filePart != null && filePart.getSize() > 0) ? extractFileName(filePart) : null;

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        new File(uploadPath).mkdirs();

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            if (vehicleId == null || vehicleId.isEmpty()) {
                // INSERT NEW VEHICLE
                String sql = "INSERT INTO vehicles (name, number, capacity, price, image) VALUES (?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, number);
                stmt.setString(3, capacity);
                stmt.setString(4, price);
                stmt.setString(5, fileName);
            } else {
                // UPDATE VEHICLE
                if (fileName == null) {
                    String sql = "UPDATE vehicles SET name=?, number=?, capacity=?, price=? WHERE id=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, number);
                    stmt.setString(3, capacity);
                    stmt.setString(4, price);
                    stmt.setString(5, vehicleId);
                } else {
                    String sql = "UPDATE vehicles SET name=?, number=?, capacity=?, price=?, image=? WHERE id=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, number);
                    stmt.setString(3, capacity);
                    stmt.setString(4, price);
                    stmt.setString(5, fileName);
                    stmt.setString(6, vehicleId);
                }
            }

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                if (fileName != null) {
                    filePart.write(uploadPath + File.separator + fileName);
                }
                response.sendRedirect("admin/viewVehicles.jsp?message=Vehicle saved successfully");
            } else {
                response.sendRedirect("admin/viewVehicles.jsp?error=Failed to save vehicle");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewVehicles.jsp?error=" + e.getMessage());
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

