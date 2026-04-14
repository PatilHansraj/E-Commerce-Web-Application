package com.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("productId"));
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        Map<Integer,Integer> cart =
            (Map<Integer,Integer>) session.getAttribute("cart");

        if(cart == null){
            cart = new HashMap<>();
        }

        if("buy".equals(action)){
            // Buy Now → single product checkout
            cart.clear();
            cart.put(productId, 1);
            session.setAttribute("cart", cart);
            res.sendRedirect("checkout.jsp");
        }
        else{
            // Add to Cart
            cart.put(productId, cart.getOrDefault(productId, 0) + 1);
            session.setAttribute("cart", cart);
            res.sendRedirect("products.jsp");
        }
    }
}
