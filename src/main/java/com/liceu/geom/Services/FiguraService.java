package com.liceu.geom.Services;

import com.liceu.geom.DAO.FiguraDAO;
import com.liceu.geom.DAO.db.FiguraDaoDB;
import com.liceu.geom.model.Figura;
import com.liceu.geom.model.User;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class FiguraService {
    FiguraDAO figuraDAO = new FiguraDaoDB();
    int lastID = 1;
    public void newFigure(String tipofigura, int coordx, int coordy, int size, String color, String nombreFigura, User userobject) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());

        Figura f = new Figura();

        f.setTipofigura(tipofigura);
        f.setX(coordx);
        f.setY(coordy);
        f.setTamano(size);
        f.setColor(color);
        f.setDateCreacion(formatter.format(date));
        f.setNombreFigura(nombreFigura);
        f.setId(lastID);
        f.setUser(userobject);
        figuraDAO.insert(f);
        lastID++;
    }
    public void removeFigure(Figura figure){
        System.out.println("Quitando figura: " + figure.toString());
        figuraDAO.remove(figure);
    }
    public List<Figura> getListFigures(){
        return figuraDAO.getFigureList();
    }
}
