package com.project.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.util.DBConnection;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse res)
throws ServletException, java.io.IOException {
          try {
           Connection con = DBConnection.getConnection();
           PreparedStatement ps = con.prepareStatement("INSERT INTO products(name,description,price,category,quantity,image) VALUES(?,?,?,?,?,?)"
           );
           ps.setString(1, req.getParameter("name"));
           ps.setString(2, req.getParameter("desc"));
           ps.setDouble(3, Double.parseDouble(req.getParameter("price")));
           ps.setString(4, req.getParameter("category"));
           ps.setInt(5, Integer.parseInt(req.getParameter("qty")));
           ps.setString(6, req.getParameter("image"));
           ps.executeUpdate();
           res.sendRedirect("admin/dashboard.jsp");
           } catch(Exception e){ e.printStackTrace(); }
        }
}
