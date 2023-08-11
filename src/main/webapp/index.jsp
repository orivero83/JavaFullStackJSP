<%@page import="SourcePackages.EstructuraDeDatosMySQL"%>
<%@page import="SourcePackages.Dao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mensajes</title>
     <!-- CSS -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- BootStrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


<style>

/* Reset some default styles */
body, h1, h3, p {
    margin: 0;
    padding: 0;
}

/* Apply a background color to the body */
body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
}

/* Center the form container vertically and horizontally */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* Style the message input section */
.mb-3 {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin-bottom: 20px;
    width: 100%;
    max-width: 300px;
    box-sizing: border-box;
}

.mb-3 h1 {
    font-size: 24px;
    margin-bottom: 10px;
}

.mb-3 textarea,
.mb-3 input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
}

/* Style the submit button */
button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

/* Style the message display section */
.message {
    background-color: #ffffff;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    margin-bottom: 20px;
}

.message h1 {
    font-size: 20px;
    margin-bottom: 5px;
}

.message h3 {
    font-size: 16px;
    margin-bottom: 10px;
}

.message cite {
    font-size: 14px;
    color: #777;
}

/* Media query for responsiveness */
@media (max-width: 600px) {
    .mb-3 {
        max-width: 100%;
    }
}


</style>




</head>
<body>
<div class="container">

    <form action="index.jsp" method="POST">
      <div class="mb-3">
        <h1>Ingrese un Mensaje</h1>
        <textarea type="text" name="mensaje"></textarea>
      </div>

      <div class="mb-3">
        <h1>Autor</h1>
        <input type="text" name="autor">
      </div>

      <button type="submit" name="enviar">Enviar</button>

<%
Dao dao = new Dao();

if (request.getParameter("enviar") != null ) {
EstructuraDeDatosMySQL mensaje = new EstructuraDeDatosMySQL(
request.getParameter("mensaje"),
request.getParameter("autor")
);
dao.insertar(mensaje);
}

%>

<%
 /* Dao dao = new Dao();  */
 List<EstructuraDeDatosMySQL> mensajes = dao.seleccionar();
 Collections.reverse(mensajes);

 for (EstructuraDeDatosMySQL mensaje: mensajes) {
%>

        <div class="mb-3">
            <h1><%=mensaje.getAutor()%></h1>
            <h3><%=mensaje.getMensaje()%></h3>
            <cite><%=mensaje.getFecha()%></cite>
            <a href="editar.jsp?id=<%=mensaje.getId()%>&&mensaje=<%=mensaje.getMensaje()%>&&autor=<%=mensaje.getAutor()%>" class="link">Editar</a>
            <a href="eliminar.jsp?id=<%=mensaje.getId()%>" class="link">Eliminar</a>
        </div>
<%}%>
    </form>


</div>
</body>
</html>