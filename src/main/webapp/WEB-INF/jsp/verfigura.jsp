<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver figura</title>
        <link rel="shortcut icon" href="https://solar-energia.net/uploads/cms/geometria/figuras-geometricas-planas.webp?ezimgfmt=rs:350x263/rscb1/ngcb1/notWebP" type="image/x-icon">

    
    </head>
<body>
    <h1>Ver figura</h1>
    <p>Visualizando figura ${id}</p>
    <canvas id="myCanvas" width="1024px" height="768px" style="border:1px solid #000000;">
    </canvas>
    <script>
    function getShape(size){
     
     var shape = document.getElementById("selectfigure");
     var value = shape.value;
     var text = shape.options[shape.selectedIndex].text;

     if(text == "Triangulo"){
         
         drawTriangle(size); // Por hacer
     }else if(text == "Cuadrado"){
         drawSquare(size);
     }else if(text == "Circulo"){
         drawCircle(size);
     }else if(text == "Pentagono"){
         drawPentagon(size);
     }
 }
    </script>
</body>
</html>