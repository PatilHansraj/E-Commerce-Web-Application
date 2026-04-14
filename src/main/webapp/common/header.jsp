<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping Cart</title>

<style>
*{
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    margin:0;
    padding:0;
    background:#f3f4f6;
}

/* ===== HEADER ===== */
.header{
    background:#111827; /* dark slate */
    color:#f9fafb;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 12px rgba(0,0,0,0.25);
}

.header h1{
    margin:0;
    font-size:22px;
    letter-spacing:1px;
}

/* ===== NAV LINKS ===== */
.nav{
    display:flex;
    align-items:center;
    gap:12px;
}

.nav a{
    color:#e5e7eb;
    text-decoration:none;
    font-weight:600;
    padding:8px 16px;
    border-radius:20px;
    transition:all 0.3s ease;
}

.nav a:hover{
    background:#2563eb;
    color:white;
}

/* ===== USER INFO ===== */
.user-box{
    font-size:14px;
    color:#9ca3af;
    margin-right:8px;
}

/* ===== LOGOUT BUTTON ===== */
.logout{
    background:#dc2626;
    color:white !important;
}

.logout:hover{
    background:#b91c1c;
}

/* ===== MAIN CONTAINER ===== */
.main-container{
    min-height:calc(100vh - 140px);
    padding:30px;
}
</style>

</head>
<body>

<!-- ===== HEADER BAR ===== -->
<div class="header">
    <h1>🛒 Online Shopping</h1>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/products.jsp">Products</a>
        <a href="<%= request.getContextPath() %>/cart.jsp">Cart</a>

        <% if("admin".equals(role)) { %>
            <a href="<%= request.getContextPath() %>/admin/dashboard.jsp">Admin</a>
        <% } %>

        <% if(user != null) { %>
            <span class="user-box">Welcome, <%= user %></span>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout">Logout</a>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
            <a href="<%= request.getContextPath() %>/register.jsp">Register</a>
        <% } %>
    </div>
</div>

<!-- ===== PAGE CONTENT START ===== -->
<div class="main-container">
