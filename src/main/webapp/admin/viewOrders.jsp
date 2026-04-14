<%@ page import="java.sql.*, com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin | View Orders</title>

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
    background:#fff;
    max-width:1100px;
    margin:auto;
    padding:25px;
    border-radius:12px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#2e7d32;
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
    background:#2e7d32;
    color:#fff;
}

tr:nth-child(even){
    background:#f9f9f9;
}

tr:hover{
    background:#e8f5e9;
}

.status-success{
    color:#2e7d32;
    font-weight:bold;
}

.status-pending{
    color:#ff9800;
    font-weight:bold;
}

.view-btn{
    padding:8px 14px;
    background:#1976d2;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-size:14px;
}

.view-btn:hover{
    background:#0d47a1;
}
</style>
</head>

<body>
<div class="container">
<h2>Customer Orders</h2>

<table>
<tr>
    <th>Order ID</th>
    <th>User ID</th>
    <th>Total Amount</th>
    <th>Payment Status</th>
    <th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT id, user_id, total, payment_status FROM orders ORDER BY id DESC"
);
ResultSet rs = ps.executeQuery();

while(rs.next()){
    String status = rs.getString("payment_status");
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td>₹ <%= rs.getDouble("total") %></td>
    <td class="<%= status.equalsIgnoreCase("SUCCESS") ? "status-success" : "status-pending" %>">
        <%= status %>
    </td>
    <td>
        <a class="view-btn" href="viewOrderItems.jsp?orderId=<%= rs.getInt("id") %>">
            View Products
        </a>
    </td>
</tr>

<% } %>

</table>
</div>

<%@ include file="footer1.jsp" %>
</body>
</html>
