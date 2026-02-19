
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
    <link rel="stylesheet" href="./css/About.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

    <!-- Main Content Placeholder 
    <main>
        <h1>Welcome to Our Electronic Shop</h1>
        <p>Explore the latest gadgets and electronics at unbeatable prices!</p>
    </main>   -->



    <div class="main-cont">
        <div class="main-head">
          <p id="dark-light-main-header"><b>Welcome to Our Electronic Shop</b></p>
        </div>
        <div class="first-info">
          <div class="info-cont">
            <div class="first-info-head">
              <p>About Shop
              <p>
            </div>
            <div class="info" style="margin-right:70px;">
              <h3 >Electronics stores are the ideal place to shop for all types of consumer electronics, from televisions and sound systems to computers and gaming devices. Stores stock numerous brands in many styles  so that customers have plenty of options available when making their purchase decisions.</h3>
             
             
              <p > <h3>An electronic product refers to a device that utilizes electronic science and technology, such as microelectronics and electronic computers, to process information, convert energy, and perform various functions like storage, computation, and control. </h3> </p>
            </div>
          </div>
          <div class="info-img">
            <img src="./../Images/about1.png" style="width:650px;height:350px;border-radius: 5px;">
          </div>
        </div>
        <hr>
  
        <div class="third-info">
  
        <div class="info-img">
            <img src="./../Images/About2.jpg"  style="width:550px;height:400px;margin:30px;margin-left:2px;border-radius:5px;"> 
          </div>
          <div class="info-cont">
           <div class="first-info-head">
           <p>Connecting Dreams with Electrical Schemes<b> </b>
              <p>
            </div>
            <div class="info">
              <p><h3> Its association with 'charge' can portray 'emotionally charged' situations, or the type of conflict that can activate growth within you. As a source of energy, the well-being of the electrical circuits can reveal your current feelings about how things are 'flowing' within you. </h3></p>
              <div class="unorder-list">
                <div class="un-list">
                  <ul>
                    <li><h4>Extensive Product Range </h4></li>
                    <li><h4>Seamless User Experience </h4></li>
                    <li><h4>Detailed Product Descriptions </h4></li>
                  </ul>
                </div>
                <div class="un-list">
                  <ul>
                    <li> <h4>Customer Reviews </h4></li>
                    <li><h4>Competitive Pricing </h4></li>
                    <li> <h3>Secure Payment Options </h3></li>
                  </ul>
                </div>
                <div class="un-list">
                  <ul>
                    <li> <h4>Return and Warranty Policies </h4></li>
                    <li> <h4>Customer Support </h4></li>
                    <li> <h4>Fast Shipping  </h4></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
  
        </div>
  </div>
  
  <hr>
 

    <div class="containers3">
    <h2 class="section-title">Different Company Product available</h2>   
    </div>
  <section class="containers3 mt-4">
          <div id="movieIconSlider" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                  <div class="carousel-item active">
                      <div class="d-flex justify-content-around">
                          <img src="./../Images/logo/samsung.jpg" class="rounded-circle img-fluid small-icon" alt="Movie 1" style="width:120px;height:150px;margin-left:2px">
                          <img src="./../Images/logo/lenovo.jpg" class="rounded-circle img-fluid small-icon" alt="Movie 2" style="width:120px;height:120px;margin-left:50px">
                          <img src="./../Images/logo/intel-logo.jpg" class="rounded-circle img-fluid small-icon" alt="Movie 3" style="width:120px;height:120px;margin-left:50px">
                          <img src="./../Images/logo/applelogo.jpg" class="rounded-circle img-fluid small-icon" alt="Movie 4" style="width:120px;height:120px;margin-left:50px">
                          <img src="./../Images/logo/mi.jpg" class="rounded-circle img-fluid small-icon" alt="Movie 4" style="width:120px;height:120px;margin-left:40px">
                          <img src="./../Images/logo/hitchi.png" class="rounded-circle img-fluid small-icon" alt="Movie 4" style="width:150px;height:150px;margin-left:40px">
                          <img src="./../Images/logo/sony.jpeg" class="rounded-circle img-fluid small-icon" alt="Movie 4" style="width:150px;height:120px;margin-left:40px">
                      </div>
                  </div>
             </div>
              </div>
      </section>
  




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