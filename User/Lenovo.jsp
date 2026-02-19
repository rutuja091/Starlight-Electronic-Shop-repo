<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@ page import="java.lang.String.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="./css/samsung.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <style>
        /* Card container styles */
        .cardcontainer {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 20px;
            padding: 20px;
        }

        /* Product card styles */
        .card {
            width: 300px; /* Slightly reduced width */
            height: auto;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Image styling */
        .card img {
            width: calc(100% - 20px); /* Padding adjustment for shadow effect */
            height: 220px; /* Reduced height */
            object-fit: cover;
            margin: 10px; /* Padding around image for shadow effect */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Image shadow */
            border-bottom: 1px solid #e0e0e0; /* Separator */
        }

        /* Card content styling */
        .card-content {
            padding: 15px;
            text-align: center;
        }

        /* Product name styling */
        .card-title {
            font-size: 20px; /* Adjusted font size */
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        /* Product description styling */
        .card-description {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
            line-height: 1.5;
        }

        /* Product price styling */
        .card-price {
            font-size: 18px;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 15px;
        }

        /* Button container styling */
        .card-buttons {
            display: flex;
            justify-content: center;
        }

        /* Button styling */
        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        /* Button hover effect */
        .btn:hover {
            background-color: #0056b3;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card {
                width: 100%;
            }
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
  

    <div class="image-banner">
      <img src="./../Images/Lenovo/lenadd.jpg" alt="Banner Image">
    <!--  <div class="caption"></div> -->
  </div>


    <div class="main-head">
      <p id="dark-light-main-header"><b>Lenovo Product</b></p>
    </div>

    <!-- Main Content Placeholder -->
    <div class="cardcontainer">
        <%
            String uid = (String) session.getAttribute("uid");
            try {  
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
                Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
                Statement st = con.createStatement();
                String query = "SELECT * FROM Product WHERE company = 'Lenovo'";
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
        %>
         <!-- Display each product dynamically from the database -->
        <div class="card">
            <img src="./../Admin/Image/<%=rs.getString("img") %>" alt="Product Image">
            <div class="card-content">
                <h3 class="card-title"><%= rs.getString("name") %></h3>
                <p class="card-description"><%= rs.getString("description") %></p>
                <p class="card-price">&#8377; <%= rs.getString("price") %></p>
                <div class="card-buttons">
                    <a href="./detailinfo.jsp?id=<%= rs.getString("id") %>">
                        <button class="btn btn-cart">View More</button>
                    </a>
                </div>
            </div>
        </div>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
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