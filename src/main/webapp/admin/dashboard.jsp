

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #ff9966, #ff5e62);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dashboard {
        background: white;
        width: 440px;
        padding: 35px;
        border-radius: 18px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.3);
        text-align: center;
    }

    h2 {
        margin-bottom: 25px;
        color: #2e7d32;
    }

    .card {
        display: block;
        padding: 15px;
        margin: 14px 0;
        text-decoration: none;
        font-size: 17px;
        font-weight: bold;
        border-radius: 12px;
        color: white;
        transition: 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
        opacity: 0.9;
    }

    footer {
        margin-top: 22px;
        font-size: 13px;
        color: #777;
    }
</style>
</head>

<body>

<div class="dashboard">
    <h2>Admin Dashboard</h2>

    <a href="addProduct.jsp" class="card" style="background:#ff9800;">
        Add Product
    </a>

    <a href="manageProducts.jsp" class="card" style="background:#ff9800;">
        Manage Products
    </a>

    <a href="viewUsers.jsp" class="card" style="background:#ff9800;">
        View Users
    </a>

    <a href="viewOrders.jsp" class="card" style="background:#ff9800;">
        View Orders
    </a>

    <a href="../logout.jsp" class="card" style="background:#ff9800;">
        Logout
    </a>

    <footer>
        © 2026 Online Shopping Admin Panel
    </footer>
</div>

</body>
</html>
