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
    <link rel="stylesheet" href="css/Offer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      
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

    <!-- Main Content Placeholder -->
    <main>
       

        <div class="title-container">
            <h1 class="centered-heading">Start Offers</h1>
        </div>

        <div class="offer-container">
            <div class="offer-card">
                <img src="../Images/Offer/vivo-y73-smartphone-in-india.jpg" alt="Product 1">
                <div class="offer-title">Smartphone Offer</div>
                <div class="offer-description">Latest model with cutting-edge technology.</div>
                <div class="offer-price">&#8377;9999/-</div>
<!--                <a href="#" class="offer-button">Grab Deal</a>-->
            </div>
    
            <div class="offer-card">
                <img src="../Images/Offer/laptop.jpg" alt="Product 2">
                <div class="offer-title">Laptop Special</div>
                <div class="offer-description">High-performance laptop for work and gaming.</div>
                <div class="offer-price">&#8377;4999/-</div>
<!--                <a href="#" class="offer-button">Shop Now</a>-->
            </div>
    
            <div class="offer-card">
                <img src="../Images/Offer/headphone.jpg" alt="Product 3">
                <div class="offer-title">Headphones Discount</div>
                <div class="offer-description">Noise-cancelling headphones with superior sound.</div>
                <div class="offer-price">&#8377;1999/-</div>
<!--                <a href="#" class="offer-button">Buy Now</a>-->
            </div>
        </div>

        <div class="offer-container">
            <div class="offer-card">
                <img src="./../Images/Offer/tv.jpg" alt="Product 1">
                <div class="offer-title">Tv Offer</div>
                <div class="offer-description">Bank Offer5% Unlimited Cashback  Axis Bank Credit Card.</div>
                <div class="offer-price">&#8377;12999/-</div>
<!--                <a href="#" class="offer-button">Grab Deal</a>-->
            </div>
    
            <div class="offer-card">
                <img src="./../Images/Offer/ac.jpeg" alt="Product 2">
                <div class="offer-title">Ac Special</div>
                <div class="offer-description">Bank Offer10% off up to ?1250 on HDFC Bank Credit Card Transactions..</div>
                <div class="offer-price">&#8377;10999/-</div>
<!--                <a href="#" class="offer-button">Shop Now</a>-->
            </div>
    
            <div class="offer-card">
                <img src="./../Images/Offer/watch.jpg" alt="Product 3">
                <div class="offer-title">Watch Discount</div>
                <div class="offer-description">TIMEWEAR Day Date Functioning Chain Watch for Men.</div>
                <div class="offer-price">&#8377;7999/-</div>
<!--                <a href="#" class="offer-button">Buy Now</a>-->
            </div>
        </div>


        
    </main>

      <!-- Footer -->
    <footer class="footer">
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