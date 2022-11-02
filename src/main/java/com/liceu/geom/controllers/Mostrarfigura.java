package com.liceu.geom.controllers;

import com.liceu.geom.DAO.db.FiguraDaoDB;
import com.liceu.geom.Services.FiguraService;
import com.liceu.geom.model.Figura;
import com.liceu.geom.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/figuras")
public class Mostrarfigura extends HttpServlet {
    FiguraService figuraService = new FiguraService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userobject");
        if (req.getParameter("figurabuscada") == null) {
            req.setAttribute("figuras", figuraService.getListFigures());
            System.out.println(figuraService.getListFigures());
            req.getParameter("id");
        }



        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/figuras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Figura> figurasencotradas = new ArrayList<>();
        for (Figura f : figuraService.getListFigures()){
            if (f.getNombreFigura().contains(req.getParameter("figurabuscada"))){
                figurasencotradas.add(f);
            }
        }
        req.setAttribute("figuras", figurasencotradas);

        req.getParameter("id");
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/figuras.jsp");
        dispatcher.forward(req,resp);
    }
}
