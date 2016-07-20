<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Properties" import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAS Training Project - Inicio</title>
</head>
<body style="margin= auto, 0;"">
<!-- Pagina de Inicio -->
<form action="Login" method="post">
		<fieldset style="width: 300px">
			<legend> Acceso Alumnos </legend>
			<table>
				<tr>
					<td>Usuario</td>
					<td><input type="text" name="user" required="required" /></td>
				</tr>
				<tr>
					<td>Contraseña</td>
					<td><input type="password" name="password" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Acceder" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>