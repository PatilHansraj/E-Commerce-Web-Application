package com.project.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE products SET name=?, description=?, price=? WHERE id=?"
            );

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("desc"));
            ps.setDouble(3, Double.parseDouble(req.getParameter("price")));
            ps.setInt(4, Integer.parseInt(req.getParameter("id")));

            ps.executeUpdate();

            res.sendRedirect("admin/manageProducts.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}