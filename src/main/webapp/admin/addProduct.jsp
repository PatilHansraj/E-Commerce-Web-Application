<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Product | Admin</title>
<style>
    body {
    font-family: Arial,sans-serif; 
    }
    .card {
        background: white;
        width: 420px;
        padding: 30px 28px;
        border-radius: 16px;
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        margin: 60px auto;
    }
    h2 { 
    text-align:center; 
    color:#2e7d32; 
    margin-bottom:25px; 
    }
    input { 
    width:100%; 
    padding:12px 14px; 
    margin:12px 0; 
    border-radius:8px; 
    border:1px solid #ccc; 
    }
    input:focus { 
    border-color:#2e7d32; 
    outline:none; 
    }
    button {
        width:100%; padding:13px; margin-top:18px;
        background:#2e7d32; border:none; 
        color:white; font-weight:bold; 
        border-radius:30px;
        cursor:pointer; transition:0.3s;
    }
    button:hover { 
    background:#66bb6a; 
    transform:scale(1.03); 
    }
    .back { 
    display:block; 
    margin-top:18px; 
    text-align:center; 
    text-decoration:none; 
    color:#2e7d32; 
    font-weight:bold; }
    .back:hover { 
    text-decoration:underline; 
    }
</style>
</head>
<body>

<div class="card">
    <h2>Add New Product</h2>
    <form action="../AdminProductServlet" method="post">
        <input type="text" name="name" placeholder="Product Name" required>
        <input type="text" name="desc" placeholder="Product Description" required>
        <input type="number" name="price" placeholder="Price" required>
        <input type="text" name="category" placeholder="Category" required>
        <input type="number" name="qty" placeholder="Quantity" required>
        <input type="text" name="image" placeholder="Image Filename (example.jpg)" required>
        <button type="submit">Add Product</button>
    </form>
    <a href="dashboard.jsp" class="back">Back to Dashboard</a>
</div>

<%@ include file="footer1.jsp" %>
</body>
</html>
