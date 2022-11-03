<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
             <!-- Required meta tags -->
       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
   
       <!-- Bootstrap CSS -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver figura</title>
        <link rel="shortcut icon" href="https://solar-energia.net/uploads/cms/geometria/figuras-geometricas-planas.webp?ezimgfmt=rs:350x263/rscb1/ngcb1/notWebP" type="image/x-icon">
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Fuzzy+Bubbles&display=swap');
*{
    font-family: 'Fuzzy Bubbles', cursive;
}
        </style>
    
    </head>
    <body style="background-image: url(https://static.vecteezy.com/system/resources/previews/000/694/622/large_2x/pink-and-blue-geometric-polygonal-background-vector.jpg);">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="mx-auto d-sm-flex d-block flex-sm-nowrap">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample11" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse text-center" id="navbarsExample11">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/crearfigura">Crear figura</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/figuras">Figuras</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/misfiguras">Mis figuras</a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>
    <div class="text-center">
    <h1>Ver figura</h1>
    <p>Visualizando figura ${nombrefigura}</p>
    <canvas id="myCanvas" width="1024px" height="768px" style="border:1px solid #000000; background-color: white;">
    </canvas>
</div>

    <input type="hidden" name="tipofigura" id="tipofigura" value="${tipofigura}">
    <input type="hidden" name="nombrefigura" id="nombrefigura" value="${nombreFigura}">
    <input type="hidden" name="coord-x" id="coord-x" value="${coordx}">
    <input type="hidden" name="coord-y" id="coord-y" value="${coordy}">
    <input type="hidden" name="tamano" id="tamano" value="${tamano}">
    <input type="hidden" name="color" id="color" value="${color}">

    <script>
        var canvas = document.getElementById("myCanvas");
        var context = canvas.getContext("2d");

        
    
    function getColor(){
        
        
        
        return color;
    }

    

    function getShape(size){
     
     
     var text = document.getElementById("tipofigura").value
     
     console.log(text)

     if(text == "triangulo"){
         
         drawTriangle(size); // Por hacer
     }else if(text == "cuadrado"){
         drawSquare(size);
     }else if(text == "circulo"){
         drawCircle(size);
     }else if(text == "pentagono"){
         drawPentagon(size);
     }else if(text == "estrella"){
         drawStar(size);
     }
 }
 function drawSquare(){
        let size = document.getElementById("tamano").value
        let coordx = Number(document.getElementById("coord-x").value)
        let coordy = Number(document.getElementById("coord-y").value)
        console.log("In square" + coordx +" "+ coordy + " " +size + " " + document.getElementById("color"))
        
        context.beginPath();
        
        context.rect(coordx-(size/2), coordy-(size/2), size, size)
        context.fillStyle = String(document.getElementById("color").value)
        context.fill();
        context.stroke();
    }

    function drawCircle(){
        let size = document.getElementById("tamano").value
        let coordx = Number(document.getElementById("coord-x").value)
        let coordy = Number(document.getElementById("coord-y").value)
        console.log("In Circle" + coordx +" "+ coordy)
        
        context.beginPath();
        
        context.arc(coordx, coordy, size, 0, 2 * Math.PI);
        context.fillStyle = String(document.getElementById("color").value)
        context.fill();
        context.stroke();
    }

    function drawPentagon(){
        let size = document.getElementById("tamano").value
        let coordx = Number(document.getElementById("coord-x").value)
        let coordy = Number(document.getElementById("coord-y").value)
        var numberOfSides = 5,
        
       
        step  = 2 * Math.PI / numberOfSides,//Precalculate step value
        shift = (Math.PI / 180.0) * -18;//Quick fix ;)

    context.beginPath();
    //cxt.moveTo (Xcenter +  size * Math.cos(0), Ycenter +  size *  Math.sin(0));          

    for (var i = 0; i <= numberOfSides;i++) {
    	var curStep = i * step + shift;
        context.lineTo (Number(coordx) + size * Math.cos(curStep), Number(coordy) + size * Math.sin(curStep));
    }

    context.fillStyle = String(document.getElementById("color").value)
        context.fill();
   
    context.stroke();

    }


    function drawTriangle(){
        let size = document.getElementById("tamano").value
        let coordx = Number(document.getElementById("coord-x").value)
        let coordy = Number(document.getElementById("coord-y").value)
        



        var center = ((Math.sqrt(3)*size)/2) / 2;

        context.beginPath();
        context.moveTo(coordx, coordy + center);
        context.lineTo(coordx + (size / 2), (coordy - center));
        context.lineTo(coordx - size / 2, coordy - center);
        context.lineTo(coordx, coordy + center);
        context.fillStyle = String(document.getElementById("color").value)
        context.fill();
        
        context.stroke();

      
    }
    function drawStar(){
        
        let size = document.getElementById("tamano").value
        let coordx = Number(document.getElementById("coord-x").value)
        let coordy = Number(document.getElementById("coord-y").value)
        
    
        context.beginPath();
        context.moveTo(coordx, coordy+size);
        for (var i=0; i < 2*7+1; i++) {
            var r = (i%2 == 0)? size : size/2;
            var a = Math.PI * i/7;
            context.lineTo(coordx + r*Math.sin(a), coordy + r*Math.cos(a));
        };
        context.closePath();
        // draw
        context.fillStyle=String(document.getElementById("color").value);
        context.fill();
        context.stroke()
    }
   
    window.onload = getShape();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>