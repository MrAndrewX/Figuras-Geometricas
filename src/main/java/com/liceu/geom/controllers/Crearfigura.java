package com.liceu.geom.controllers;

import com.liceu.geom.Services.FiguraService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/crearfigura")
public class Crearfigura extends HttpServlet {
    FiguraService figuraService = new FiguraService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("username");


        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/crearfigura.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int[] coords = new int[2];

        coords[0] = Integer.parseInt(req.getParameter("coord-x"));
        coords[1] = Integer.parseInt(req.getParameter("coord-y"));

        String tipofigura = req.getParameter("figura");
        System.out.println(tipofigura);
        if (!(tipofigura.equals("triangulo") || tipofigura.equals("cuadrado") || tipofigura.equals("circulo") || tipofigura.equals("pentagono") ||
                tipofigura.equals("Estrella"))){
            resp.sendError(HttpServletResponse.SC_EXPECTATION_FAILED,"El tipo de figura no es valido");
            return;
        }
        String nombreFigura = req.getParameter("figuraname");
        System.out.println("Nombre de figura antes del if:" + nombreFigura);
        if (nombreFigura.isEmpty()){
        nombreFigura = tipofigura +""+ (int) (Math.random()*10000);
        }else{
            nombreFigura = req.getParameter("figuraname");
        }

        int size = Integer.parseInt(req.getParameter("size"));
        String color = req.getParameter("color");
        String user = (String) req.getSession().getAttribute("username");

        System.out.printf("Usuario: %s, Tipo figura: %s, Coords: %d:%d, " +
                "Tamaño %d, Color: %s, Nombre Figura: %s\n",user,tipofigura,coords[0],coords[1],size,color,nombreFigura);

        figuraService.newFigure(user,tipofigura,coords[0],coords[1],size,color,nombreFigura);

        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/crearfigura.jsp");
        dispatcher.forward(req,resp);
    }
}
