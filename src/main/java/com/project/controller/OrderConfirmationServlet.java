package com.project.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import com.project.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/OrderConfirmationServlet")
public class OrderConfirmationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            HttpSession session = req.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
            if(cart == null || cart.isEmpty()) {
                res.sendRedirect("products.jsp");
                return;
            }

            double total = Double.parseDouble(req.getParameter("total"));

            Connection con = DBConnection.getConnection();;

            
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders (user_id, total, payment_status, order_date) VALUES (?, ?, 'Paid', NOW())",
                PreparedStatement.RETURN_GENERATED_KEYS
            );
            ps.setInt(1, userId);
            ps.setDouble(2, total);
            ps.executeUpdate();

           
            ResultSet rs = ps.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()) orderId = rs.getInt(1);

           
            PreparedStatement itemPs = con.prepareStatement(
                "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)"
            );

            for (Integer pid : cart.keySet()) {
                PreparedStatement prodPs = con.prepareStatement(
                    "SELECT price FROM products WHERE id=?"
                );
                prodPs.setInt(1, pid);
                ResultSet prodRs = prodPs.executeQuery();
                if(prodRs.next()) {
                    itemPs.setInt(1, orderId);
                    itemPs.setInt(2, pid);
                    itemPs.setInt(3, cart.get(pid)); 
                    itemPs.setDouble(4, prodRs.getDouble("price")); // price
                    itemPs.executeUpdate();
                }
                prodRs.close();
                prodPs.close(); 
            }    

            session.removeAttribute("cart");

            res.sendRedirect("orderConfirmation.jsp?total=" + total);

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("checkout.jsp");
        }
    }
}
