<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String vehicleId = request.getParameter("vehicleId");
    String name = "", number = "", capacity = "", price = "", image = "";
    boolean isEditing = (vehicleId != null && !vehicleId.isEmpty());

    if (isEditing) {
        String jdbcURL = "jdbc:mysql://localhost:3306/car_booking";
        String jdbcUsername = "root";
        String jdbcPassword = "Imandi1234@#$";

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM vehicles WHERE id = ?")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            stmt.setString(1, vehicleId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                number = rs.getString("number");
                capacity = rs.getString("capacity");
                price = rs.getString("price");
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
    <title><%= isEditing ? "Edit Vehicle" : "Add Vehicle" %></title>
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
        .vehicle-preview { max-width: 100%; height: auto; margin-bottom: 10px; }
    </style>
</head>

<body>

    <div class="form-container">
        <h5><%= isEditing ? "Edit Vehicle" : "Add a New Vehicle" %></h5>

        <% if (request.getParameter("message") != null) { %>
            <p class="green-text"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="red-text"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="<%=request.getContextPath()%>/AddVehicleServlet" method="post" enctype="multipart/form-data">
            <% if (isEditing) { %>
                <input type="hidden" name="vehicleId" value="<%= vehicleId %>">
            <% } %>

            <div class="input-field">
                <input type="text" id="vehicleName" name="vehicleName" required value="<%= name %>">
                <label for="vehicleName" class="<%= isEditing ? "active" : "" %>">Vehicle Name</label>
            </div>

            <div class="input-field">
                <input type="text" id="vehicleNumber" name="vehicleNumber" required value="<%= number %>">
                <label for="vehicleNumber" class="<%= isEditing ? "active" : "" %>">Vehicle Number</label>
            </div>

            <div class="input-field">
                <input type="number" id="capacity" name="capacity" required value="<%= capacity %>">
                <label for="capacity" class="<%= isEditing ? "active" : "" %>">Capacity</label>
            </div>

            <div class="input-field">
                <input type="number" id="price" name="price" required value="<%= price %>">
                <label for="price" class="<%= isEditing ? "active" : "" %>">Price</label>
            </div>

            <% if (isEditing && image != null && !image.isEmpty()) { %>
                <img src="<%= request.getContextPath() %>/uploads/<%= image %>" class="vehicle-preview">
            <% } %>

            <div class="input-field">
                <label for="vehicleImage">Upload Vehicle Image</label>
                <input type="file" id="vehicleImage" name="vehicleImage">
            </div>

            <button type="submit" class="btn submit-btn"><%= isEditing ? "Update Vehicle" : "Add Vehicle" %></button>
        </form>

        <br>
        <a href="viewVehicles.jsp" class="btn grey">Back to Vehicles</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script> M.updateTextFields(); </script>

</body>
</html>
