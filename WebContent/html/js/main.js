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

			$.post("${pageContext.request.contextPath}/datosUsuarios.jsp",
					paramPost, function(data) {
						$("#datosUser").html(data);
					});

		});

//Eliminar Usuarios
// Queremos que nos muestre la lista de usuarios para dar de baja.
$("#btnBajaUser").on(
		"click",
		function() {
			$.post("${pageContext.request.contextPath}/datosUsuarios.jsp",
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
									"${pageContext.request.contextPath}/controller/deleteUsuarios.jsp",
									paramPost, function(data) {
										$("#datosUserDelete").html(data);
									});

				});