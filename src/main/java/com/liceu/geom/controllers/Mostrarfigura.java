package com.liceu.geom.controllers;

import com.liceu.geom.DAO.db.FiguraDaoDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/figuras")
public class Mostrarfigura extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("username");
        req.setAttribute("figuras",FiguraDaoDB.figuras);


        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/figuras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
