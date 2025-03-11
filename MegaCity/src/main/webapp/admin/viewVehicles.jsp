<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/car_booking";
    String jdbcUsername = "root";
    String jdbcPassword = "Imandi1234@#$";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        String sql = "SELECT * FROM vehicles";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Vehicles</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2);
        }
        .vehicle-img {
            width: 100px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }
        .delete-btn {
            background-color: red;
        }
    </style>
</head>
<body>

    <div class="container">
        <h4>Vehicle List</h4>

        <% if (request.getParameter("message") != null) { %>
            <p class="green-text"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="red-text"><%= request.getParameter("error") %></p>
        <% } %>

        <a href="AddVehicle.jsp" class="btn">Add Vehicle</a>
        <br><br>

        <table class="striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Number</th>
                    <th>Capacity</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td>
                            <% if (rs.getString("image") != null && !rs.getString("image").isEmpty()) { %>
                                <img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" class="vehicle-img">
                            <% } else { %>
                                No Image
                            <% } %>
                        </td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("number") %></td>
                        <td><%= rs.getInt("capacity") %></td>
                        <td>RS.<%= rs.getDouble("price") %></td>
                        <td>
                            <a href="AddVehicle.jsp?vehicleId=<%= rs.getInt("id") %>" class="btn blue">Edit</a>
                            <a href="<%= request.getContextPath() %>/DeleteVehicleServlet?id=<%= rs.getInt("id") %>" 
   class="btn delete-btn" 
   onclick="return confirm('Are you sure you want to delete this vehicle?');">
   Delete
</a>

                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>

<%
    try { if (rs != null) rs.close(); if (stmt != null) stmt.close(); if (conn != null) conn.close(); } 
    catch (Exception e) { e.printStackTrace(); }
%>
