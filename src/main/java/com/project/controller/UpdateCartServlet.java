package com.project.controller;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int pid = Integer.parseInt(req.getParameter("pid"));
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        Map<Integer, Integer> cart =
            (Map<Integer, Integer>) session.getAttribute("cart");

        if (cart != null) {
            if ("inc".equals(action)) {
                cart.put(pid, cart.get(pid) + 1);
            } else if ("dec".equals(action)) {
                if (cart.get(pid) > 1)
                    cart.put(pid, cart.get(pid) - 1);
            } else if ("remove".equals(action)) {
                cart.remove(pid);
            }
        }

        res.sendRedirect("cart.jsp");
    }
}
