<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Reservation | CarGo</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"> <!-- Link to CSS -->
    <style>
    /* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* Header Navigation */
header {
    background-color: #222;
    color: white;
    padding: 15px;
    text-align: center;
}

nav ul {
    list-style: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin: 0 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 16px;
}

nav ul li a.active {
    color: #f4a261;
}

/* Reservation Form */
.reservation-form {
    background: white;
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.reservation-form h2 {
    color: #333;
    margin-bottom: 20px;
}

.reservation-form label {
    display: block;
    font-weight: bold;
    margin-top: 10px;
}

.reservation-form input {
    width: 100%;
    padding: 10px;
    margin: 5px 0 15px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.reservation-form button {
    background-color: #f4a261;
    color: white;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
    transition: 0.3s;
}

.reservation-form button:hover {
    background-color: #e76f51;
}

/* Footer */
/* Footer Styles */
footer {
    background-color: #222;
    color: white;
    padding: 30px 0;
    text-align: center;
}

.footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    max-width: 1100px;
    margin: auto;
    padding: 20px;
}

.footer-section {
    flex: 1;
    min-width: 250px;
    margin: 15px;
}

.footer-section h3, .footer-section h2 {
    color: #f4a261;
}

.footer-section p, .footer-section ul {
    font-size: 14px;
    color: #ddd;
}

.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section ul li {
    margin: 10px 0;
}

.footer-section ul li a {
    color: #ddd;
    text-decoration: none;
    transition: 0.3s;
}

.footer-section ul li a:hover {
    color: #f4a261;
}

.social-icons {
    margin-top: 10px;
}

.social-icons a {
    display: inline-block;
    margin: 0 10px;
}

.social-icons img {
    width: 30px;
    transition: 0.3s;
}

.social-icons img:hover {
    transform: scale(1.1);
}

.footer-bottom {
    background-color: #111;
    padding: 10px 0;
    margin-top: 20px;
}


    
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h2>CarGo - Online Car Booking</h2>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>
                 <li><a href="Contact.jsp">Contact</a></li>
                
            </ul>
        </nav>
    </header>

    <!-- Reservation Form -->
    <section class="reservation-form">
        <h2>Car Reservation</h2>
        <form action="${pageContext.request.contextPath}/ReservationServlet" method="post">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="contact">Contact Number:</label>
            <input type="text" id="contact" name="contact" required>

            <label for="fromLocation">From Location:</label>
            <input type="text" id="fromLocation" name="fromLocation" required>

            <label for="toLocation">To Location:</label>
            <input type="text" id="toLocation" name="toLocation" required>

            <label for="date">Reservation Date:</label>
            <input type="date" id="date" name="date" required>

            <button type="submit">Book Now</button>
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-section about">
                <h2>CarGo</h2>
                <p>CarGo is your trusted car rental booking system, offering easy and affordable car rentals with a hassle-free booking experience.</p>
            </div>
            <div class="footer-section links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                    <li><a href="Services.jsp">Services</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="Register.jsp">Register</a></li>
                </ul>
            </div>
            <div class="footer-section contact">
                <h3>Contact Us</h3>
                <p>Email: support@cargo.com</p>
                <p>Phone: +94 123 456 789</p>
                <p>Location: Colombo, Sri Lanka</p>
            </div>
            <div class="footer-section social">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    <a href="#"><img src="images/facebook.png" alt="Facebook"></a>
                    <a href="#"><img src="images/twitter.png" alt="Twitter"></a>
                    <a href="#"><img src="images/instagram.png" alt="Instagram"></a>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
