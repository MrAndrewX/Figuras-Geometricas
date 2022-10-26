package com.liceu.geom.DAO.db;

import com.liceu.geom.DAO.FiguraDAO;
import com.liceu.geom.model.Figura;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FiguraDaoDB implements FiguraDAO {
    public static List<Figura> figuras = new ArrayList<>();
    @Override
    public boolean insert(Figura figura)  {

        if (figuras.contains(figura)) {
            return false;

        }else{
            figuras.add(figura);
            System.out.println("Lista Figuras: + " + figuras.toString());
            return true;
        }

    }
}
