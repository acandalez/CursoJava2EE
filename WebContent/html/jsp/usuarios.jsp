<%@ page import="java.sql.*" import="java.util.*" import="java.io.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		
		<title>Curso JavaEE</title>
	</head>
	<body>
 		 <h2><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;Panel de control de Usuarios</h2>
      <div id="home" class="tab-pane fade in active">
      	<div align="center">
       		<h3>Hola <%=session.getAttribute("login")%></h3>
        	<h3>Usted tiene el rol de <%=session.getAttribute("tipoUsuario")%> </h3>
       		<a href="usuarios.jsp">Gestión de Usuarios</a> <br>
        	<a href="cursos.jsp">Gestión de Cursos</a> <br>
        	<a href="logout.jsp">Cerrar Sesión</a><br>
     	 </div>
      </div>

    <!-- Panel de Usuarios -->


      <form role="form" action="${pageContext.request.contextPath}/log" name="alta" method="post" class="form-horizontal">
          <fieldset>
            <legend>Alta de Usuarios</legend>
            
                  <label for="nombreUsuario" >Nombre de Usuario: &nbsp;</label><input placeholder="Nombre de Usuario"  type="text" maxlength="20" name="nombreUsuario" required/><p>
              
                  <label for="nombre" >Nombre:&nbsp;</label><input placeholder="Nombre"  type="text" maxlength="20" name="nombre" required/><p>
                  
                  <label for="apellidos" >Apellidos:&nbsp;</label><input placeholder="Apellidos"  type="text" maxlength="20" name="apellidos" required/><p>
                  
                  <label for="correo" >Correo electrónico:&nbsp;</label><input placeholder="Email"  type="text" maxlength="20" name="correo" required/><p>
                  
                  <label for="clave" >Contraseña:&nbsp;</label><input placeholder="Contraseña"  type="text" maxlength="20" name="clave" required/><p>
                  
                  <label for="password">Clave&nbsp;</label><input type="text" maxlength="20" name="clave" required/><p>
                  <select id="tipoUsuario" name="tipoUsuario">
                	<option value="Administrador"> Administrador</option>
                	<option value="Alumno"> Alumno</option>
                	<option value="Profesor"> Profesor</option>
                </select>
                  <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              
          </fieldset>
        </form>


     <form action="${pageContext.request.contextPath}/log" name="baja" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Baja de usuarios</legend>
            
              <label for="login">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
              
              <label for="password">Clave&nbsp;</label><input  type="text" maxlength="20" name="clave" required/><p>
           
              <label for="enviar"><input type="submit" value="Enviar" name="enviar" /></label>
              
          </fieldset>
        </form>

  
      
      <form action="${pageContext.request.contextPath}/log" name="modificacion" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Editar perfil de usuario</legend>
        
              <label for="login">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
              
              <label for="password">Nombre&nbsp;</label><input type="text" maxlength="20" name="nombre" required/><p>
              
              <label for="password">Apellidos&nbsp;</label><input type="text" maxlength="20" name="apellidos" required/><p>
              
              <label for="password">Correo electrónico&nbsp;</label><input type="text" maxlength="20" name="correo" required/><p>
             
              <label for="password">Clave&nbsp;</label><input type="text" maxlength="20" name="clave" required/><p>
              
              	<select id="tipoUsuario" name="tipoUsuario">
                	<option value="Administrador"> Administrador</option>
                	<option value="Alumno"> Alumno</option>
                	<option value="Profesor"> Profesor</option>
                </select>
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
             
          </fieldset>
        </form>


 
      <form action="usuarios.jsp" name="busqueda" method="post" style="padding-top:30px;">
            <fieldset>
              <legend>Busqueda de usuarios</legend>
              
                <label for="login">Nombre Usuario &nbsp;</label><input type="text" maxlength="20" name="nombreUsuario" required/><p>
             
                <label for="nombre">Nombre&nbsp;</label><input type="text" maxlength="20" name="nombre" /><p>
                
                <label for="apellidos">Apellidos&nbsp;</label><input type="text" maxlength="20" name="apellidos" /><p>
                
                <label for="correo">Correo electrónico&nbsp;</label><input type="text" maxlength="20" name="correo"/><p>
                
                <label for="clave">Clave&nbsp;</label><input type="text" maxlength="20" name="clave"/><p>
                <select  name="tipoUsuario">
                	<option value="selecciona..." disabled>Elije una opción </option>
                	<option value="Administrador"> Administrador</option>
                	<option value="Alumno"> Alumno</option>
                	<option value="Profesor"> Profesor</option>
                
                </select>
                
 
                <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
               
            </fieldset>
          </form>
       <div align="center">
    		<table class="table" border="2px"> 
    	<tr>
            <th>&nbsp;Nombre de Usuario&nbsp;</th><th>&nbsp;Nombre&nbsp;</th><th>&nbsp;Apellidos&nbsp;</th> <th>&nbsp;Correo electrónico&nbsp;</th><th>&nbsp;Contrase&ntilde;a&nbsp;</th><th>&nbsp;Tipo de Usuario&nbsp;</th>
       	</tr>		

		<% 
			String nombreUsuario = request.getParameter("nombreUsuario");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String correo = request.getParameter("correo");    
		    String clave = request.getParameter("clave");
		    String tipoUsuario = request.getParameter("tipoUsuario");
		    
		    
        try {
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos", "root", "123456");
			String consulta =("SELECT * FROM usuarios WHERE nombre_usuario LIKE '%"+nombreUsuario+"%' AND nombre LIKE '%"+nombre+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND clave LIKE '%"+clave+"%' AND tipo_usuario LIKE '%"+tipoUsuario+"%';");   
			ResultSet rs = null;
	        PreparedStatement pst = null;
	        pst = con.prepareStatement(consulta);
	        rs = pst.executeQuery();
            while(rs.next()) {
            	
                out.println("<TR>");
                out.println("<TD>"+rs.getString("nombre_usuario")+"</TD>");
                out.println("<TD>"+rs.getString("nombre")+"</TD>");
                out.println("<TD>"+rs.getString("apellidos")+"</TD>");
                out.println("<TD>"+rs.getString("correo_electronico")+"</TD>");
                out.println("<TD>"+rs.getString("clave")+"</TD>");
                out.println("<TD>"+rs.getString("tipo_usuario")+"</TD>");
             
                out.println("</TR>"); 
                }
                out.println("</table>");

            } 
            catch(SQLException e) {
            	
            };
            %> 
        </div>
        	<br/>
        	<br/>
        <footer>
			
		</footer>
</body>
</html>