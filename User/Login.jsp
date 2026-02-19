<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/Login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .bg-img {
/*            background-image: url('./../Images/login-reg/bg.jpg');*/
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            width: 350px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
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

    <% 
        String emailInput = request.getParameter("email");
        String passwordInput = request.getParameter("password");
        String errorMessage = null;

        if (emailInput != null && passwordInput != null) {
            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
                String query = "SELECT * FROM Registration WHERE email = ? AND password = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, emailInput);
                pstmt.setString(2, passwordInput);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    session.setAttribute("email", emailInput);
                    response.sendRedirect("./../index.jsp");
                    return;
                } else {
                    errorMessage = "Invalid email or password";
                }

                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
<div class="bg-img">
    <div class="login-container">
        <h1>Login</h1>
        <form method="POST" action="">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>
            <% if (errorMessage != null) { %>
                <p style="color: red;"> <%= errorMessage %> </p>
            <% } %>
            <button type="submit" class="login-btn">Login</button>
            <p style="color: blue; margin-top: 10px;">If you are not registered, register first. 
                <a href="./Registration.jsp" style="color: brown; font-weight: bold;">Register </a>
            </p>
        </form>
    </div>
</div>
    <footer class="footer">
        <div class="container">
            <div class="footer-section">
                <h4>About Us</h4>
                <p>Your one-stop shop for the latest electronic gadgets and accessories.</p>
                <li><a style="color:white" href="./About.jsp">Click to View About us</a></li>
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
