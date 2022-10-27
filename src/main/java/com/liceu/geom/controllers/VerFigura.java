package com.liceu.geom.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/verfigura")
public class VerFigura extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/verfigura.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idfigura"));
        req.setAttribute("id",id);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/verfigura.jsp");
        dispatcher.forward(req,resp);
    }
}
