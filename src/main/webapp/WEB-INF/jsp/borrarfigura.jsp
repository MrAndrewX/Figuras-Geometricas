<%@ page isELIgnored="false" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrar figura</title>
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
                <form class="d-flex justify-content-between bd-highlight mb-2" action="/misfiguras" method="post">
                    <input class="form-control me-2" type="search" placeholder="Nombre de la figura" aria-label="Search" name="figurabuscada">
                    <button class="btn btn-outline-success" type="submit">buscar</button>
                  </form>
            </div>
        </div>
    </nav>
<h1 style="color:white;">Figura borrada correctamente</h1>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>