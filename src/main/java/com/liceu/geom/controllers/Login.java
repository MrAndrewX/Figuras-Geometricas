package com.liceu.geom.controllers;


import com.liceu.geom.Services.UserService;
import com.liceu.geom.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class Login extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (!(session.getAttribute("userobject") == null)){
            //Ya tienes una sesion abierta
            PrintWriter pw = resp.getWriter();
            pw.print("Ya has iniciado session");
            resp.sendRedirect("/crearfigura");
        }else {

            RequestDispatcher dispatcher =
                    req.getRequestDispatcher("/WEB-INF/jsp/saveuser.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("user");



        if (!(username == null)){

            HttpSession session = req.getSession();


            for (User user : userService.getListFigures()){
                if (user.getName().equals(username)){
                    //Nombre de usuario ya en uso
                    resp.sendError(HttpServletResponse.SC_CONFLICT,"Nombre de usuario ya en uso");
                    return;
                }
            }
            userService.newUser(username);
            session.setAttribute("userobject",userService.getUserByName(username));

            System.out.println(userService.getUserByName(username));
            System.out.println("Lista de usuarios" + userService.getListFigures());
            resp.sendRedirect("/crearfigura");

            return;
        }



        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        dispatcher.forward(req,resp);
    }
}
