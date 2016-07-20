<%@ page import="org.academy.controllers.*" %>
<%@ page import="java.sql.*" import="java.io.*" import="java.util.*" import="java.net.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-sacle=1"/>
		
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet"/>
		<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/readable/bootstrap.min.css" rel="stylesheet"/>
		<link href="https://maxcdn.bootstrapcdn.com/font-awesone/4.6.3/css/font-awesone.min.css" rel="stylesheet"/>
		<title>Curso de JavaEE </title>
		
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"> </script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"> </script>
	</head>
	<body>
		
		<div align="center">
		<h3>Gestion de Cursos Bienvenido <%=session.getAttribute("login")%></h3>
		<a href="usuarios.jsp">Gestión de Usuarios</a> <br>
		<a href="cursos.jsp">Gestión de Cursos</a> <br>
		<a href="logout.jsp">Cerrar Sesión</a><br>
		</div>
		
		<div>
		<h3>Alta de cursos</h3>
			<div align="center">
				<form action="InputCursos" name="alta" method="post">
					<fieldset>
						
							<label for="nombre">Nombre Del Curso &nbsp;</label><input type="text" maxlength="20" name="nombre"/><p>
							<label for="descripcion">Descripción&nbsp;</label><input type="text" maxlength="20" name="descripcion"/><p>
							<label for="fechaInicio">Fecha de Inicio&nbsp;</label><input type="date" maxlength="20" name="fechaInicio"/><p>
							<label for="fechaFin">Fecha de Fin&nbsp;</label><input type="text" maxlength="20" name="fechaFin"/><p>
							<label for="numeroHoras">Numero de Horas&nbsp;</label><input type="number" name="numeroHoras"/><p>
							<label for="objetivos">Objetivos&nbsp;</label><input type="text" maxlength="20" name="objetivos"/><p>
							<label for="requisitos">Requisitos&nbsp;</label><input type="text" maxlength="20" name="requisitos"/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		
		<div>
			<h3>Baja de cursos</h3>
			<div align="center">
				<form action="DeleteCursos" name="baja" method="post">
					<fieldset>
						
							<label for="id">Id Del Curso &nbsp;</label><input type="number"name="id"/><p>
							<label for="nombre">Nombre Del Curso &nbsp;</label><input type="text" maxlength="20" name="nombre" required/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		
		<div>
			<h3>Modificacion de cursos</h3>
			<div align="center">
				<form action="UpdateCursos" name="modifiacion" method="post">
					<fieldset>
						
							<label for="id">Id Del Curso &nbsp;</label><input type="text" maxlength="20" name="id"/><p>
							<label for="nombre">Nombre Del Curso &nbsp;</label><input type="text" maxlength="20" name="nombre"/><p>
							<label for="descripcion">Descripción&nbsp;</label><input type="text" maxlength="20" name="descripcion"/><p>
							<label for="fechaInicio">Fecha de Inicio&nbsp;</label><input type="date" maxlength="20" name="fechaInicio"/><p>
							<label for="fechaFin">Fecha de Fin&nbsp;</label><input type="text" maxlength="20" name="fechaFin"/><p>
							<label for="numeroHoras">Numero de Horas&nbsp;</label><input type="number" name="numeroHoras"/><p>
							<label for="objetivos">Objetivos&nbsp;</label><input type="text" maxlength="20" name="objetivos"/><p>
							<label for="requisitos">Requisitos&nbsp;</label><input type="text" maxlength="20" name="requisitos"/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		<div>
			<h3>Busqueda de cursos</h3>
			<div align="center">
				<form action="cursos.jsp" name="busqueda" method="post">
					<fieldset>
						
							<label for="nombre">Nombre Del Curso &nbsp;</label><input type="text" maxlength="20" name="nombre"/><p>
							<label for="descripcion">Descripción&nbsp;</label><input type="text" maxlength="20" name="descripcion"/><p>
							<label for="fechaInicio">Fecha de Inicio&nbsp;</label><input type="date" maxlength="20" name="fechaInicio"/><p>
							<label for="fechaFin">Fecha de Fin&nbsp;</label><input type="text" maxlength="20" name="fechaFin"/><p>
							<label for="numeroHoras">Numero de Horas&nbsp;</label><input type="textr" name="numeroHoras"/><p>
							<label for="objetivos">Objetivos&nbsp;</label><input type="text" maxlength="20" name="objetivos"/><p>
							<label for="requisitos">Requisitos&nbsp;</label><input type="text" maxlength="20" name="requisitos"/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
			<br>
			<% 
			String nombre = request.getParameter("nombre");    
		    String descripcion = request.getParameter("descripcion");
		    String fechaInicio = request.getParameter("fechaInicio");
		    String fechaFin = request.getParameter("fechaFin");
		    String numeroHoras = request.getParameter("numeroHoras");
		    String objetivos = request.getParameter("objetivos");
		    String requisitos = request.getParameter("requisitos");
		    
        try {
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos", "root", "123456");
			String consulta =("SELECT * FROM cursos WHERE nombre LIKE '%"+nombre+"%' AND descripcion LIKE '%"+descripcion+"%' AND fecha_inicio LIKE '%"+fechaInicio+"%' AND fecha_fin LIKE '%"+fechaFin+"%' AND numero_horas LIKE '%"+numeroHoras+"%' AND objetivos LIKE '%"+objetivos+"%' AND requisitos LIKE '%"+requisitos+"%';");   
			ResultSet rs = null;
	        PreparedStatement pst = null;
	        pst = con.prepareStatement(consulta);
	        rs = pst.executeQuery();
            while(rs.next()) {
            	out.println("<TABLE Border=1 align='center'><TR>");
                out.println("<th>&nbsp;Nombre&nbsp;</th><th>&nbsp;Descripción&nbsp;</th><th>&nbsp;Fecha de inicio&nbsp;</th><th>&nbsp;Fecha de Fin&nbsp;</th><th>&nbsp;Numero de Horas&nbsp;</th><th>&nbsp;Objetivos&nbsp;</th><th>&nbsp;Requisitos&nbsp;</th></TR>");
                out.println("<TR>");
                out.println("<TD>"+rs.getString("nombre")+"</TD>");
                out.println("<TD>"+rs.getString("descripcion")+"</TD>");
                out.println("<TD>"+rs.getString("fecha_inicio")+"</TD>");
                out.println("<TD>"+rs.getString("fecha_fin")+"</TD>");
                out.println("<TD>"+rs.getString("numero_horas")+"</TD>");
                out.println("<TD>"+rs.getString("objetivos")+"</TD>");
                out.println("<TD>"+rs.getString("requisitos")+"</TD>");
                out.println("</TR>"); };
            	out.println("</TABLE>");
            } 
            catch(SQLException e) {
            	
            };
            %>
			<br>
			<br>
		</div>
	</body>
</html>