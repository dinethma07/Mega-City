package com.datapackage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDriverServlet")
public class DeleteDriverServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/car_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Imandi1234@#$";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("id");  

        if (driverId == null || driverId.isEmpty()) {
            response.sendRedirect("admin/ViewDrivers.jsp?error=Invalid driver ID");
            return;
        }

        String imagePath = null;
        boolean driverExists = false;

        // Step 1: Check if driver exists and get the image path
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT image FROM drivers WHERE id = ?")) {
            
            stmt.setInt(1, Integer.parseInt(driverId));
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    driverExists = true;
                    imagePath = rs.getString("image");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/ViewDrivers.jsp?error=Database error: " + e.getMessage());
            return;
        }

        if (!driverExists) {
            response.sendRedirect("admin/ViewDrivers.jsp?error=Driver not found");
            return;
        }

        // Step 2: Delete the driver from the database
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM drivers WHERE id = ?")) {
            
            stmt.setInt(1, Integer.parseInt(driverId));
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Step 3: Delete the associated image file if it exists
                if (imagePath != null && !imagePath.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("/") + "uploads" + File.separator + imagePath;
                    File imageFile = new File(uploadPath);
                    if (imageFile.exists() && imageFile.delete()) {
                        System.out.println("Deleted image: " + uploadPath);
                    } else {
                        System.out.println("Image not found or could not be deleted: " + uploadPath);
                    }
                }
                response.sendRedirect("admin/ViewDrivers.jsp?message=Driver deleted successfully");
            } else {
                response.sendRedirect("admin/ViewDrivers.jsp?error=Failed to delete driver");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/ViewDrivers.jsp?error=Error: " + e.getMessage());
        }
    }
}
