package com.liceu.geom.controllers;

import com.liceu.geom.DAO.db.FiguraDaoDB;
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

@WebServlet("/misfiguras")
public class Misfiguras extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userobject");
        List<Figura> misfiguras = new ArrayList<>();
        for (Figura f : FiguraDaoDB.figuras){
            if (f.getUser().getId() == user.getId()){
                misfiguras.add(f);
            }
        }
        req.setAttribute("figuras", misfiguras);
        System.out.println(FiguraDaoDB.figuras);
        req.getParameter("id");

        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/misfiguras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Figura> figurasencotradas = new ArrayList<>();
        for (Figura f : FiguraDaoDB.figuras){
            if (f.getNombreFigura().contains(req.getParameter("figurabuscada"))){
                figurasencotradas.add(f);
            }
        }
        req.setAttribute("figuras", figurasencotradas);

        req.getParameter("id");
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/misfiguras.jsp");
        dispatcher.forward(req,resp);
    }
}
