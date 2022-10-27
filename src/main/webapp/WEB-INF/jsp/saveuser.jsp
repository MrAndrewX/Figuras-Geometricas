<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="shortcut icon" href="https://solar-energia.net/uploads/cms/geometria/figuras-geometricas-planas.webp?ezimgfmt=rs:350x263/rscb1/ngcb1/notWebP" type="image/x-icon">
    <style>
        body{ 

margin: 0; 

padding: 0; 

font-family: sans-serif; 

background: #34495e; 

} 



.box{ 

width: 300px; 

padding: 40px; 

position: absolute; 

top: 50%; 

left: 50%; 

transform: translate(-50%,-50%); 

background: #191919; 

text-align: center; 

border-radius: 70px; 

user-select: none; 

} 



.box h1{ 

color: white; 

text-transform: uppercase; 

font-weight: 500; 

} 



.box h1:hover{color:#2ecc71} 

.box input[type = "text"], .box input[type = "password"]{ 

border:0; 

background: none; 

display: block; 

margin: 20px auto; 

text-align: center; 

border: 2px solid #3498db; 

padding: 15px 1px; 

width: 200px; 

outline: none; 

color: #3498db; 

border-radius: 24px; 

transition: 0.25s 

} 



.box input::placeholder{color: #3498db88} 

.box input[type = "text"]:focus,.box input[type = "password"]:focus{ 

width: 280px; 

border-color: #2ecc71 

} 



.box input[type = "submit"]{ 

border:0; 

background: none; 

display: block; 

margin: 20px auto; 

text-align: center; 

border: 2px solid #2ecc71; 

padding: 14px 40px; 

outline: none; 

color: #2ecc71; 

border-radius: 24px; 

transition: 0.25s; 

cursor: pointer 

} 



.box input[type = "submit"]:hover{ 

background: #2ecc71; 

color: white 

}
    </style>

</head>
<body>
    
        <form class="box" method="post" action="/login"> 
            <h1>Login</h1> 
              <input type="text" name="user" placeholder="Username"> 
              <input type="submit" name="" value="Login"> 
          </form> 


</body>
</html>