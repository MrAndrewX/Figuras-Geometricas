<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de figuras</title>
    <link rel="shortcut icon" href="https://solar-energia.net/uploads/cms/geometria/figuras-geometricas-planas.webp?ezimgfmt=rs:350x263/rscb1/ngcb1/notWebP" type="image/x-icon">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fuzzy+Bubbles&display=swap');
*{
    font-family: 'Fuzzy Bubbles', cursive;
}
        table {
    
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
input{
    margin: 5px;
}
    </style>
</head>
<body>
    <nav>
        <a href="/crearfigura">Crear figura</a>
        <a href="/figuras">Figuras</a>
    </nav>
   <h1>Lista de figuras</h1>
   <table>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Nombre de la figura</th>
        <th>Tipo de figura</th>
        <th>Coord-X</th>
        <th>Coord-Y</th>
        <th>Tamano</th>
        <th>Color</th>
        <th>Fecha Creacion</th>
        <th>Visualizar</th>
        
    </tr>
    <c:forEach var="figura" items="${figuras}">
        <tr>
            <td><c:out value="${figura.id}" /></td>
            <td><c:out value="${figura.getUser().getId()}" /></td>
            <td><c:out value="${figura.nombreFigura}" /></td>
            <td><c:out value="${figura.tipofigura}" /></td>
            <td><c:out value="${figura.x}" /></td>
            <td><c:out value="${figura.y}" /></td>       
            <td><c:out value="${figura.tamano}" /></td>
            <td><c:out value="${figura.color}" /></td>
            <td><c:out value="${figura.dateCreacion}" /></td>
            <td>
                
                <form action="/verfigura" method="POST" target="/verfigura">
                    <input type="hidden" name="idfigura" value="${figura.id}">
                    <input type="submit" value="Ver">
                </form>
                
                <input type="button" value="Borrar">
            </td>
        </tr>
    </c:forEach>
    
   </table> 
</body>
</html>