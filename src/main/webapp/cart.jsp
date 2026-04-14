<%@ page import="java.util.*,java.sql.*,com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="common/header.jsp" %>

<style>
.cart-container {
    width: 90%;
    max-width: 1000px;
    margin: 30px auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table th, table td {
    padding: 12px;
    text-align: center;
}

table th {
    background: #2e7d32;
    color: white;
}

table td {
    border-bottom: 1px solid #ddd;
}

.product-img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 6px;
}

button {
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.btn-inc {
    background: #2e7d32;
    color: white;
}

.btn-dec {
    background: #ff7043;
    color: white;
}

.btn-remove {
    background: red;
    color: white;
}

.total-section {
    text-align: right;
    margin-top: 20px;
    font-size: 20px;
    font-weight: bold;
}

.cart-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
}

.cart-actions a {
    padding: 12px 25px;
    text-decoration: none;
    background: #2e7d32;
    color: white;
    border-radius: 30px;
    font-weight: bold;
}

.empty-cart {
    text-align: center;
    margin-top: 50px;
    font-size: 20px;
    color: #666;
}

.empty-cart a {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background: #2e7d32;
    color: white;
    border-radius: 25px;
    text-decoration: none;
}
</style>

<div class="cart-container">

<%
Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

if (cart == null || cart.isEmpty()) {
%>
    <div class="empty-cart">
        <p>😔 Your Cart is Empty</p>
        <a href="products.jsp">Start Shopping</a>
    </div>
<%
} else {
%>

<h2>Your Shopping Cart</h2>

<table>
    <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Subtotal</th>
        <th>Action</th>
    </tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
double total = 0;

try {
    con = DBConnection.getConnection();

    for (Integer pid : cart.keySet()) {
        ps = con.prepareStatement("SELECT * FROM products WHERE id=?");
        ps.setInt(1, pid);
        rs = ps.executeQuery();

        if (rs.next()) {
            int qty = cart.get(pid);
            double price = rs.getDouble("price");
            double sub = price * qty;
            total += sub;
%>
    <tr>
        <td>
            <img class="product-img" src="images/<%= rs.getString("image") %>"><br>
            <%= rs.getString("name") %>
        </td>
        <td>₹<%= price %></td>
        <td>
            <form action="UpdateCartServlet" method="post" style="display:inline;">
                <input type="hidden" name="pid" value="<%= pid %>">
                <button name="action" value="dec" class="btn-dec">−</button>
                <%= qty %>
                <button name="action" value="inc" class="btn-inc">+</button>
            </form>
        </td>
        <td>₹<%= sub %></td>
        <td>
            <form action="UpdateCartServlet" method="post">
                <input type="hidden" name="pid" value="<%= pid %>">
                <button name="action" value="remove" class="btn-remove">Remove</button>
            </form>
        </td>
    </tr>
<%
        }
    }
} catch(Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>

</table>

<div class="total-section">
    Total Amount: ₹<%= total %>
</div>

<div class="cart-actions">
    <a href="products.jsp">Continue Shopping</a>
    <a href="checkout.jsp">Proceed to Checkout</a>
</div>

<%
}
%>

</div>

<%@ include file="common/footer.jsp" %>
