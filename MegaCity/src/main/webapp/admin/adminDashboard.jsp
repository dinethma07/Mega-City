<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <style>
        body {
            background-color: #f4f4f4;
            text-align: center;
        }
        
        .dashboard-container {
            margin-top: 50px;
        }

        .card {
            padding: 20px;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-large {
            margin-top: 20px;
        }

        .logout-btn {
            background-color: red;
            margin-top: 30px;
        }
    </style>
</head>

<body>

    <div class="container dashboard-container">
        <h4>Welcome Admin Dashboard</h4>
        
        <div class="row">
            <div class="col s12 m4">
                <div class="card">
                    <h5>Add Vehicles</h5>
                    <p>Manage and add new vehicles.</p>
                    <a href="AddVehicle.jsp" class="btn btn-large waves-effect waves-light">Go</a>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="card">
                    <h5>Add Drivers</h5>
                    <p>Register new drivers.</p>
                    <a href="addDriver.jsp" class="btn btn-large waves-effect waves-light">Go</a>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="card">
                    <h5>View Bookings</h5>
                    <p>Check and manage customer bookings.</p>
                    <a href="viewBookings.jsp" class="btn btn-large waves-effect waves-light">Go</a>
                </div>
            </div>
        </div>

        <!-- Logout Button -->
        <a href="adminlogin.jsp" class="btn btn-large logout-btn">Logout</a>
    </div>

    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
