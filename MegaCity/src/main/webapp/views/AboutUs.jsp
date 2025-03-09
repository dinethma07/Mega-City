<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - CarGo</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css"> <!-- Link to CSS -->
    <style>
    /* Header Styles */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #0088cc;
    padding: 15px 30px;
    color: white;
}

/* Logo */
.logo h1 {
    font-size: 24px;
    color: white;
    margin: 0;
}

/* Navigation Bar */
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
    color: white;
    font-size: 18px;
    padding: 10px 15px;
    transition: 0.3s;
}

nav ul li a:hover,
nav ul li a.active {
    background-color: white;
    color: #0088cc;
    border-radius: 5px;
}

/* Sign Up Button */
nav ul li .btn {
    background-color: white;
    color: #0088cc;
    padding: 10px 15px;
    border-radius: 5px;
    font-weight: bold;
}

nav ul li .btn:hover {
    background-color: #005f99;
    color: white;
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
            <h1>CarGo</h1> <!-- Change this to your system name -->
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="aboutus.jsp" class="active">About</a></li>
                <li><a href="Services.jsp">Services</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="Register.jsp">Register</a></li>
                <li><a href="Signup.jsp" class="btn">Sign Up</a></li>
            </ul>
        </nav>
    </header>

    <!-- About Us Section -->
    <section class="about">
        <div class="about-container">
            <h2>About CarGo</h2>
            <p>CarGo is a leading online car booking system designed to provide seamless and hassle-free car rentals to users. Our platform allows you to book rides instantly, choose from a wide range of vehicles, and enjoy the best pricing in the market.</p>
            
            <h3>Our Mission</h3>
            <p>We aim to revolutionize the car rental industry by offering a fast, efficient, and affordable solution for travelers and daily commuters.</p>
            
            <h3>Why Choose Us?</h3>
            <ul>
                <li>Instant Booking and Confirmation</li>
                <li>Wide Range of Vehicles</li>
                <li>Affordable and Transparent Pricing</li>
                <li>24/7 Customer Support</li>
                <li>Safe and Secure Transactions</li>
            </ul>

            <h3>Our Team</h3>
            <p>We are a passionate team of professionals committed to delivering the best car rental experience. Our support team is available round the clock to assist you with your bookings.</p>
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
                    <li><a href="aboutus.jsp">About Us</a></li>
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
