<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Car Booking System</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external CSS -->
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Car Booking System</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="Reservation.jsp">Reservations</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Services Section -->
    <section class="services">
        <h2>Our Services</h2>
        <div class="service-container">
            <div class="service-box">
                <h3>Online Car Reservations</h3>
                <p>Book your car online easily with our user-friendly platform.</p>
            </div>
            <div class="service-box">
                <h3>Luxury & Economy Cars</h3>
                <p>Choose from a variety of luxury, economy, and family-friendly cars.</p>
            </div>
            <div class="service-box">
                <h3>24/7 Customer Support</h3>
                <p>We are available 24/7 to assist you with any issues or inquiries.</p>
            </div>
            <div class="service-box">
                <h3>Airport Pick-up & Drop-off</h3>
                <p>Enjoy a hassle-free ride to and from the airport with our premium service.</p>
            </div>
            <div class="service-box">
                <h3>Flexible Rental Plans</h3>
                <p>Choose from daily, weekly, or monthly rental plans according to your needs.</p>
            </div>
            <div class="service-box">
                <h3>GPS & Safety Features</h3>
                <p>All our cars come equipped with GPS navigation and advanced safety features.</p>
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

    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background: #333;
            color: white;
            padding: 15px 20px;
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
            font-size: 18px;
        }

        .services {
            text-align: center;
            padding: 40px;
            background-color: #fff;
        }

        .service-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .service-box {
            background: white;
            padding: 20px;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
        }
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

</body>
</html>
