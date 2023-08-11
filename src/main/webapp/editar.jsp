<%@page import="SourcePackages.EstructuraDeDatosMySQL"%>
<%@page import="SourcePackages.Dao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Mensajes</title>

    <!-- Bootstrap CDN -->
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

        /* Style the form section */
        .form-section {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }

        .form-section h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .form-section textarea,
        .form-section input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        /* Style the buttons */
        .form-section button[type="submit"],
        .form-section a {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .form-section button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            margin-right: 10px;
        }

        .form-section a {
            background-color: #ccc;
            color: #333;
        }

        .form-section button[type="submit"]:hover,
        .form-section a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="editar.jsp" method="POST" class="form-section">
        <input type="hidden" name="id" value="<%=request.getParameter("id")%>">

        <h1>Editar Mensaje</h1>
        <textarea name="mensaje" rows="4"><%=request.getParameter("mensaje")%></textarea>

        <h1>Autor</h1>
        <input type="text" name="autor" value="<%=request.getParameter("autor")%>">

        <button type="submit" name="enviar">Guardar Cambios</button>
        <a href="index.jsp">Regresar</a>
    </form>
</div>
<%
Dao dao = new Dao();

String id = request.getParameter("id");

if (request.getParameter("enviar") != null ) {
EstructuraDeDatosMySQL mensaje = new EstructuraDeDatosMySQL(
Integer.parseInt(id.trim()),
request.getParameter("mensaje"),
request.getParameter("autor")
);
dao.editar(mensaje);
}

%>
</body>
</html>
