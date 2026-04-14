<%@ page import="java.sql.*, com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin | Order Details</title>

<style>
*{
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    margin:0;
    padding:30px;
    background: linear-gradient(135deg, #ff9966, #ff5e62);
}

.container{
    background:white;
    max-width:1000px;
    margin:auto;
    padding:25px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#d84315;
}

table{
    width:100%;
    border-collapse:collapse;
}

th, td{
    padding:14px;
    text-align:center;
}

th{
    background:#d84315;
    color:white;
}

tr:nth-child(even){
    background:#fff3e0;
}

tr:hover{
    background:#ffe0b2;
}

.back-btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 18px;
    background:#2e7d32;
    color:white;
    text-decoration:none;
    border-radius:6px;
}

.back-btn:hover{
    background:#1b5e20;
}
</style>
</head>

<body>
<div class="container">

<h2>Order Products</h2>

<%
int orderId = Integer.parseInt(request.getParameter("orderId"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT p.name, oi.price, oi.quantity " +
    "FROM order_items oi JOIN products p ON oi.product_id = p.id " +
    "WHERE oi.order_id=?"
);
ps.setInt(1, orderId);
ResultSet rs = ps.executeQuery();
%>

<table>
<tr>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Subtotal</th>
</tr>

<%
double grandTotal = 0;
while(rs.next()){
    double price = rs.getDouble("price");
    int qty = rs.getInt("quantity");
    double sub = price * qty;
    grandTotal += sub;
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td>₹ <%= price %></td>
    <td><%= qty %></td>
    <td>₹ <%= sub %></td>
</tr>

<% } %>

<tr>
    <th colspan="3">Grand Total</th>
    <th>₹ <%= grandTotal %></th>
</tr>

</table>

<a class="back-btn" href="viewOrders.jsp">⬅ Back to Orders</a>

</div>

<%@ include file="footer1.jsp" %>
</body>
</html>
