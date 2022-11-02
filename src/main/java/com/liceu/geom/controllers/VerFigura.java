package com.liceu.geom.controllers;


import com.liceu.geom.Services.FiguraService;
import com.liceu.geom.model.Figura;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;



@WebServlet("/verfigura")
public class VerFigura extends HttpServlet {
    FiguraService figuraService = new FiguraService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.print("No puedes visualizar una figura si no has elegido una.");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idfigura"));
        req.setAttribute("id",id);
        Figura f = new Figura();
        for(Figura figura : figuraService.getListFigures()){
            if (figura.getId() == id){
                f = figura;
            }
        }

        req.setAttribute("nombrefigura",f.getNombreFigura());
        req.setAttribute("tipofigura",f.getTipofigura());
        req.setAttribute("coordx",f.getX());
        req.setAttribute("coordy",f.getY());
        req.setAttribute("tamano",f.getTamano());
        req.setAttribute("color",f.getColor());
        req.setAttribute("fechacreacion",f.getDateCreacion());





        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/verfigura.jsp");
        dispatcher.forward(req,resp);
    }
}
