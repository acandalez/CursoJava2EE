<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.* , java.io.* , java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Panel de Control - Pencil Academy</title>
  <meta charset="utf-8 ">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/4392e38f59.js"></script>
</head>
<body>

<div class="container" style="padding-top:30px;">
  <h2><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;Panel de control</h2>
  <ul class="nav nav-tabs" style="padding-top:30px;">
    <li class="active"><a data-toggle="tab" href="#home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;Inicio</a></li>
    
    <li role="presentation" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;Gestion de Alumnos
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#altauser" data-toggle="tab">Altas</a></li>
      <li><a href="#bajauser" data-toggle="tab">Bajas</a></li>
      <li><a href="#updateuser" data-toggle="tab">Editar Perfil del Alumno</a></li>
      <li><a href="#finduser" data-toggle="tab">Buscar Ficha del Alumno</a></li>
    </ul>
    </a>

    </li>
    <li role="presentation" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span>&nbsp;&nbsp;Gestion de Cursos
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a data-toggle="tab" href="#altacursos">Altas</a></li>
    <li><a data-toggle="tab" href="#menu2">Bajas</a></li>
    <li><a data-toggle="tab" href="#menu3">Editar Cursos</a></li>
    <li><a data-toggle="tab" href="#menu4">Buscar Cursos</a></li>
    </ul>
    </a>

    </li>
    <li><a data-toggle="tab" href="#menu2"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;Cerrar Sesión</a></li>
    
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div align="center">
        <h3>Hola <%=session.getAttribute("user")%></h3>
        <a href="usuarios.jsp">Gestión de Usuarios</a> <br>
        <a href="cursos.jsp">Gestión de Cursos</a> <br>
        <a href="logout.jsp">Cerrar Sesión</a><br>
      </div>
    </div>
    <!-- Panel de Usuarios -->
    <div id="altauser" class="tab-pane fade">

      <form role="form" action="InsertUsuarios" name="alta" method="post" style="padding-top:30px;" class="form-horizontal">
          <fieldset>
            <legend>Alta de Usuarios</legend>
            <div class="form-group" >
              
                  <label for="user" >Nombre de Usuario: &nbsp;</label><input placeholder="Nombre de Usuario" class="form-control" type="text" maxlength="20" name="user" required/><p>
                  </div><div class="form-group " >
                  <label for="nombre" >Nombre:&nbsp;</label><input placeholder="Nombre" class="form-control" type="text" maxlength="20" name="nombre" required/><p>
                  </div><div class="form-group" >
                  <label for="apellidos" >Apellidos:&nbsp;</label><input placeholder="Apellidos" class="form-control" type="text" maxlength="20" name="apellidos" required/><p>
                  </div><div class="form-group" >
                  <label for="correo" >Email:&nbsp;</label><input placeholder="Email" class="form-control" type="email" maxlength="20" name="correo" required/><p>
                  </div><div class="form-group" >
                  <label for="pass" >Contraseña:&nbsp;</label><input placeholder="Contraseña" class="form-control" type="text" maxlength="20" name="pass" required/><p>
                  </div><div class="form-group" >
                  <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>
    </div>
    <div id="bajauser" class="tab-pane fade">
     <form action="DeleteUsuarios" name="baja" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Baja de usuarios</legend>
            <div class="form-group" >
              <label for="user">Nombre Usuario &nbsp;</label><input class="form-control" type="user" maxlength="20" name="user" /><p>
              </div><div class="form-group" >
              <label for="pass">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="pass" /><p>
              </div><div class="form-group" >
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>
    </div>
    <div id="updateuser" class="tab-pane fade">
      
      <form action="UpdateUsuarios" name="modifiacion" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Editar perfil de usuario</legend>
          <div class="form-group" >
              <label for="user">Nombre Usuario &nbsp;</label><input class="form-control" type="text" maxlength="20" name="user" required/><p>
              </div><div class="form-group" >
              <label for="nombre">Nombre&nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombre" required/><p>
              </div><div class="form-group" >
              <label for="apellidos">Apellidos&nbsp;</label><input class="form-control" type="text" maxlength="20" name="apellidos" required/><p>
              </div><div class="form-group" >
              <label for="password">Correo electrónico&nbsp;</label><input class="form-control" type="email" maxlength="20" name="correo" required/><p>
              </div><div class="form-group" >
              <label for="pass">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="pass" required/><p>
              </div><div class="form-group" >
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>

    </div>
    <div id="finduser" class="tab-pane fade">
      <div><form action="#finduser" name="busqueda" method="post" style="padding-top:30px;">
            <fieldset>
              <legend>Busqueda de usuarios</legend>
              <div class="form-group" >
                <label for="user">Nombre Usuario &nbsp;</label><input class="form-control" type="text" maxlength="20" name="user" required/><p>
                </div><div class="form-group" >
                <label for="nombre">Nombre&nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombre" required/><p>
                </div><div class="form-group" >
                <label for="apellidos">Apellidos&nbsp;</label><input class="form-control" type="text" maxlength="20" name="apellidos" required/><p>
                </div><div class="form-group" >
                <label for="correo">Correo electrónico&nbsp;</label><input class="form-control" type="email" maxlength="20" name="correo" required/><p>
                </div><div class="form-group" >
                <label for="pass">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="pass" required/><p>
                </div><div class="form-group" >
                <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
                </div>
            </fieldset>
          </form>
    </div>
   
    
  </div>

  <!--Panel de Cursos -->
  <div id="altacursos" class="tab-pane fade">

      <form role="form" action="InsertCursos" name="alta" method="post">
          <fieldset>
            <legend>Alta de Cursos</legend>
            <div class="form-group" >
              <label for="nombre">Nombre del Curso &nbsp;</label><input class="form-control" type="text"  name="nombre" required/>
              </div><div class="form-group" >
              <label for="codigo">Codigo &nbsp;</label><input class="form-control" type="text"  name="codigo" required/>
              </div><div class="form-group" >
              <label for="descripcion">Descripción</label><textarea class="form-control" rows="3" type="text"  name="descripcion" ></textarea>
              </div><div class="form-group" >
              <label for="fecha_inicio">Fecha de Inicio&nbsp;</label><input class="form-control" type="text" maxlength="20" name="fecha_inicio" required/>
              </div><div class="form-group" >
              <label for="fecha_fin">Fecha de Finalización&nbsp;</label><input class="form-control" type="text" maxlength="20" name="fecha_fin" required/>
              </div><div class="form-group" >
              <label for="numeroHoras">Numero de Horas&nbsp;</label><input class="form-control" type="text" maxlength="20" name="numeroHoras" required/>
              </div><div class="form-group" >
              <label for="objetivos">Objetivos</label><textarea class="form-control" rows="3" type="text"  name="objetivos" ></textarea>
              </div><div class="form-group" >
              <label for="requisitos">Requisitos</label><textarea class="form-control" rows="3" type="text"  name="requisitos" ></textarea>
              </div><div class="form-group" >
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>
    <div id="bajauser" class="tab-pane fade">
     <form action="log" name="baja" method="post">
          <fieldset>
            <legend>Baja de usuarios</legend>
            <div class="form-group" >
              <label for="login">Nombre Usuario &nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombreUsuario" required/><p>
              </div><div class="form-group" >
              <label for="password">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="clave" required/><p>
              </div><div class="form-group" >
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>
    </div>
    <div id="updateuser" class="tab-pane fade">
      
      <form action="log" name="modifiacion" method="post">
          <fieldset>
            <legend>Editar perfil de usuario</legend>
          <div class="form-group" >
              <label for="login">Nombre Usuario &nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombreUsuario" required/><p>
              </div><div class="form-group" >
              <label for="password">Nombre&nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombre" required/><p>
              </div><div class="form-group" >
              <label for="password">Apellidos&nbsp;</label><input class="form-control" type="text" maxlength="20" name="apellidos" required/><p>
              </div><div class="form-group" >
              <label for="password">Correo electrónico&nbsp;</label><input class="form-control" type="text" maxlength="20" name="correo" required/><p>
              </div><div class="form-group" >
              <label for="password">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="clave" required/><p>
              </div><div class="form-group" >
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              </div>
          </fieldset>
        </form>

    </div>
    <div id="finduser" class="tab-pane fade">
      <form action="log" name="busqueda" method="post">
            <fieldset>
              <legend>Busqueda de usuarios</legend>
              <div class="form-group" >
                <label for="login">Nombre Usuario &nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombreUsuario" required/><p>
                </div><div class="form-group" >
                <label for="password">Nombre&nbsp;</label><input class="form-control" type="text" maxlength="20" name="nombre" required/><p>
                </div><div class="form-group" >
                <label for="password">Apellidos&nbsp;</label><input class="form-control" type="text" maxlength="20" name="apellidos" required/><p>
                </div><div class="form-group" >
                <label for="password">Correo electrónico&nbsp;</label><input class="form-control" type="text" maxlength="20" name="correo" required/><p>
                </div><div class="form-group" >
                <label for="password">Clave&nbsp;</label><input class="form-control" type="text" maxlength="20" name="clave" required/><p>
                </div><div class="form-group" >
                <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
                </div>
            </fieldset>
          </form>
    </div>
  </div>
</div>

</div>
</body>
</html>

