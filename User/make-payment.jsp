<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="./css/About.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* CSS remains unchanged */
        .card-body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 40px 0px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: #f5f5f5;
        }
        .ticket-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6);
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            width: 400px;
        }
        .ticket-container:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .movie-details {
            padding: 20px;
        }
        .movie-name {
            font-size: 40px;
            font-weight: bold;
            margin: 0;
            color: red;
        }
        .ticket-quantity,
        .total-price {
            font-size: 1.2em;
            margin: 10px 0;
            color: black;
            justify-content: center;
        }
        .make-payment-button {
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .make-payment-button:hover {
            background-color: #218838;
        }
        .movie-poster {
            max-width: 100%;
            height: auto;
            display: block;
            margin-top: -10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .get-ticket-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .get-ticket-btn:hover {
            background-color: #45a049;
        }
        .payment-cards {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: nowrap;
        }
        .payment-card {
            width: 100px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #ddd;
            border-radius: 50%;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .payment-card img {
            width: 80%;
            height: 80%;
            object-fit: contain;
            border-radius: 50%;
        }
        .payment-card:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
  <%
      String uid = (String) session.getAttribute("uid");
      int prtotalprice = 0;
      int maxId = 0;
      try {
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
                Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");// Update with your DB credentials
          Statement st = con.createStatement();
          String query = "SELECT id, prtotalprice FROM Booking WHERE id = (SELECT MAX(id) FROM Booking)";
          ResultSet rs = st.executeQuery(query);
          if (rs.next()) {
              maxId = rs.getInt("id");
              prtotalprice = rs.getInt("prtotalprice");
          }
          con.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
  %>

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

    <main>
        <div class="card-body">
            <div class="ticket-container">
                <div class="movie-details">
                    <div class="payment-cards">
                        <div class="payment-card">
                            <img src="./../Images/payment/phonepay.png" alt="PhonePe" />
                        </div>
                        <div class="payment-card">
                            <img src="./../Images/payment/gpay.png" alt="Google Pay" />
                        </div>
                        <div class="payment-card">
                            <img src="./../Images/payment/upi.jpeg" alt="UPI Pay" />
                        </div>
                    </div>
                    <p class="total-price">Total Amount: <b style="color:red;">&#8377; <%= prtotalprice %></b></p>
                    <a href="payment.jsp?id=<%= maxId %>" style="color:white;text-decoration:none;">
                        <button class="get-ticket-btn">
                            Make Payment
                        </button>
                    </a>
                </div>
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