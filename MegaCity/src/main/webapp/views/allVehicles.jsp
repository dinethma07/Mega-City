<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>All Vehicles</title>
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
        .vehicle-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background: #fff;
            text-align: center;
        }
        .vehicle-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 5px;
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
        <h4 class="center">All Vehicles</h4>
        
        <% if (request.getParameter("message") != null) { %>
            <p class="green-text"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="red-text"><%= request.getParameter("error") %></p>
        <% } %>

        <div class="grid-container">
            <% while (rs.next()) { %>
                <div class="vehicle-card">
                    <% if (rs.getString("image") != null && !rs.getString("image").isEmpty()) { %>
                        <img src="<%= request.getContextPath() %>/uploads/<%= rs.getString("image") %>" class="vehicle-img">
                    <% } else { %>
                        <p>No Image</p>
                    <% } %>
                    <h5><%= rs.getString("name") %></h5>
                    <p>Number: <%= rs.getString("number") %></p>
                    <p>Capacity: <%= rs.getInt("capacity") %> Persons</p>
                    <p><strong>RS. <%= rs.getDouble("price") %></strong></p>
                    <button type="submit">
                    <li><a href="Drivers.jsp">Book Now</a></li>
                    </button>
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
