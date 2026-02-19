<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="./css/bill.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .bill-container {
            background-color: #e6f7ff;
            border: 4px double #000;
            padding: 20px;
            border-radius: 10px;
        }

        .bill-header h1 {
            color: #0047ab;
            font-size: 32px;
            text-align: center;
            margin-bottom: 20px;
            display:flex;
        }

        .billinfo{
            
        }

        /* ONLY THIS PART ADDED */
        .bill-header{
            position: relative;
            width: 100%;
        }

        .infodiv{
      float: left;
    margin-left: 60px;   /* left side se andar */
     }

       .timediv{
    float: right;
    text-align: right;
    margin-right: 60px;  /* right side se andar */
     }


        .bill-header:: after{
            content: "";
            display: block;
            clear: both;
        }
        /* END CHANGE */

        .bill-header p {
            font-weight: bold;
            color: #000;
            margin: 5px 0;
        }

        .bill-details table {
            width: 100%;
            border-collapse: collapse;
        }

        .bill-details th, .bill-details td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        .bill-details th {
            background-color: #0047ab;
            color: #fff;
        }

        .total {
            font-weight: bold;
        }

        .ftext {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            font-style: italic;
            color: green;
        }

        .print-button-container {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .print-button {
            padding: 10px 20px;
            background-color: #0047ab;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-transform: uppercase;
        }

        .print-button:hover {
            background-color: #003680;
        }

        @media print {
            body * {
                visibility: hidden;
            }
            .bill-container, .bill-container * {
                visibility: visible;
            }
            .bill-container {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
            }
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
                <li><a href="./../index.jsp">Home</a></li>
                <li><a href="./company.jsp">Products</a></li>
                <li><a href="./Offer.jsp">Offer</a></li>
                <li><a href="./About.jsp">About Us</a></li>
                <li><a href="./Contact.jsp">Contact</a></li>
            </ul>
        </nav>
        <div class="header-icons">
            <a href="./../User/Login.jsp"><i class="fa-solid fa-user"></i></a>
        </div>
    </div>
</header>

<%
    String customerName = "";
    String mobileNo = "";
    String productName = "";
    String productCompany = "";
    int productPrice = 0;

    try {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection con = DriverManager.getConnection("jdbc:odbc:ElectronicShopDB", "", "");
        Statement st = con.createStatement();

        String paymentQuery = "SELECT name, mobileno, productname, totalprice FROM Payment WHERE id = (SELECT MAX(id) FROM Payment)";
        ResultSet rsPayment = st.executeQuery(paymentQuery);

        if (rsPayment.next()) {
            customerName = rsPayment.getString("name");
            mobileNo = rsPayment.getString("mobileno");
            productName = rsPayment.getString("productname");
            productPrice = rsPayment.getInt("totalprice");
        }

        String bookingQuery = "SELECT prcompany FROM Booking WHERE id = (SELECT MAX(id) FROM Booking)";
        ResultSet rsBooking = st.executeQuery(bookingQuery);

        if (rsBooking.next()) {
            productCompany = rsBooking.getString("prcompany");
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    Date now = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

    String currentDate = dateFormat.format(now);
    String currentTime = timeFormat.format(now);
%>

<div class="bill-container">
    <div class="bill-header">

        <h1>E-Shop Electronic Product Invoice</h1>

        <div class="infodiv">
            <p>Customer Name: <span style="color:red"><%= customerName %></span></p>
            <p>Mobile Number: <span style="color:red"><%= mobileNo %></span></p>
        </div>

        <div class="timediv">
            <p>Date: <span style="color:red"><%= currentDate %></span></p>
            <p>Time: <span style="color:red"><%= currentTime %></span></p>
        </div>

    </div>

    <div class="bill-details">
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Company</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td><%= productName %></td>
                    <td>1</td>
                    <td><%= productCompany %></td>
                    <td>&#8377; <%= productPrice %></td>
                    <td>&#8377; <%= productPrice %></td>
                </tr>
            </tbody>

            <tfoot>
                <tr>
                    <td colspan="4" class="total">Total Amount:</td>
                    <td class="total">&#8377; <%= productPrice %></td>
                </tr>
            </tfoot>

        </table>
    </div>

    <div class="ftext">
        Thank you for your purchase! For inquiries, contact us at eshop@gmail.com.
    </div>
</div>

<div class="print-button-container">
    <button class="print-button" onclick="window.print()">Print Bill</button>
</div>

<footer class="footer">
    <div class="container">

        <div class="footer-section">
            <h4>About Us</h4>
            <p>
                Your one-stop shop for the latest electronic gadgets and accessories.
                <li><a style="color:white" href="./About.jsp">Click to View About us</a></li>
            </p>
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
