<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Figura</title>


</head>
<body>
<h1>Crear figura</h1>
<canvas id="myCanvas" width="1024px" height="768px" style="border:1px solid #000000;">
</canvas>
<form action="/crearfigura" method="post">
    <label> Coordenadas:
    <input type="text" name="coord-x" placeholder="Coodenada X">
    <input type="text" name="coord-y" placeholder="Coodenada Y">
</label>
<br>
    <label>Figura: 
    <select name="figura">
        <option value="circulo" onclick="getShape()">Circulo</option>
        <option value="cuadrado" onclick="getShape()">Cuadrado</option>
        <option value="triangulo" onclick="getShape()">Triangulo</option>
        <option value="pentagono" onclick="getShape()">Pentagono</option>
        <option value="estrella" onclick="getShape()">Estrella</option>

    </select>
</label>
<br>

    <label>Nombre de la figura: <input type="text" name="name"></label>
<br>
    <label>Size: <input type="range" min="10" max="100" value="10" name="size"></label>
    <br>
    <label>Color: 
    <select name="color" onChange="getShape()">
        <option value="black">Negro</option>
        <option value="green">Verde</option>
        <option value="red">Rojo</option>
        <option value="blue">Azul</option>
        <option value="yellow">Amarillo</option>
        <option value="grey">Gris</option>

    </select>
</label>
<input type="submit" value="Crea!">


</form>
<script>
    function getShape(){
     
        if(shape == null){
        console.log("Shape not selected")

    }else{  
        // getShape
        var shape = document.getElementById("figura");
        var value = shape.value;
        var text = shape.options[e.selectedIndex].text;
        console.log(text)

     
    
        
        
       


    var canvasElement = document.querySelector("#myCanvas");
    var context = canvasElement.getContext("2d");
    
    } 

}


    

</script>
</body>
</html>