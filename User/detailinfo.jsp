<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="./css/detailinfo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Reset styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Centered header with company name */
        .header {
            background-color: #333;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        /* Layout container for product details */
        .product-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 30px;
            gap: 50px;
        }

        /* Style for product image */
        .product-image {
            width: 30%;
            max-height: 340px;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        /* Style for product information */
        .product-info {
            width: 30%; /* Reduced width */
            padding: 20px; /* Reduced padding */
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left: 30px;
            display: flex;
            padding-right: 20px;
            flex-direction: column;
            justify-content: space-between;
            height: 350px; /* Reduced height */
        }

        .product-info h2 {
            margin: 10px 0;
            font-size: 36px;
            font-weight: bold;
            color: #333;
        }

        .product-info h3 {
            margin: 15px 0;
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        .company-center {
            text-align: center;
            margin-bottom: 20px;
        }

        .company-center input {
            font-size: 30px;
            font-weight: bold;
            color: red;
            text-transform: uppercase;
            border: none;
            text-align: center;
            background: transparent;
        }

        /* Price and total styling */
        .price {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            border: none;
            background-color: transparent;
            width: 150px; /* Reduced width for the price box */
        }

        /* Container for Total Amount with gray background */
        .total-amount-container {
            background-color: #dbd9d9;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Updated styling for total amount text and value */
        .total-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 0px; /* Removed margin-top */
            padding-top: 10px; /* Adjusted padding */
        }

        #show-total {
            font-size: 20px;
            font-weight: bold;
            color: green;
        }

        /* Quantity controls */
        .quantity-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-cart {
            background-color: #007bff;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-cart:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Make sure all the elements align well */
        .product-info div {
            width: 100%;
            text-align: center;
        }

        /* Footer Styling */
        footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        footer .container {
            display: flex;
            justify-content: space-between;
        }

        footer .footer-section {
            width: 30%;
        }

        footer .footer-section h4 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        footer .footer-section ul {
            list-style: none;
            padding: 0;
        }

        footer .footer-section ul li {
            margin: 5px 0;
        }

        footer .footer-section ul li a {
            color: #fff;
            text-decoration: none;
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
    String productId = request.getParameter("id");
    String productName = "";
    String productCompany = "";
    String productDescription = "";
    String productPrice = "0";
    if (productId != null) {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
            String query = "SELECT * FROM Product WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productName = rs.getString("name");
                productCompany = rs.getString("company");
                productDescription = rs.getString("description");
                productPrice = rs.getString("price");
%>

<form method="POST">
    <div class="company-center">
        <input type="text" name="prcompany" value="<%= productCompany %>" readonly class="company">
    </div>

    <div class="product-container">
        <!-- Product Image -->
        <div class="product-image">
            <img src="./../Admin/Image/<%= rs.getString("img") %>" alt="Product Image">
        </div>

        <!-- Product Information -->
        <div class="product-info">
          <h2 style="font-size: 30px;">
            <input name="prname" type="text" style="font-size: 30px; font-weight: bold; border: none; background: transparent;" 
                   value="<%= productName %>" readonly>
        </h2>
        <h3><%= productDescription %></h3>

            <div>
                <label for="priceInput" style="font-size: 25px;">&nbsp; &#8377;</label>
                <input name="prprice" type="text" id="priceInput" value="<%= productPrice %>" readonly class="price">
            </div>
            
          

            <div class="quantity-container">
                <img class="btnimg" src="./../Images/logo/minus.png" onclick="Dec()" style="height: 30px;width: 30px;" />
                <input name="prquantity" type="number" id="quantityInput" value="1" min="1" max="10" class="qnty-text" style="font-size: 22px;">
                <img class="btnimg" src="./../Images/logo/plus.png" onclick="Inc()" style="height: 30px;width: 30px;" />
            </div>
  <!-- Total Amount Container -->
            <div class="total-amount-container">
                <div class="total-container">
                    <label for="totalInput" style="font-size: 20px;">Total Amount:</label>
                    <input name="prtotalprice" type="text" id="totalInput" value="<%= productPrice %>" readonly class="price" style="color: green;">
                </div>
            </div>
            <button type="submit" class="btn-cart">Buy Now</button>
        </div>
    </div>
</form>

<%
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String prcompany = request.getParameter("prcompany");
        String prname = request.getParameter("prname");
        String prprice = request.getParameter("prprice");
        String prquantity = request.getParameter("prquantity");
        String prtotalprice = request.getParameter("prtotalprice");

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
            String query = "INSERT INTO Booking (prcompany, prname, prprice, prquantity, prtotalprice) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, prcompany);
            pstmt.setString(2, prname);
            pstmt.setString(3, prprice);
            pstmt.setString(4, prquantity);
            pstmt.setString(5, prtotalprice);
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<script>alert('Confirm Your Order And Make Payment!'); window.location.href='./make-payment.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to insert product details.');</script>");
            }
            pstmt.close();
            con.close();
        } catch (Exception e) {
            out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
    }
%>

<script>
    const priceInput = document.getElementById('priceInput');
    const quantityInput = document.getElementById('quantityInput');
    const totalInput = document.getElementById('totalInput');
    const productPrice = parseFloat('<%= productPrice %>' );

    function Inc() {
        let quantity = parseInt(quantityInput.value);
        if (quantity < 10) {
            quantityInput.value = ++quantity;
        }
        updateTotal();
    }

    function Dec() {
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
            quantityInput.value = --quantity;
        }
        updateTotal();
    }

    function updateTotal() {
        const quantity = parseInt(quantityInput.value);
        totalInput.value = (quantity * productPrice).toFixed(2);
    }
</script>

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