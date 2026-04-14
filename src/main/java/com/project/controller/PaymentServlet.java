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
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("products.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId"); 
        double total = Double.parseDouble(request.getParameter("total"));
        String cardName = request.getParameter("card_name");
        String cardNumber = request.getParameter("card_number");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        try {
              
        	
            if(cardNumber.length() != 12) 
            {
                response.sendRedirect("payment.jsp?error=2");
                return;
            }

            
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(user_id, total, payment_status) VALUES(?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );
            ps.setInt(1, userId);
            ps.setDouble(2, total);
            ps.setString(3, "Paid");
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()) {
                orderId = rs.getInt(1);
            }

           
            for(Integer pid : cart.keySet()) {
                int qty = cart.get(pid);
                PreparedStatement ps2 = con.prepareStatement(
                    "SELECT price FROM products WHERE id=?"
                );
                ps2.setInt(1, pid);
                ResultSet rs2 = ps2.executeQuery();
                if(rs2.next()) {
                    double price = rs2.getDouble("price");
                    PreparedStatement ps3 = con.prepareStatement(
                        "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(?,?,?,?)"
                    );
                    ps3.setInt(1, orderId);
                    ps3.setInt(2, pid);
                    ps3.setInt(3, qty);
                    ps3.setDouble(4, price);
                    ps3.executeUpdate();
                    ps3.close();
                }
                rs2.close();
                ps2.close();
            }

            rs.close();
            ps.close();
            con.close();

            
            session.removeAttribute("cart");

            response.sendRedirect("orderConfirmation.jsp?total="+total);

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("payment.jsp?error=3");
        }
    }   
}
