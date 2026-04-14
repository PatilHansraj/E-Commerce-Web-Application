package com.project.controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

    	
    	 res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
         res.setHeader("Pragma", "no-cache");
         res.setDateHeader("Expires", 0);
    	
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT id, name, role FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
            	HttpSession oldSession = req.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }


                HttpSession session = req.getSession(true);

              
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));

                if 
                   ("admin".equalsIgnoreCase(rs.getString("role"))) {
                    res.sendRedirect("admin/dashboard.jsp");
                } else {
                    res.sendRedirect("products.jsp");
                }

            } else {
                res.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?error=2");
        }
    }
}
