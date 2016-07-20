<%@ page import="javax.servlet.http.HttpSession" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-sacle=1"/>
		
		
		<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet"/>
		<link href="http://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/readable/bootstrap.min.css" rel="stylesheet"/>
		<link href="http://maxcdn.bootstrapcdn.com/font-awesone/4.6.3/css/font-awesone.min.css" rel="stylesheet"/>
		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet"/>
		
		<title>Curso de JavaEE </title>
		
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"> </script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"> </script>
	</head>
	<body>
		<%
			// String nombreUsuario = request.Parameter("login");
		%>
		<div align="center">
		<h3>Bienvenido <%=session.getAttribute("login")%></h3>
		<a href="usuarios.jsp">Gestión de Usuarios</a> <br>
		<a href="cursos.jsp">Gestión de Cursos</a> <br>
		<a href="logout.jsp">Cerrar Sesión</a><br>
		</div>
	</body>
</html>
