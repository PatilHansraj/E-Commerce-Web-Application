<%@ page import="java.sql.*,com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Products | Admin</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #ff9966, #ff5e62);
        min-height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 1100px;
        margin: 40px auto;
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.25);
    }

    h2 {
        text-align: center;
        color: #2e7d32;
        margin-bottom: 25px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th {
        background: #2e7d32;
        color: white;
        padding: 12px;
        font-size: 15px;
    }

    table td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
    }

    table tr:hover {
        background: #f5f5f5;
    }

    .btn {
        text-decoration: none;
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        color: white;
        margin: 0 3px;
        display: inline-block;
    }

    .edit {
        background: #ff9800;
    }

    .delete {
        background: #e53935;
    }

    .btn:hover {
        opacity: 0.9;
        transform: scale(1.05);
    }

    .back {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #2e7d32;
        font-weight: bold;
    }

    .back:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">
    <h2>Manage Products</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>

<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM products");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td>₹<%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>
                <a class="btn edit" href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a class="btn delete"
                   href="../DeleteProductServlet?id=<%= rs.getInt("id") %>"
                   onclick="return confirm('Are you sure you want to delete this product?')">
                   Delete
                </a>
            </td>
        </tr>
<% } %>

    </table>

    <a href="dashboard.jsp" class="back">Back to Dashboard</a>
</div>

<%@ include file="footer1.jsp" %>
</body>
</html>
