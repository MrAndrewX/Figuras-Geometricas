package com.liceu.geom.DAO;

import com.liceu.geom.model.Figura;

import java.util.List;

public interface FiguraDAO {
    boolean insert(Figura figura);
    boolean remove(Figura figura);
    public List<Figura> getFigureList();
}
