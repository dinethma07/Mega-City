<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Materialize CSS -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <title>Contact Us</title>
    <style>
        body {
            background-color: #e5e5e5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .contact-card {
            background: white;
            width: 400px;
            padding: 20px 30px;
            border-radius: 5px;
            box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .contact-header {
            background: #d9d9d9;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin: -20px -30px 20px -30px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .contact-subtext {
            font-size: 14px;
            color: gray;
            margin-bottom: 15px;
        }

        .input-field {
            text-align: left;
        }

        .input-field input,
        .input-field textarea {
            background: #f9f9f9;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            width: 100%;
        }

        .input-field label {
            font-size: 14px;
            color: black;
            display: block;
            margin-bottom: 5px;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .submit-button {
            background-color: #888;
            width: 100%;
            padding: 10px;
            font-size: 14px;
            color: white;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            border-radius: 3px;
        }

        .submit-button:hover {
            background-color: #666;
        }
    </style>
</head>

<body>

    <div class="contact-card">
        <div class="contact-header">Contact Us</div>
        <p class="contact-subtext">Please fill this form in a decent manner</p>

        <form id="contactForm" action="${pageContext.request.contextPath}/ContactServlet" method="post">
            <div class="input-field">
                <label for="name">Full Name <span class="required">*</span></label>
                <input type="text" id="name" name="name">
                <p class="error-message" id="nameError"></p>
            </div>

            <div class="input-field">
                <label for="email">E-mail <span class="required">*</span></label>
                <input type="email" id="email" name="email">
                <p class="error-message" id="emailError"></p>
            </div>

            <div class="input-field">
                <label for="message">Message <span class="required">*</span></label>
                <textarea id="message" name="message" class="materialize-textarea"></textarea>
                <p class="error-message" id="messageError"></p>
            </div>

            <button type="submit" class="btn submit-button">Submit</button>
        </form>
    </div>

    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!-- JavaScript Validation -->
    <script>
        document.getElementById("contactForm").addEventListener("submit", function(event) {
            let isValid = true;

            // Name validation
            let name = document.getElementById("name").value.trim();
            let nameError = document.getElementById("nameError");
            if (name.length < 3) {
                nameError.innerText = "Name must be at least 3 characters.";
                isValid = false;
            } else {
                nameError.innerText = "";
            }

            // Email validation
            let email = document.getElementById("email").value.trim();
            let emailError = document.getElementById("emailError");
            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                emailError.innerText = "Enter a valid email address.";
                isValid = false;
            } else {
                emailError.innerText = "";
            }

            // Message validation
            let message = document.getElementById("message").value.trim();
            let messageError = document.getElementById("messageError");
            if (message.length < 10) {
                messageError.innerText = "Message must be at least 10 characters.";
                isValid = false;
            } else {
                messageError.innerText = "";
            }

            // Prevent form submission if validation fails
            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>

</body>
</html>
