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
    <title>Crear Figura</title>
    <link rel="shortcut icon" href="https://solar-energia.net/uploads/cms/geometria/figuras-geometricas-planas.webp?ezimgfmt=rs:350x263/rscb1/ngcb1/notWebP" type="image/x-icon">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Fuzzy+Bubbles&display=swap');
    *{
    font-family: 'Fuzzy Bubbles', cursive;
}
</style>

</head>
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
<body style="background-image: url(https://static.vecteezy.com/system/resources/previews/000/694/622/large_2x/pink-and-blue-geometric-polygonal-background-vector.jpg);">
<h1 class="text-center">Crear figura</h1>
<div class="container ">
    <div class="row">
        <div class="col-sm text-center">
<p>Bienvenido ${username}, ya puedes crear tu figura</p>
<canvas id="myCanvas" width="1024px" height="768px" style="border:1px solid #000000; background-color: white">
</canvas>
</div>
<div class="col-sm text-center" style="background-color: white; border-radius: 5px; border: 1px solid black;">
<form action="/crearfigura" method="post">
    <label> Coordenadas:
    <input type="number" name="coord-x" id="coord-x" placeholder="Coodenada X" required>
    <input type="number" name="coord-y" id="coord-y" placeholder="Coodenada Y" required>
    <input type="button" value="Set" onclick="getCoords()" >
</label>
<br>
    <label>Figura: 
    <select name="figura" id="selectfigure" onChange="getShape()" required>
        <option disabled selected value> -- Selecciona una figura -- </option>
        <option value="circulo">Circulo</option>
        <option value="cuadrado">Cuadrado</option>
        <option value="triangulo">Triangulo</option>
        <option value="pentagono">Pentagono</option>
        <option value="estrella">Estrella</option>

    </select>
</label>
<br>

    <label>Nombre de la figura: <input type="text" name="figuraname"></label>
<br>

    
   
    <br>
    <label>Color: 
    <select name="color" id="color" onchange="getColor()" required>
        <option disabled selected value> -- Selecciona un color -- </option>
        <option value="black">Negro</option>
        <option value="green">Verde</option>
        <option value="red">Rojo</option>
        <option value="blue">Azul</option>
        <option value="yellow">Amarillo</option>
        <option value="grey">Gris</option>

    </select>
    <label>Size: <input type="range" min="10" max="1000" value="10" name="size" id="size" onchange="sizemod()" oninput="sizemod()" required></label>
</label>
<input type="button" value="Visualiza" onclick="visualiza()">
<input type="submit" value="Crea!">



</form>
</div>
    </div>
</div>
<script>
var canvas = document.getElementById("myCanvas");
var context = canvas.getContext("2d");
// Captura coordenadas del cursor
function getCursorPosition(canvas, event) {
            const rect = canvas.getBoundingClientRect()
            const coordx = event.clientX - rect.left
            const coordy = event.clientY - rect.top
            document.getElementById("coord-x").value = Math.trunc(coordx);
            document.getElementById("coord-y").value = Math.trunc(coordy);
            
        }

        
        canvas.addEventListener('mousedown', function(e) {
        getCursorPosition(canvas, e)
        });

    function sizemod(){
        
        var size = document.getElementById("size").value
        console.log("size: " + size)
        
        getShape(size);
    
    }
    function visualiza(){
        var size = document.getElementById("size").value
        getShape(size);
    }
    function getColor(){
        
        var argumentcolor = "";
        var color = document.getElementById("color");
        var value = color.value;
        var textcolor = color.options[color.selectedIndex].text;
        switch(textcolor){
            case "Negro" : argumentcolor = "black"; break;
            case "Verde" : argumentcolor = "green"; break;
            case "Rojo" : argumentcolor = "red"; break;
            case "Azul" : argumentcolor = "blue";break;
            case "Amarillo" : argumentcolor = "yellow";break;
            case "Gris" : argumentcolor = "grey";break;

        }
        console.log(argumentcolor);
        return argumentcolor;
        
    }
    //Get Coordinates
    function getCoords(){
        
        var coordX = document.getElementById("coord-x").value
        var coordY = document.getElementById("coord-y").value
        var coordxy = [coordX,coordY]
        console.log("Coords set for X: " + coordX + " Y: "+coordY);
        return coordxy;
        
    }
    function clearCanvas(){
        context.clearRect(0, 0, canvas.width, canvas.height)
    }

    //Get shape
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
        }else if(text == "Estrella"){
        
            drawStar(size);
     }
    }
    function drawSquare(size){
        var coordxy = getCoords();
        let coordx = coordxy[0];
        let coordy = coordxy[1];
        clearCanvas()
        console.log("In square" + coordx +" "+ coordy)
        
        context.beginPath();
        
        context.rect(coordx-(size/2), coordy-(size/2), size, size);
        context.fillStyle = String(getColor());
        context.fill();
        context.stroke();
    }

    function drawCircle(size){
        var coordxy = getCoords();
        let coordx = coordxy[0];
        let coordy = coordxy[1];
        clearCanvas()
        console.log("In Circle" + coordx +" "+ coordy)
        
        context.beginPath();
        
        context.arc(coordx, coordy, size, 0, 2 * Math.PI);
        context.fillStyle = String(getColor());
        context.fill();
        context.stroke();
    }

    function drawPentagon(size){
        var coordxy = getCoords();
        let coordx = coordxy[0];
        let coordy = coordxy[1];
        clearCanvas();
        console.log("In Pentagon" + coordx +" "+ coordy)
        
        var numberOfSides = 5,
        
       
        step  = 2 * Math.PI / numberOfSides,//Precalculate step value
        shift = (Math.PI / 180.0) * -18;//Quick fix ;)

    context.beginPath();
    //cxt.moveTo (Xcenter +  size * Math.cos(0), Ycenter +  size *  Math.sin(0));          

    for (var i = 0; i <= numberOfSides;i++) {
    	var curStep = i * step + shift;
        context.lineTo (Number(coordx) + size * Math.cos(curStep), Number(coordy) + size * Math.sin(curStep));
    }

    context.fillStyle = String(getColor());
        context.fill();
   
    context.stroke();

    }


    function drawTriangle(size){
        var coordxy = getCoords();
        let coordx = Number(coordxy[0]);
        let coordy = Number(coordxy[1]);
        clearCanvas();
        console.log("In Triangle" + coordx +" "+ coordy)


        var center = ((Math.sqrt(3)*size)/2) / 2;

        context.beginPath();
        context.moveTo(coordx, coordy + center);
        context.lineTo(coordx + (size / 2), (coordy - center));
        context.lineTo(coordx - size / 2, coordy - center);
        context.lineTo(coordx, coordy + center);
        context.fillStyle = String(getColor());
        context.fill();
        
        context.stroke();

      
    }
    function drawStar(size){
        
    // define the star
    var coordxy = getCoords();
        let coordx = Number(coordxy[0]);
        let coordy = Number(coordxy[1]);
        clearCanvas();
        console.log("In star" + coordx +" "+ coordy)


    context.beginPath();
    context.moveTo(coordx, coordy+size);
    for (var i=0; i < 2*7+1; i++) {
        var r = (i%2 == 0)? size : size/2;
        var a = Math.PI * i/7;
        context.lineTo(coordx + r*Math.sin(a), coordy + r*Math.cos(a));
    };
    context.closePath();
    // draw
    context.fillStyle=String(getColor());
    context.fill();
    context.stroke()
}
    
   
    



    

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>