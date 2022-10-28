package com.liceu.geom.model;

public class Figura {
    int id;
    int x;
    int y;
    String tipofigura;
    String nombreFigura;
    int tamano;
    String color;
    User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDateCreacion() {
        return dateCreacion;
    }

    public void setDateCreacion(String dateCreacion) {
        this.dateCreacion = dateCreacion;
    }

    String dateCreacion;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String getTipofigura() {
        return tipofigura;
    }

    public void setTipofigura(String tipofigura) {
        this.tipofigura = tipofigura;
    }

    public String getNombreFigura() {
        return nombreFigura;
    }

    public void setNombreFigura(String nombreFigura) {
        this.nombreFigura = nombreFigura;
    }

    public int getTamano() {
        return tamano;
    }

    public void setTamano(int tamano) {
        this.tamano = tamano;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Figura{" +
                "id=" + id +
                ", x=" + x +
                ", y=" + y +
                ", tipofigura='" + tipofigura + '\'' +
                ", nombreFigura='" + nombreFigura + '\'' +
                ", tamano=" + tamano +
                ", color='" + color + '\'' +
                ", user=" + user +
                ", dateCreacion='" + dateCreacion + '\'' +
                '}';
    }
}
