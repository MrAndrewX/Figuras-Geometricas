package com.liceu.geom.controllers;

import com.liceu.geom.DAO.db.FiguraDaoDB;
import com.liceu.geom.model.User;

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
        User user = (User) session.getAttribute("userobject");

        req.setAttribute("figuras",FiguraDaoDB.figuras);
        System.out.println(FiguraDaoDB.figuras);
        req.getParameter("id");



        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/figuras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
