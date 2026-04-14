<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Shopping Cart</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            width: 420px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);+
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            width: 140px;
            padding: 12px;
            margin: 10px;
            background: #ff5e62;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: #ff9966;
            transform: scale(1.05);
        }

        footer {
            margin-top: 20px;
            font-size: 13px;
            color: #aaa;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Online Shopping</h1>
    <p>Buy your favorite products easily and securely</p>

    <a href="login.jsp" class="btn">Login</a>      
    <a href="register.jsp" class="btn">Register</a>

    <footer>
        © 2025 Online Shopping Cart System
    </footer>
</div>
           
          
</body>
</html>
