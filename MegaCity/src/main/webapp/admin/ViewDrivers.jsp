<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        String sql = "SELECT * FROM drivers";
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
    <title>View Drivers</title>
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
        .driver-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background: #fff;
            text-align: center;
        }
        .driver-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h4 class="center">All Drivers</h4>

        <% if (request.getParameter("message") != null) { %>
            <p class="green-text"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="red-text"><%= request.getParameter("error") %></p>
        <% } %>
        <a href="AddDrivers.jsp" class="btn">Add Drivers</a>

        <div class="grid-container">
            <% while (rs.next()) { %>
                <div class="driver-card">
                    <% if (rs.getString("image") != null && !rs.getString("image").isEmpty()) { %>
                        <img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" class="driver-img">
                    <% } else { %>
                        <p>No Image</p>
                    <% } %>
                    <h5><%= rs.getString("name") %></h5>
                    <p>Email: <%= rs.getString("email") %></p>
                    <p>Contact: <%= rs.getString("contact") %></p>
                    <a href="AddDrivers.jsp?driverId=<%= rs.getInt("id") %>" class="btn blue">Edit</a>
<a href="<%= request.getContextPath() %>/DeleteDriverServlet?id=<%= rs.getInt("id") %>" 
   class="btn delete-btn" 
   onclick="return confirm('Are you sure you want to delete this Driver?');">
   Delete
</a>
                </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>

<%
    try { if (rs != null) rs.close(); if (stmt != null) stmt.close(); if (conn != null) conn.close(); } 
    catch (Exception e) { e.printStackTrace(); }
%>
