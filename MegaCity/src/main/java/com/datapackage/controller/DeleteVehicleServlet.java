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

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/car_booking";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Imandi1234@#$";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleId = request.getParameter("id"); // ✅ Fix: use "id" to match viewVehicles.jsp

        if (vehicleId == null || vehicleId.isEmpty()) {
            response.sendRedirect("admin/viewVehicles.jsp?error=Invalid vehicle ID");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement deleteStmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            // ✅ Step 1: Retrieve image name from DB
            stmt = conn.prepareStatement("SELECT image FROM vehicles WHERE id = ?");
            stmt.setString(1, vehicleId);
            rs = stmt.executeQuery();

            String imageName = null;
            if (rs.next()) {
                imageName = rs.getString("image");
            }

            // ✅ Step 2: Delete vehicle from DB
            deleteStmt = conn.prepareStatement("DELETE FROM vehicles WHERE id = ?");
            deleteStmt.setString(1, vehicleId);
            int rowsAffected = deleteStmt.executeUpdate();

            // ✅ Step 3: Delete image file if the vehicle is deleted
            if (rowsAffected > 0) {
                if (imageName != null && !imageName.isEmpty()) {
                    String imagePath = getServletContext().getRealPath("/uploads/") + imageName;
                    File imageFile = new File(imagePath);
                    if (imageFile.exists()) {
                        imageFile.delete(); // Delete image file
                    }
                }
                response.sendRedirect("admin/viewVehicles.jsp?message=Vehicle deleted successfully");
            } else {
                response.sendRedirect("admin/viewVehicles.jsp?error=Failed to delete vehicle");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/viewVehicles.jsp?error=Database error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (deleteStmt != null) deleteStmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
