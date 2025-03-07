<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Materialize CSS -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <style>
        /* Custom styles */
        .signup-container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        
        .signup-image {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
        }

        .card {
            padding: 20px;
        }

        .full-width {
            width: 100%;
        }

        .link-style {
            text-decoration: none;
            color: #2196F3;
            font-weight: bold;
            text-align: center;
            display: block;
            margin-top: 15px;
        }

        .link-style:hover {
            color: #0b7dda;
        }
    </style>
</head>

<body class="container">
    <div class="row signup-container">

        <!-- Left Side: Image -->
        <div class="col s12 m5">
            <img src="images/reg.jpg" class="responsive-img signup-image">
        </div>

        <!-- Right Side: Registration Form -->
        <div class="col s12 m6 offset-m1">
            <div class="card">
                <div class="card-content">
                    <span class="card-title center-align">Registration Form</span>

                    <!-- Registration Form -->
                    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">

                        <div class="input-field">
                            <input type="text" id="name" name="name" required>
                            <label for="name">Full Name</label>
                        </div>

                        <div class="input-field">
                            <input type="text" id="address" name="address" required>
                            <label for="address">Address</label>
                        </div>

                        <div class="input-field">
                            <input type="tel" id="contact" name="contact" pattern="[0-9]{10}" required>
                            <label for="contact">Contact (10 digits)</label>
                        </div>

                        <div class="input-field">
                            <input type="email" id="username" name="username" required>
                            <label for="username">Email (Username)</label>
                        </div>

                        <div class="input-field">
                            <input type="password" id="password" name="password" minlength="6" required>
                            <label for="password">Password (Min 6 characters)</label>
                        </div>

                        <!-- Buttons -->
                        <button type="submit" class="btn waves-effect waves-light full-width">Sign Up</button>
                        <button type="reset" class="btn grey waves-effect full-width">Clear</button>

                    </form>

                    <!-- Already Have an Account? -->
                    <p class="center-align">Already have an account? 
                        <a href="Signup.jsp" class="link-style">Login</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
