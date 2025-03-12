<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String driverId = request.getParameter("driverId");
    String name = "", email = "", contact = "", image = "";
    boolean isEditing = (driverId != null && !driverId.isEmpty());

    if (isEditing) {
        String jdbcURL = "jdbc:mysql://localhost:3306/car_booking";
        String jdbcUsername = "root";
        String jdbcPassword = "Imandi1234@#$";

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM drivers WHERE id = ?")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            stmt.setString(1, driverId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                contact = rs.getString("contact");
                image = rs.getString("image");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= isEditing ? "Edit Driver" : "Add Driver" %></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            width: 400px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2);
        }
        .input-field { margin-top: 15px; }
        .submit-btn {
            background-color: #00796b;
            width: 100%;
            padding: 10px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }
        .submit-btn:hover { background-color: #004d40; }
        .driver-preview { max-width: 100%; height: auto; margin-bottom: 10px; }
    </style>
</head>
<body>

    <div class="form-container">
        <h5><%= isEditing ? "Edit Driver" : "Add a New Driver" %></h5>

        <% if (request.getParameter("message") != null) { %>
            <p class="green-text"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="red-text"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="<%=request.getContextPath()%>/AddDriversServlet" method="post" enctype="multipart/form-data">
            <% if (isEditing) { %>
                <input type="hidden" name="driverId" value="<%= driverId %>">
            <% } %>

            <div class="input-field">
                <input type="text" id="name" name="name" required value="<%= name %>">
                <label for="name" class="<%= isEditing ? "active" : "" %>">Driver Name</label>
            </div>

            <div class="input-field">
                <input type="email" id="email" name="email" required value="<%= email %>">
                <label for="email" class="<%= isEditing ? "active" : "" %>">Email</label>
            </div>

            <div class="input-field">
                <input type="text" id="contact" name="contact" required value="<%= contact %>">
                <label for="contact" class="<%= isEditing ? "active" : "" %>">Contact Number</label>
            </div>

            <% if (isEditing && image != null && !image.isEmpty()) { %>
                <img src="<%= request.getContextPath() %>/uploads/<%= image %>" class="driver-preview">
            <% } %>

            <div class="input-field">
                <label for="image">Upload Driver Image</label>
                <input type="file" id="image" name="image">
            </div>

            <button type="submit" class="btn submit-btn"><%= isEditing ? "Update Driver" : "Add Driver" %></button>
        </form>

        <br>
        <a href="ViewDrivers.jsp" class="btn grey">Back to Drivers</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script> M.updateTextFields(); </script>

</body>
</html>
