<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="common/header.jsp" %>

<style>
.confirm-wrapper {
    min-height: 80vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #ff9966, #ff5e62);
}

.container {
    background: white;
    padding: 40px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
    max-width: 420px;
    width: 100%;
}

h2 {
    color: #2e7d32;
    margin-bottom: 10px;
}

p {
    font-size: 18px;
    margin: 15px 0;
}

a {
    display: inline-block;
    padding: 12px 25px;
    background: #ff9800;
    color: white;
    text-decoration: none;
    border-radius: 25px;
    font-weight: bold;
    margin-top: 20px;
}

a:hover {
    background: #e68a00;
}
</style>

<div class="confirm-wrapper">

<div class="container">
    <h2>Order Confirmed</h2>
    <p>Thank you for your purchase.</p>
    <p><strong>Total Paid:</strong> ₹<%= request.getParameter("total") %></p>

    <a href="products.jsp">Continue Shopping</a>
</div>

</div>

<%@ include file="common/footer.jsp" %>
