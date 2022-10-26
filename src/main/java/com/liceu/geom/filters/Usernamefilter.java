package com.liceu.geom.filters;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/crearfigura","/figuras"})
public class Usernamefilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("username");
        if (user == null){
            res.setStatus(401);
            res.sendError(HttpServletResponse.SC_FORBIDDEN,"Acceso no authorizado, no se ha guardado el nombre de usuario");
            return;
        }
        chain.doFilter(req,res);
    }
}
