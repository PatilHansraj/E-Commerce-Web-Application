<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    /* Header styles */
    .header {
        background-color: #111827;
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .header h1 {
        margin: 0;
        font-size: 24px;
    }

    .header nav a {
        color: white;
        text-decoration: none;
        margin-left: 20px;
        font-weight: bold;
        transition: 0.2s;
    }

    .header nav a:hover {
        color: #a5d6a7;
    }
</style>

<div class="header">
    <h1>Admin Panel</h1>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="manageProducts.jsp">Manage Products</a>
        <a href="viewOrders.jsp">Orders</a>
        <a href="addProduct.jsp">Add Product</a>
        <a href="../LogoutServlet">Logout</a>
    </nav>
</div>
