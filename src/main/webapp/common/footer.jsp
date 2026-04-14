<!-- ===== FOOTER ===== -->
<style>
.footer {
    background: #111827;
    color: #E5E7EB;
    padding: 30px 20px;
    margin-top: 40px;
    font-family: Arial, sans-serif;
}

.footer-container {
    max-width: 1100px;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.footer-box {
    flex: 1;
    min-width: 220px;
    margin: 10px 0;
}

.footer-box h3 {
    font-size: 16px;
    margin-bottom: 10px;
    color: #FFFFFF;
}

.footer-box p,
.footer-box a {
    font-size: 14px;
    color: #D1D5DB;
    text-decoration: none;
    line-height: 1.7;
}

.footer-box a:hover {
    color: #2563EB;
}

/* Bottom Section */
.footer-bottom {
    text-align: center;
    margin-top: 25px;
    padding-top: 15px;
    border-top: 1px solid #374151;
}

.footer-bottom p {
    margin: 4px 0;
    font-size: 13px;
    color: #9CA3AF;
}

.footer-bottom strong {
    color: #E5E7EB;
}

.dev-name {
    color: #60A5FA;
    font-weight: 600;
}
</style>

<div class="footer">
    <div class="footer-container">

        <!-- About -->
        <div class="footer-box">
            <h3>About</h3>
            <p>
                Online Shopping Cart System is a web application that allows
                users to browse products, manage their cart, and place orders
                securely.
            </p>
        </div>

        <!-- Quick Links -->
        <div class="footer-box">
            <h3>Quick Links</h3>
            <a href="products.jsp">Products</a><br>
            <a href="cart.jsp">Cart</a><br>
            <a href="checkout.jsp">Checkout</a>
        </div>

        <!-- Contact -->
        <div class="footer-box">
            <h3>Contact</h3>
            <p>Email: support@onlineshop.com</p>
            <p>Phone: +91 90000 00000</p>
            <p>India</p>
        </div>

    </div>

    <div class="footer-bottom">
        <p>© 2026 <strong>Online Shopping Cart System</strong></p>
        <p>Developed by <span class="dev-name">Hansraj Patil</span></p>
    </div>
</div>
