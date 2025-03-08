<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Car Booking</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css"> <!-- Link your CSS -->
    <style>
    /* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
}

/* Header */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background: #fff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
}

.logo h1 {
    margin: 0;
    color: #0088cc;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}

nav ul li {
    margin: 0 15px;
}

nav ul li a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.btn {
    background: #0088cc;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
}

/* Hero Section */
.hero {
    background: url("../images/car-banner.jpg") no-repeat center center/cover;
    height: 400px;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
}

.hero-content {
    background: rgba(0, 0, 0, 0.5);
    padding: 20px;
    border-radius: 10px;
}

/* Features Section */
.features {
    padding: 50px;
    background: #f5f5f5;
}

.feature-box {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.feature {
    background: white;
    padding: 20px;
    width: 30%;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Footer */
footer {
    background: #222;
    color: white;
    padding: 10px;
}
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

    <!-- Header Section -->
    <header>
        <div class="logo">
            <h1>CarGo</h1> <!-- Change this to your branding -->
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>
                <li><a href="Services.jsp">Services</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h2>Car Rental Reservation System</h2>
            <p>Book your car instantly with our seamless reservation system.</p>
            <a href="Reservation.jsp" class="btn">Get Started</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <h2>Why Choose Us?</h2>
        <div class="feature-box">
            <div class="feature">
                <h3>Fast Booking</h3>
                <p>Book a ride in seconds with instant confirmation.</p>
            </div>
            <div class="feature">
                <h3>Affordable Pricing</h3>
                <p>Get the best deals on car rentals.</p>
            </div>
            <div class="feature">
                <h3>24/7 Support</h3>
                <p>We’re here to assist you anytime.</p>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
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
