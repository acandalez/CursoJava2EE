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
		<h3>Gestion de Usuarios Bienvenido <%=session.getAttribute("login")%></h3>
		<a href="usuarios.jsp">Gestión de Usuarios</a> <br>
		<a href="cursos.jsp">Gestión de Cursos</a> <br>
		<a href="logout.jsp">Cerrar Sesión</a><br>
		</div>
		
		<div>
			<h3>Alta de usuarios</h3>
			<div align="center">
				<form action="InsertUsuarios" name="alta" method="post">
					<fieldset>
						<legend>Alta de Usuarios</legend>
							<label for="nombreUsuario">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
							<label for="nombre">Nombre&nbsp;</label><input type="text" maxlength="20" name="nombre" required/><p>
							<label for="apellidos">Apellidos&nbsp;</label><input type="text" maxlength="20" name="apellidos" required/><p>
							<label for="correo">Correo electrónico&nbsp;</label><input type="text" maxlength="20" name="correo" required/><p>
							<label for="clave">Clave&nbsp;</label><input type="text" maxlength="20" name="clave" required/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		
		<div>
			<h3>Baja de usuarios</h3>
			<div align="center">
				<form action="Delete" name="baja" method="post">
					<fieldset>
						<legend>Baja de usuarios</legend>
							<label for="nombreUsuario">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
							<label for="clave">Clave&nbsp;</label><input type="text" maxlength="20" name="clave" required/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		
		<div>
			<h3>Modificacion de usuarios</h3>
			<div align="center">
				<form action="Update" name="modifiacion" method="post">
					<fieldset>
						<legend>Modificacion de usuarios</legend>
							<label for="login">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
							<label for="password">Nombre&nbsp;</label><input type="text" maxlength="20" name="nombre" required/><p>
							<label for="password">Apellidos&nbsp;</label><input type="text" maxlength="20" name="apellidos" required/><p>
							<label for="password">Correo electrónico&nbsp;</label><input type="text" maxlength="20" name="correo" required/><p>
							<label for="password">Clave&nbsp;</label><input type="text" maxlength="20" name="clave" required/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
		</div>
		<div>
			<h3>Busqueda de usuarios</h3>
			<div align="center">
				<form action="usuarios.jsp" name="busqueda" method="post">
					<fieldset>
						<legend>Busqueda de usuarios</legend>
							<label for="login">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario"/><p>
							<label for="password">Nombre&nbsp;</label><input type="text" maxlength="20" name="nombre"/><p>
							<label for="password">Apellidos&nbsp;</label><input type="text" maxlength="20" name="apellidos"/><p>
							<label for="password">Correo electrónico&nbsp;</label><input type="text" maxlength="20" name="correo"/><p>
							<label for="password">Clave&nbsp;</label><input type="text" maxlength="20" name="clave"/><p>
							<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
					</fieldset>
				</form>
			</div>
			<br>
			<% 
			
			String nombreUsuario = request.getParameter("nombreUsuario");    
		    String nombre = request.getParameter("nombre");
		    String apellidos = request.getParameter("apellidos");
		    String correo = request.getParameter("correo");
		    String clave = request.getParameter("clave");
		    
        try {
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos", "root", "123456");
			String consulta =("SELECT * FROM usuarios WHERE nombre_usuario LIKE '%"+nombreUsuario+"%' AND nombre LIKE '%"+nombre+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND clave LIKE '%"+clave+"%';");   
			ResultSet rs = null;
	        PreparedStatement pst = null;
	        pst = con.prepareStatement(consulta);
	        rs = pst.executeQuery();
            while(rs.next()) {
            	out.println("<TABLE Border=1 align='center'><TR>");
                out.println("<th>Nombre de Usuario</th><th>&nbsp;Nombre&nbsp;</th><th>&nbsp;Apellidos&nbsp;</th><th>&nbsp;Correo&nbsp;</th><th>&nbsp;Clave&nbsp;</th></TR>");
                out.println("<TR>");
                out.println("<TD>"+rs.getString("nombre_usuario")+"</TD>");
                out.println("<TD>"+rs.getString("nombre")+"</TD>");
                out.println("<TD>"+rs.getString("apellidos")+"</TD>");
                out.println("<TD>"+rs.getString("correo_electronico")+"</TD>");
                out.println("<TD>"+rs.getString("clave")+"</TD>");
                out.println("</TR>"); }; // fin while 
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