<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Online Shopping</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff9966, #ff5e62);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url("https://up.yimg.com/ib/th/id/OIP.G-d9kCbJS7aswjbAFFHQ0AHaDt?pid=Api&rs=1&c=1&qlt=95&w=233&h=116"); 
     
             }
             
             
        .login-box {
            background: white;
            width: 360px;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #2e7d32;
        }

        input[type=email],
        input[type=password] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #2e7d32;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background: #2e7d32;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #66bb6a;
            transform: scale(1.02);
        }

        .register-link {
            margin-top: 18px;
            font-size: 14px;
        }

        .register-link a {
            color: #2e7d32;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .error {
            color: #d32f2f;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h2>Login</h2>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Invalid Email or Password</div>
    <% } %>

    <form action="LoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

    <div class="register-link">
        New User? <a href="register.jsp">Register Here</a>
    </div>
</div>

</body>
</html>
