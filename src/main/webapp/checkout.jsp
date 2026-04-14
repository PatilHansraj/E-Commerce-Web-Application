<%@ page import="java.util.*, java.sql.*, com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Map<Integer, Integer> cart =
        (Map<Integer, Integer>) session.getAttribute("cart");

    String action = request.getParameter("action");
    String pidStr = request.getParameter("pid");
    String qtyStr = request.getParameter("qty");

    if (cart != null && action != null && pidStr != null) {
        int pid = Integer.parseInt(pidStr);

        if ("plus".equals(action)) {
            cart.put(pid, cart.get(pid) + 1);
        } else if ("minus".equals(action)) {
            int q = cart.get(pid);
            if (q <= 1) cart.remove(pid);
            else cart.put(pid, q - 1);
        } else if ("update".equals(action)) {
            int q = Integer.parseInt(qtyStr);
            if (q <= 0) cart.remove(pid);
            else cart.put(pid, q);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("checkout.jsp");
        return;
    }
%>

<%@ include file="common/header.jsp" %>

<style>
.container {
    width: 650px;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.15);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background: #2e7d32;
    color: white;
}

.qty-btn {
    padding: 6px 10px;
    border: none;
    background: orange;
    color: white;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
}

.qty-input {
    width: 55px;
    text-align: center;
    padding: 6px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.total {
    text-align: right;
    font-size: 18px;
    margin-top: 15px;
    font-weight: bold;
}

.pay-btn {
    width: 100%;
    padding: 12px;
    margin-top: 20px;
    background: green;
    color: white;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    cursor: pointer;
}

.empty-cart {
    text-align: center;
    font-size: 18px;
    margin-top: 40px;
}
</style>

<div class="container">

<h2 align="center">Checkout</h2>

<%
    if (cart == null || cart.isEmpty()) {
%>
    <div class="empty-cart">
        Cart is empty! <a href="products.jsp">Shop Now</a>
    </div>
<%
    } else {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    double total = 0;

    try {
        con = DBConnection.getConnection();
%>

<table>
<tr>
    <th>Product</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Subtotal</th>
</tr>

<%
        for (Integer pid : cart.keySet()) {

            ps = con.prepareStatement(
                "SELECT name, price FROM products WHERE id=?"
            );
            ps.setInt(1, pid);
            rs = ps.executeQuery();

            if (rs.next()) {
                int qty = cart.get(pid);
                double price = rs.getDouble("price");
                double subtotal = qty * price;
                total += subtotal;
%>

<tr>
    <td><%= rs.getString("name") %></td>

    <td>
        <!-- Minus -->
        <form method="post" style="display:inline;">
            <input type="hidden" name="pid" value="<%= pid %>">
            <button class="qty-btn" name="action" value="minus">−</button>
        </form>

        <!-- Update -->
        <form method="post" style="display:inline;">
            <input type="hidden" name="pid" value="<%= pid %>">
            <input type="hidden" name="action" value="update">
            <input type="number"
                   name="qty"
                   value="<%= qty %>"
                   min="0"
                   class="qty-input"
                   onchange="this.form.submit()">
        </form>

        <!-- Plus -->
        <form method="post" style="display:inline;">
            <input type="hidden" name="pid" value="<%= pid %>">
            <button class="qty-btn" name="action" value="plus">+</button>
        </form>
    </td>

    <td>₹<%= price %></td>
    <td>₹<%= subtotal %></td>
</tr>

<%
            }
            rs.close();
            ps.close();
        }
%>

</table>

<div class="total">
    Total: ₹<%= total %>
</div>

<form action="payment.jsp" method="post">
    <input type="hidden" name="total" value="<%= total %>">
    <button class="pay-btn">Proceed to Payment</button>
</form>

<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) con.close();
    }
}
%>

</div>

<%@ include file="common/footer.jsp" %>
