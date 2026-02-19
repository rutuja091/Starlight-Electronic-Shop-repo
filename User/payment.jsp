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
    <link rel="stylesheet" href="./css/payment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .payment-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .payment-form h2 {
/*            text-align: center;*/
            color: #333;
            margin-left:100px; 
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group input[readonly],
        .form-group input:disabled {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .title {
            text-align: center;
            font-size: 36px;
            color: #333;
            margin-top: 50px;
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
                <ul>
                    <li><a href="./../index.jsp">Home</a></li>
                    <li><a href="./company.jsp">Products</a></li>
                    <li><a href="./Offer.jsp">Offer</a></li>
                    <li><a href="./About.jsp">About us</a></li>
                    <li><a href="./Contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div class="header-icons">
                <a href="./../User/Login.jsp"><i class="fa-solid fa-user"></i></a>
            </div>
        </div>
    </header>

    <%  
      String uid = (String) session.getAttribute("uid");
      int prtotalprice = 0;
      String prname = ""; 
      String regName = ""; 
      try {
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
          Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
          Statement st = con.createStatement();
          
          String queryProduct = "SELECT id, prtotalprice, prname FROM Booking WHERE id = (SELECT MAX(id) FROM Booking)";
          ResultSet rsProduct = st.executeQuery(queryProduct);
          if (rsProduct.next()) {
              prtotalprice = rsProduct.getInt("prtotalprice");
              prname = rsProduct.getString("prname");
          }

          String queryRegistration = "SELECT name FROM Registration WHERE id = (SELECT MAX(id) FROM Registration)";
          ResultSet rsRegistration = st.executeQuery(queryRegistration);
          if (rsRegistration.next()) {
              regName = rsRegistration.getString("name");
          }

          con.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
    %>

    <!-- Main Content -->
    <h2 class="title" style=" margin-left:50px; ">Make Payment</h2>
    
    
    
    
    
    <script>
    function validateForm() {
        const mobile = document.getElementById("mobile").value;
        const card = document.getElementById("card").value;

        // Mobile number validation (10 digits)
        if (!/^[0-9]{10}$/.test(mobile)) {
            alert("Mobile number must be exactly 10 digits.");
            return false;
        }

        // Card number validation (16 digits)
        if (!/^[0-9]{16}$/.test(card)) {
            alert("Card number must be exactly 16 digits.");
            return false;
        }

        return true;
    }
</script>
    
    
    
    
    
    
    
    
    <form class="payment-form" method="POST" onsubmit="return validateForm()">
        
     <div class="form-group">
        <label for="name" style="font-size:18px; color:black">Customer Name</label>
        <input type="text" id="name" name="name" value="<%= regName %>" readonly>
    </div>

    <div class="form-group">
        <label for="mobile" style="font-size:18px; color:black">Mobile Number</label>
        <input type="tel" id="mobile" name="mobileno" placeholder="Enter your mobile number" required>
    </div>

    <div class="form-group">
        <label for="product" style="font-size:18px; color:black">Product Name</label>
        <input type="text" id="pname" name="productname" value="<%= prname %>" readonly>
    </div>

    <div class="form-group">
        <label for="payment" style="font-size:18px; color:black">Payment Mode</label>
        <select id="payment" name="paymentmode" required>
            <option value="" style="font-size:20px; color:black">Select payment mode</option>
            <option value="credit">Credit Card</option>
            <option value="debit">Debit Card</option>
        </select>
    </div>

    <div class="form-group">
        <label for="card" style="font-size:18px; color:black">Card Number</label>
        <input type="text" id="card" name="cardno" placeholder="Enter your card number" required>
    </div>

    <div class="form-group">
        <label for="total" style="font-size:20px; color:black">Total Price</label>
        <input type="number" id="total" name="totalprice" value="<%= prtotalprice %>" readonly>
    </div>

    <button type="submit">Make Payment</button>
</form>

    <% if (request.getMethod().equalsIgnoreCase("POST")) { %>
        <% 
        String name = request.getParameter("name");
        String mobileno = request.getParameter("mobileno");
        String productname = request.getParameter("productname");
        String paymentmode = request.getParameter("paymentmode");
        String cardno = request.getParameter("cardno");
        String totalprice = request.getParameter("totalprice");

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
            String query = "INSERT INTO Payment (name, mobileno, productname, paymentmode, cardno, totalprice) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, mobileno);
            pstmt.setString(3, productname);
            pstmt.setString(4, paymentmode);
            pstmt.setString(5, cardno);
            pstmt.setString(6, totalprice);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('Payment successfully !'); window.location.href = './bill.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to Payment.');</script>");
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
        %>
    <% } %>

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