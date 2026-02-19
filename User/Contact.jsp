

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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
    <link rel="stylesheet" href="css/Contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      
    </style>
</head>
<body>
    


<%-- Form Section --%>
<% if (request.getMethod().equalsIgnoreCase("POST")) { %>
    <% 
    // Fetching form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
 

    // Database operation
    try {
        // Load JDBC driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

        // Create database connection
        Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");

        // Insert data into database
        String query = "INSERT INTO Feedback (name, email, message) VALUES (?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, message);
        

        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<script>alert('Feedback Send successfully !');</script>");
        } else {
            out.println("<script>alert('Failed to send Feedback.');</script>");
        }

        // Close resources
        pstmt.close();
        con.close();
    } catch (Exception e) {
        out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
        e.printStackTrace();
    }
    %>
<% } %>
    
    
    
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
       



       <div class="contact-card">
            <div class="image-overlay">
              <img src="../Images/Contact/mainimg.jpg" alt="Customer Support" class="card-image">
              <div class="overlay-text">
                <h1>WE WOULD LOVE TO HELP YOU</h1>
                <p>REACH US AT:</p>
              </div>
            </div>
            
          </div>    

          <div class="contact-options">
            <div class="option">
              <h3> Call Us</h3>
              <p>For E-Commerce Related Queries</p>
              <p><strong>1800 889 1055</strong></p>
              <p>(9:30 AM to 7:30 PM, 365 days)</p>
            </div>
            <div class="option">
              <h3> WhatsApp Us</h3>
              <p>Send Hi! to <strong>+91 9000203078</strong></p>
            </div>
            <div class="option">
              <h3>Email Us</h3>
              <p><a href="mailto:reliancedigital@ril.com">starlighteleshop@gmail.com</a></p>
              <p>DOWNLOAD RESQ APP ON MOBILE</p>
            </div>
          </div>  
           

          <div class="feedback-form-container">
              
            <form  class="feedback-form" action="" method="POST">
              <h2>Give Your Feedback </h2>
              <label for="name"> Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
          
               <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
              
                      
             <label for="feedback">Your Feedback:</label>
              <textarea id="message" name="message" placeholder="Write your feedback here" rows="5" required></textarea>
          
              <button type="submit" name="submit">Submit Feedback</button>
              
            </form>
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