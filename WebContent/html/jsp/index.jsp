<%@ page  import="javax.servlet.http.HttpSession, java.util.Properties" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<title>Práctica login Password </title>
		
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"> </script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"> </script>
	</head>
	<body>
			<div align="center">
			<form action="log" name="formulario" method="post">
				<fieldset>
					<legend>Acceso usuarios registrados</legend>
						<label for="user">Login &nbsp;</label><input type="text" name="user" required/><p>
						<label for="pass">Password&nbsp;</label><input type="password" name="pass" required/><p>
						<label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
				</fieldset>
			</form>
			</div>
			
	</body>
</html>