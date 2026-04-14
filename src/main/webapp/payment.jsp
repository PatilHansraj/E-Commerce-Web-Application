<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="common/header.jsp" %>

<style>
.payment-wrapper {
    min-height: 80vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #ff9966, #ff5e62);
}

.container {
    background: white;
    width: 400px;
    padding: 40px 30px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
}

h2 {
    text-align: center;
    color: #2e7d32;
    margin-bottom: 15px;
    font-size: 24px;
}

.error {
    color: red;
    text-align: center;
    margin-bottom: 15px;
    font-size: 14px;
}

form {
    display: flex;
    flex-direction: column;
}

input {
    width: 100%;
    padding: 14px 12px;
    margin-bottom: 18px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
}

input:focus {
    border-color: #2e7d32;
    outline: none;
}

button {
    width: 100%;
    padding: 14px;
    background: #2e7d32;
    color: white;
    border: none;
    border-radius: 25px;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #66bb6a;
}
</style>

<div class="payment-wrapper">

<div class="container">
    <h2>Payment Details</h2>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <div class="error">Insufficient Balance!</div>
    <% } else if ("2".equals(request.getParameter("error"))) { %>
        <div class="error">Card details are incorrect!</div>
    <% } else if ("3".equals(request.getParameter("error"))) { %>
        <div class="error">Something went wrong. Try again.</div>
    <% } %>

    <form action="PaymentServlet" method="post">
        <input type="hidden" name="total" value="<%= request.getParameter("total") %>">

        <input type="text"
               name="card_name"
               placeholder="Cardholder Name"
               required>

        <input type="text"
               name="card_number"
               placeholder="Card Number"
               maxlength="12"
               pattern="[0-9]{12}"
               title="Enter 12 digit card number"
               required>

        <input type="text"
               name="expiry"
               placeholder="Expiry (MM/YY)"
               maxlength="5"
               required>

        <input type="text"
               name="cvv"
               placeholder="CVV"
               maxlength="3"
               pattern="[0-9]{3}"
               required>

        <button type="submit">Confirm Payment</button>
    </form>
</div>

</div>

<%@ include file="common/footer.jsp" %>
