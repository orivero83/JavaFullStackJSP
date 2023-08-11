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
</head>
<body>

<%
String id = request.getParameter("id");
EstructuraDeDatosMySQL mensaje = new EstructuraDeDatosMySQL(Integer.valueOf(id));
Dao dao = new Dao();
dao.eliminar(mensaje);
request.getRequestDispatcher("index.jsp").forward(request, response);
%>

</body>
</html>