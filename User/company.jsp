<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    // Check if the user is logged in by verifying the session attribute
    String userEmail = (String) session.getAttribute("email");
    if (userEmail == null) {
        // If the user is not logged in, redirect to the login page
        response.sendRedirect("./../User/Login.jsp");
        return; // Stop further execution
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="./css/company.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 250px;
        }

        .card img {
            max-width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }

        .card button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .card button:hover {
            background-color: #0056b3;
        }

        .cardcontainer {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
            margin-bottom: 5px; /* Reduced gap between rows */
        }

        .main-head {
            text-align: center;
            margin: 10px 0 15px; /* Reduced margin bottom for header */
        }

        .main-head p {
            font-size: 32px; /* Increased header size */
            font-weight: bold;
            color: #007BFF; /* Added theme color */
        }

        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
        }

        .footer-section {
            margin-bottom: 20px;
        }

        .social-links a {
            margin: 0 10px;
            color: #007BFF;
            font-size: 18px;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="logo">
                <a href="#">E-Shop</a>
            </div>
            <nav class="navbar">
                        <ul style="font-size:20px;">
    <li><a href="./../index.jsp" style="font-size: 20px;">Home</a></li>
    <li><a href="./company.jsp" style="font-size: 20px;">Products</a></li>
    <li><a href="./Offer.jsp" style="font-size: 20px;">Offer</a></li>
    <li><a href="./About.jsp" style="font-size: 20px;">About Us</a></li>
    <li><a href="./Contact.jsp" style="font-size: 20px;">Contact</a></li>
</ul>
            </nav>
            <div class="header-icons">
                <a href="./../User/Login.jsp"><i class="fa-solid fa-user"></i></a>
            </div>
        </div>
    </header>

    <!-- Main Header -->
    <div class="main-head">
        <p id="dark-light-main-header"><b>Available Company</b></p>
    </div>

    <!-- Main Content -->
    <div class="cardcontainer">
        <div class="card">
            <img src="./../Images/AdminDashboard/SamsungImage.jpeg" alt="Samsung Logo">
            <button onclick="window.location.href='./samsung.jsp'">Visit Samsung</button>
        </div>

        <div class="card">
            <img src="./../Images/AdminDashboard/SonyImage.jpg" alt="Sony Logo">
            <button onclick="window.location.href='./sony.jsp'">Visit Sony</button>
        </div>

        <div class="card">
            <img src="./../Images/AdminDashboard/CromaImage.jpeg" alt="Croma Logo">
            <button onclick="window.location.href='./croma.jsp'">Visit Croma</button>
        </div>
    </div>

    <div class="cardcontainer">
        <div class="card">
            <img src="./../Images/AdminDashboard/AppleImage.jpeg" alt="Apple Logo">
            <button onclick="window.location.href='./Apple.jsp'">Visit Apple</button>
        </div>

        <div class="card">
            <img src="./../Images/AdminDashboard/LenovoImage.jpg" alt="Lenovo Logo">
            <button onclick="window.location.href='./Lenovo.jsp'">Visit Lenovo</button>
        </div>

        <div class="card">
            <img src="./../Images/AdminDashboard/Haier.jpg" alt="Haier Logo">
            <button onclick="window.location.href='./haier.jsp'">Visit Haier</button>
        </div>
    </div>

     <!-- Footer -->
    <footer class="footer" style="background-color:black">
     
        <div class="container">
            <div class="footer-section">
                <h4>About Us</h4>
                <p>Your one-stop shop for the latest electronic gadgets and accessories.<li>
                    <a style="color:white" href="./About.jsp">Click to View About us</a></li></p>
                
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="./../index.jsp">Home</a></li>
                    <li><a href="./company.jsp">Products</a></li>
                    <li><a href="./Offer.jsp">Offers</a></li>
                    <li><a href="./Contact.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Follow Us</h4>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
         <div class="footer-bottom">
        

                    
            <p>&copy; 2026 Electronic Shop. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>