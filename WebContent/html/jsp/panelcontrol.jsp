<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Panel de Control - Pencil Academy</title>
<meta charset="utf-8 ">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/4392e38f59.js"></script>

</head>
<body>

	<div class="container-fluid" style="padding-top: 30px;">
		<h2>
			<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;Panel
			de control
		</h2>
		<ul class="nav nav-tabs" style="padding-top: 30px;">
			<li class="active"><a data-toggle="tab" href="#home"><span
					class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;Inicio</a></li>

			<li role="presentation" class="dropdown"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false"><i
					class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;Gestion de
					Alumnos <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#altauser" data-toggle="tab">Altas</a></li>
					<li><a href="#bajauser" id="btnBajaUser" data-toggle="tab">Bajas</a></li>
					<li><a href="#updateuser" id="btnUpdateUser" data-toggle="tab">Editar Perfil
							del Alumno</a></li>
					<li><a href="#finduser" data-toggle="tab">Buscar Ficha del
							Alumno</a></li>
				</ul></li>
			<li role="presentation" class="dropdown"><a
				class="dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false"><span
					class="glyphicon glyphicon-apple" aria-hidden="true"></span>&nbsp;&nbsp;Gestion
					de Cursos <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a data-toggle="tab" href="#altacursos">Altas</a></li>
					<li><a data-toggle="tab" href="#menu2">Bajas</a></li>
					<li><a data-toggle="tab" href="#menu3">Editar Cursos</a></li>
					<li><a data-toggle="tab" href="#findcurso">Buscar Cursos</a></li>
				</ul></li>
			<li><a data-toggle="tab" href="#menu2"><i
					class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;Cerrar
					Sesión</a></li>

		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<div align="center">
					<h3>
						Hola
						<%=session.getAttribute("user")%></h3>
					<a href="usuarios.jsp">Gestión de Usuarios</a> <br> <a
						href="cursos.jsp">Gestión de Cursos</a> <br> <a
						href="logout.jsp">Cerrar Sesión</a><br>
				</div>
			</div>
			<!-- Panel de Usuarios -->
			<div id="altauser" class="tab-pane fade">

				<form role="form"
					action="${pageContext.request.contextPath}/InsertUsuarios"
					name="alta" method="post" style="padding-top: 30px;"
					class="form-horizontal">
					<fieldset>
						<legend>Alta de Usuarios</legend>
						<div class="form-group">

							<label for="user">Nombre de Usuario: &nbsp;</label><input
								placeholder="Nombre de Usuario" class="form-control" type="text"
								name="user" />
							<p>
						</div>
						<div class="form-group ">
							<label for="nombre">Nombre:&nbsp;</label><input
								placeholder="Nombre" class="form-control" type="text"
								name="nombre" />
							<p>
						</div>
						<div class="form-group">
							<label for="apellidos">Apellidos:&nbsp;</label><input
								placeholder="Apellidos" class="form-control" type="text"
								name="apellidos" />
							<p>
						</div>
						<div class="form-group">
							<label for="correo">Email:&nbsp;</label><input
								placeholder="Email" class="form-control" type="email"
								name="correo" />
							<p>
						</div>
						<div class="row">
							<div class="form-group col-xs-6">
								<label for="pass">Clave&nbsp;</label><input class="form-control"
									type="text" name="pass" />
								<p>
							</div>
							<div class="form-group col-xs-6">
								<label>Seleccione Tipo de Usuario</label> <select id="rol"
									name="rol" class="form-control">
									<option value="Administrador">Administrador</option>
									<option value="Alumno">Alumno</option>
									<option value="Profesor">Profesor</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="enviar"><input class="btn btn-default"
								type="submit" value="Enviar" name="enviar" /></label>
						</div>
					</fieldset>
				</form>
			</div>
			<div id="bajauser" class="tab-pane fade">
				<div class="col-md-8"  style="padding-top: 30px;">
					
					<form 
					name="baja" method="post" style="padding-top: 30px;">
					<fieldset>
						
						<div class="form-group">
							<label for="user">Nombre Usuario &nbsp;</label><input
								class="form-control" type="text" name="user" required />
							<p>
						</div>
						<div class="form-group">
							<label for="id">ID&nbsp;</label><input class="form-control"
								type="text" name="id" required />
							<p>
						</div>
						<div class="form-group">
							<label for="enviar">
							<button type="button" class="btn btn-default" id="delete">Enviar</button>
							<!-- <input class="btn btn-default"
								type="submit" value="Enviar" name="enviar" /> --></label>
						</div>
					</fieldset>
				</form> 
				<form>
						<fieldset>
							
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>&nbsp;ID&nbsp;</th>
											<th>&nbsp;Usuario&nbsp;</th>
											<th>&nbsp;Nombre&nbsp;</th>
											<th>&nbsp;Apellidos&nbsp;</th>
											<th>&nbsp;Correo electrónico&nbsp;</th>
											<th>&nbsp;Pass&nbsp;</th>
											<th>&nbsp;Rol&nbsp;</th>
										</tr>
									</thead>
									<tbody id="datosUserDelete"></tbody>
									
								</table>
							</fieldset>
					</form>
					</div>
			
			 	
			</div>
			<div id="updateuser" class="tab-pane fade">
				<div class="col-md-8"  style="padding-top: 30px;">
				<form action="${pageContext.request.contextPath}/UpdateUsuarios"
					name="modifiacion" method="post" style="padding-top: 30px;">
					<fieldset>
						<legend>Editar perfil de usuario</legend>
						<div class="form-group">
							<label for="user">Nombre Usuario &nbsp;</label><input
								class="form-control" type="text" name="user" />
							<p>
						</div>
						<div class="form-group">
							<label for="nombre">Nombre&nbsp;</label><input
								class="form-control" type="text" name="nombre" />
							<p>
						</div>
						<div class="form-group">
							<label for="apellidos">Apellidos&nbsp;</label><input
								class="form-control" type="text" name="apellidos" />
							<p>
						</div>
						<div class="form-group">
							<label for="password">Correo electrónico&nbsp;</label><input
								class="form-control" type="email" name="correo" />
							<p>
						</div>
						<div class="row">
							<div class="form-group col-xs-6">
								<label for="pass">Clave&nbsp;</label><input class="form-control"
									type="text" name="pass" />
								<p>
							</div>
							<div class="form-group col-xs-6">
								<label>Seleccione Tipo de Usuario</label> <select id="rol"
									name="rol" class="form-control">
									<option value="Administrador">Administrador</option>
									<option value="Alumno">Alumno</option>
									<option value="Profesor">Profesor</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="enviar"><input class="btn btn-default"
								type="submit" value="Enviar" name="enviar" /></label>
						</div>
					</fieldset>
				</form>
				<form>
						<fieldset>
							
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>&nbsp;ID&nbsp;</th>
											<th>&nbsp;Usuario&nbsp;</th>
											<th>&nbsp;Nombre&nbsp;</th>
											<th>&nbsp;Apellidos&nbsp;</th>
											<th>&nbsp;Correo electrónico&nbsp;</th>
											<th>&nbsp;Pass&nbsp;</th>
											<th>&nbsp;Rol&nbsp;</th>
										</tr>
									</thead>
									<tbody id="datosUserUpdate"></tbody>
								</table>
							</fieldset>
					</form>
			</div></div>
			<div id="finduser" class="tab-pane fade">
				<div class="row">
					<div class="col-md-8" >
						<form name="busqueda" method="post" style="padding-top: 30px;">
							<fieldset>
								<legend>Busqueda de usuarios</legend>
								<div class="row">
								<div class="form-group col-xs-4">
									<label for="user">Nombre Usuario &nbsp;</label><input
										class="form-control" type="text" name="user" id="user" />
									<p>
								</div>
								<div class="form-group col-xs-4">
									<label for="nombre">Nombre&nbsp;</label><input
										class="form-control" type="text" name="nombre" id="nombre" />
									<p>
								</div>
								<div class="form-group col-xs-4">
									<label for="apellidos">Apellidos&nbsp;</label><input
										class="form-control" type="text" name="apellidos" id="apellidos"/>
									<p>
								</div>
								<div class="form-group col-xs-4">
									<label for="correo">Correo electrónico&nbsp;</label><input
										class="form-control" type="email" name="correo" id="correo"/>
									<p>
								</div>

								
									<div class="form-group col-xs-4">
										<label for="pass">Clave&nbsp;</label><input
											class="form-control" type="text" name="pass" id="pass"/>
										<p>
									</div>
									<div class="form-group col-xs-4">
										<label>Tipo de Usuario</label> <select 
											name="rol" class="form-control" id="rolfind">
											<option value= "-1" selected>Seleccione Rol</option>
											<option value="Administrador">Administrador</option>
											<option value="Alumno">Alumno</option>
											<option value="Profesor">Profesor</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="enviar"> <!-- 								<input class="btn btn-default"
									type="button" value="Enviar" name="enviar" /> -->
										<button type="button" class="btn btn-default" id="find">Enviar</button>
									</label>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="col-md-8"  style="padding-top: 30px;">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>&nbsp;ID&nbsp;</th>
									<th>&nbsp;Usuario&nbsp;</th>
									<th>&nbsp;Nombre&nbsp;</th>
									<th>&nbsp;Apellidos&nbsp;</th>
									<th>&nbsp;Correo electrónico&nbsp;</th>
									<th>&nbsp;Pass&nbsp;</th>
									<th>&nbsp;Rol&nbsp;</th>
								</tr>
							</thead>
							<tbody id="datosUser"></tbody>
						</table>
					</div>


				</div>
			</div>
				<!--Panel de Cursos -->
				<div id="altacursos" class="tab-pane fade">

					<form role="form"
						action="${pageContext.request.contextPath}/InsertCursos" 
						name="alta" method="post">
						<fieldset>
							<legend>Alta de Cursos</legend>
							<div class="form-group">
								<label for="nombre">Nombre del Curso &nbsp;</label><input
									class="form-control" type="text" name="nombre" />
							</div>
							<div class="form-group">
								<label for="descripcion">Descripción</label>
								<textarea class="form-control" rows="3" name="descripcion"></textarea>
							</div>
							<div class="form-group">
								<label for="fecha_inicio">Fecha de Inicio&nbsp;</label><input
									class="form-control" type="text" name="fecha_inicio" />
							</div>
							<div class="form-group">
								<label for="fecha_fin">Fecha de Finalización&nbsp;</label><input
									class="form-control" type="text" name="fecha_fin" />
							</div>
							<div class="form-group">
								<label for="numeroHoras">Numero de Horas&nbsp;</label><input
									class="form-control" type="text" name="numeroHoras" />
							</div>
							<div class="form-group">
								<label for="objetivos">Objetivos</label>
								<textarea class="form-control" rows="3" name="objetivos"></textarea>
							</div>
							<div class="form-group">
								<label for="requisitos">Requisitos</label>
								<textarea class="form-control" rows="3" name="requisitos"></textarea>
							</div>
							<div class="form-group">
								<label for="enviar"><input class="btn btn-default"
									type="submit" value="Enviar" name="enviar" /></label>
							</div>
						</fieldset>
					</form>
				</div>
				<div id="bajacurso" class="tab-pane fade">
					<form action="${pageContext.request.contextPath}/DeleteCursos"
						name="baja" method="post">
						<fieldset>
							<legend>Baja de usuarios</legend>
							<div class="form-group">
								<label for="login">Nombre Usuario &nbsp;</label><input
									class="form-control" type="text" name="nombreUsuario" />
								<p>
							</div>
							<div class="form-group">
								<label for="password">Clave&nbsp;</label><input
									class="form-control" type="text" name="clave" />
								<p>
							</div>
							<div class="form-group">
								<label for="enviar"><input class="btn btn-default"
									type="submit" value="Enviar" name="enviar" /></label>
							</div>
						</fieldset>
					</form>
				</div>
				<div id="updatecurso" class="tab-pane fade">

					<form action="${pageContext.request.contextPath}/UpdateCursos"
						name="modifiacion" method="post">
						<fieldset>
							<legend>Editar perfil de usuario</legend>
							<div class="form-group">
								<label for="login">Nombre Usuario &nbsp;</label><input
									class="form-control" type="text" name="nombreUsuario" />
								<p>
							</div>
							<div class="form-group">
								<label for="password">Nombre&nbsp;</label><input
									class="form-control" type="text" name="nombre" />
								<p>
							</div>
							<div class="form-group">
								<label for="password">Apellidos&nbsp;</label><input
									class="form-control" type="text" name="apellidos" />
								<p>
							</div>
							<div class="form-group">
								<label for="password">Correo electrónico&nbsp;</label><input
									class="form-control" type="text" name="correo" />
								<p>
							</div>
							<div class="form-group">
								<label for="password">Clave&nbsp;</label><input
									class="form-control" type="text" name="clave" />
								<p>
							</div>
							<div class="form-group">
								<label for="enviar"><input class="btn btn-default"
									type="submit" value="Enviar" name="enviar" /></label>
							</div>
						</fieldset>
					</form>

				</div>
				<div id="findcurso" class="tab-pane fade">
					<div class="row">
						<div class="col-md-6">
							<form action="#" name="busqueda" method="post">
								<fieldset>
									<legend>Busqueda de Cursos</legend>
									<div class="form-group">
										<label for="nombre">Nombre del Curso &nbsp;</label><input
											class="form-control" type="text" name="nombre" id="nombrecurso" />
										<p>
									</div>
									

									<div class="form-group">
										<label for="enviar"><button type="button" class="btn btn-default" id="findCursos">Enviar</button></label>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="col-md-8"  style="padding-top: 30px;">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>&nbsp;ID&nbsp;</th>
									<th>&nbsp;Nombre&nbsp;</th>
									<th>&nbsp;Descripcion&nbsp;</th>
									<th>&nbsp;Fecha de Inicio &nbsp;</th>
									<th>&nbsp;Fecha de Fin&nbsp;</th>
									<th>&nbsp;Numero de Horas&nbsp;</th>
									<th>&nbsp;Objetivos&nbsp;</th>
									<th>&nbsp;Requisitos&nbsp;</th>
								</tr>
							</thead>
							<tbody id="datosCursos"></tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<script>
		/**
		 * funciones CRUD
		 */
		// Usuarios:

		//Buscar Usuarios
		$("#find").on(
				"click",
				function() {
					var user = $("#user").val();
					var nombre = $("#nombre").val();
					var apellidos = $("#apellidos").val();
					var correo = $("#correo").val();
					var pass = $("#pass").val();
					var rol = $("#rolfind").val();
					console.log("rol: " + rol);
					var paramPost = {
						user : user,
						nombre : nombre,
						apellidos : apellidos,
						correo : correo,
						pass : pass,
						rol : rol
					};
					console.log(paramPost);

					$.post("${pageContext.request.contextPath}/jsp/controller/datosUsuarios.jsp",
							paramPost, function(data) {
								$("#datosUser").html(data);
							});

				});

		//Eliminar Usuarios
		// Queremos que nos muestre la lista de usuarios para dar de baja.
		$("#btnBajaUser").on(
				"click",
				function() {
					$.post("${pageContext.request.contextPath}/jsp/controller/datosUsuarios.jsp",
							function(data) {
								$("#datosUserDelete").html(data);
							});

				});
		$("#delete")
				.on(
						"click",
						function() {
							var user = $("#user").val();

							var paramPost = {
								user : user
							};
							console.log(paramPost);

							$
									.post(
											"${pageContext.request.contextPath}/DeleteUsuarios",
											paramPost, function(data) {
												$("#datosUserDelete").html(data);
											});

						});
		//UpdateUser
		
		$("#btnUpdateUser").on(
				"click",
				function() {
					$.post("${pageContext.request.contextPath}/jsp/controller/datosUsuarios.jsp",
							function(data) {
								$("#datosUserUpdate").html(data);
							});

				});
		
		
		
		// Buscar Cursos
		$("#findCursos").on(
				"click",
				function() {
					var nombre = $("#nombre").val();
					var descripcion = $("#descripcion").val();
					var fecha_inicio = $("#fecha_inicio").val();
					var fecha_fin = $("#fecha_fin").val();
					var numero_horas = $("#numero_horas").val();
					var objetivos = $("#objetivos").val();
					var requisitos = $("#requisitos").val();
					console.log("rol: " + rol);
					var paramPost = {
						nombre : nombre,
						descripcion : descripcion,
						fecha_inicio : fecha_inicio,
						fecha_fin : fecha_fin,
						numero_horas : numero_horas,
						objetivos : objetivos,
						requisitos : requisitos
					};
					console.log(paramPost);

					$.post("${pageContext.request.contextPath}/jsp/controller/datosCursos.jsp",
							paramPost, function(data) {
								$("#datosCursos").html(data);
							});

				});
		
		
		</script>
</body>
</html>

