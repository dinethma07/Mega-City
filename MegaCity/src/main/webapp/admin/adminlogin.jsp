<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Materialize CSS -->
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    
    <title>Admin Login</title>
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-card {
            width: 350px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .login-card h5 {
            margin-bottom: 20px;
        }

        .input-field {
            margin-top: 15px;
        }

        .login-btn {
            background-color: #00796b;
            width: 100%;
            padding: 10px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        .login-btn:hover {
            background-color: #004d40;
        }

        .error-msg {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h5>Admin Login</h5>
        
        <%-- Display error message if login fails --%>
        <% String error = request.getParameter("error"); %>
        <% if ("invalid".equals(error)) { %>
            <p class="error-msg">Invalid username or password</p>
        <% } %>

        <form action="<%=request.getContextPath()%>/AdminLoginServlet" method="post">
            <div class="input-field">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="input-field">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="btn login-btn">Login</button>
        </form>
    </div>

    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
