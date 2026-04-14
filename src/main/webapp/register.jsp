<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Online Shopping</title>

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
        }

        .register-box {
            background: white;
            width: 380px;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #2e7d32;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #2e7d32;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 18px;
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

        .login-link {
            margin-top: 18px;
            font-size: 14px;
        }

        .login-link a {
            color: #2e7d32;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="register-box">
    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>

        <input type="email" name="email" placeholder="Email Address" required>

        <input type="password" name="password" placeholder="Password" required>

        <select name="role" required>
            <option value="">Select Role</option>
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select>

        <button type="submit">Register</button>
    </form>

    <div class="login-link">
        Already have an account? <a href="login.jsp">Login Here</a>
    </div>
</div>

</body>
</html>
