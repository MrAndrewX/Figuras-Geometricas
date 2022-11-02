package com.liceu.geom.controllers;


import com.liceu.geom.Services.FiguraService;
import com.liceu.geom.model.Figura;
import com.liceu.geom.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

@WebServlet("/borrarfigura")
public class Borrarfigura extends HttpServlet {

    FiguraService figuraService = new FiguraService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.print("No has seleccionado ninguna figura");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        User user = (User) req.getSession().getAttribute("userobject");
        if (user.getId() == Integer.parseInt(req.getParameter("iduser"))){
            int idfigura = Integer.parseInt(req.getParameter("idfigura"));

            for (Figura f : figuraService.getListFigures()){
                if (f.getId() == idfigura){
                    figuraService.removeFigure(f);
                    pw.print("Figura borrada correctamente");
                    RequestDispatcher dispatcher =
                            req.getRequestDispatcher("/WEB-INF/jsp/borrarfigura.jsp");
                    dispatcher.forward(req,resp);
                    return;
                }
            }

        }else {
            pw.print("No puedes borrar una figura que no es tuya");
            RequestDispatcher dispatcher =
                    req.getRequestDispatcher("/WEB-INF/jsp/borrarfiguraerror.jsp");
            dispatcher.forward(req,resp);
            return;
        }


    }
}
