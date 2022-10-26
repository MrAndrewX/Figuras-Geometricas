package com.liceu.geom.Services;

import com.liceu.geom.DAO.FiguraDAO;
import com.liceu.geom.DAO.db.FiguraDaoDB;
import com.liceu.geom.model.Figura;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FiguraService {
    FiguraDAO figuraDAO = new FiguraDaoDB();
    public void newFigure(String user, String tipofigura, int coordx, int coordy, int size, String color, String nombreFigura) {
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());

        Figura f = new Figura();
        f.setId(FiguraDaoDB.figuras.size()+1);
        f.setTipofigura(tipofigura);
        f.setX(coordx);
        f.setY(coordy);
        f.setTamano(size);
        f.setColor(color);
        f.setDateCreacion(formatter.format(date));
        f.setNombreFigura(nombreFigura);

        figuraDAO.insert(f);
    }
}
