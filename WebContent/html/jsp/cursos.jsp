<%@ page import="java.sql.*" import="java.io.*" import="java.util.*" import="java.net.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		
		<title>Curso de JavaEE </title>
	</head>
	<body>
		<h2><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;Panel de control de Cursos</h2>
    <div id="home" class="tab-pane fade in active">
      <div align="center">
        <h3>Hola <%=session.getAttribute("login")%></h3>
        <h3>Usted tiene el rol de <%=session.getAttribute("tipoUsuario")%> </h3>
        <a href="/html/jsp/usuarios.jsp">Gestión de Usuarios</a> <br>
        <a href="/html/jsp/cursos.jsp">Gestión de Cursos</a> <br>
        <a href="/html/jsp/logout.jsp">Cerrar Sesión</a><br>
      </div>
    </div>
		
      <form role="form" action="${pageContext.request.contextPath}/InputCursos" name="alta" method="post" class="form-horizontal">
          <fieldset>
            <legend>Alta de Cursos</legend>
            
              <label for="nombre">Nombre&nbsp;</label><input type="text" maxlength="30" name="nombre" required/><p>
             
              <label for="descripcion">Descripción&nbsp;</label><input type="text" name="descripcion" required/><p>
             
              <label for="fechaInicio">Fecha de inicio&nbsp;</label><input type="date" maxlength="10" name="fechaInicio" required/><p>
              
              <label for="fechaFin">Fecha de fin&nbsp;</label><input type="date" maxlength="20" name="fechaFin" required/><p>
              
              <label for="numeroHoras">Número de horas&nbsp;</label><input type="number" name="numeroHoras" required/><p>
              
              <label for="objetivos">Objetivos&nbsp;</label><input type="text"  name="objetivos"/><p>
              
              <label for="requisitos">Requisitos&nbsp;</label><input type="text" name="requisitos" /><p>
              
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
             
          </fieldset>
        </form>
 
 
     <form action="${pageContext.request.contextPath}/DeleteCursos" name="baja" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Baja de cursos</legend>
           
              <label for="id">Id del curso &nbsp;</label><input type="text" maxlength="20" name="id" required/><p>
              
              <label for="nombre">Nombre del curso&nbsp;</label><input type="text" maxlength="20" name="nombre" required/><p>
            
              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
             
          </fieldset>
        </form>
   
 
      
      <form action="${pageContext.request.contextPath}/UpdateCursos" name="modifiacion" method="post" style="padding-top:30px;">
          <fieldset>
            <legend>Editar perfil de un curso</legend>
          	
	              <label for="nombre">Nombre&nbsp;</label><input type="text" maxlength="30" name="nombreUsuario" /><p>
	              
	              <label for="descripcion">Descripción&nbsp;</label><input type="text"  maxlength="20" name="descripción" /><p>
	              
	              <label for="fechaInicio">Fecha de inicio&nbsp;</label><input type="text"  maxlength="20" name="fechaInicio" /><p>
	              
	              <label for="fechaFin">Fecha de fin&nbsp;</label><input type="text"  maxlength="20" name="fechaFin" /><p>
	             
	              <label for="numeroHoras">Número de horas&nbsp;</label><input type="text"  maxlength="20" name="numeroHoras" /><p>
	              
	              <label for="objetivos">Objetivos&nbsp;</label><input type="text"  maxlength="20" name="objetivos" /><p>
	              
	              <label for="requisitos">Requisitos&nbsp;</label><input type="text"  maxlength="20" name="requisitos" /><p>
	              
	              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
             
          </fieldset>
        </form>

      <form action="cursos.jsp" name="busqueda" method="post">
            <fieldset>
              <legend>Busqueda de Cursos</legend>
              
	              <label for="nombre">Nombre&nbsp;</label><input  type="text" maxlength="30" name="nombre" /><p>
	              
	              <label for="descripcion">Descripción&nbsp;</label><input  type="text" maxlength="20" name="descripción" /><p>
	              
	              <label for="fechaInicio">Fecha de inicio&nbsp;</label><input  type="text" maxlength="20" name="fechaInicio" /><p>
	             
	              <label for="fechaFin">Fecha de fin&nbsp;</label><input  type="text" maxlength="20" name="fechaFin"/><p>
	             
	              <label for="numeroHoras">Número de horas&nbsp;</label><input  type="text" maxlength="20" name="numeroHoras"/><p>
	             
	              <label for="objetivos">Objetivos&nbsp;</label><input  type="text" maxlength="20" name="objetivos"/><p>
	             
	              <label for="requisitos">Requisitos&nbsp;</label><input type="text" maxlength="20" name="requisitos"/><p>
	             
	              <label for="enviar"><input class="btn btn-default" type="submit" value="Enviar" name="enviar" /></label>
              
            </fieldset>
          </form>
	<div align="center">
      	<table class="table" border="2px"> 
    <tr>
   		<th>&nbsp;Nombre&nbsp;</th><th>&nbsp;Descripción&nbsp;</th><th>&nbsp;Fecha de inicio&nbsp;</th><th>&nbsp;Fecha de Fin&nbsp;</th><th>&nbsp;Numero de Horas&nbsp;</th><th>&nbsp;Objetivos&nbsp;</th><th>&nbsp;Requisitos&nbsp;</th>
    </tr>		
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
            	
                out.println("<TR>");
                out.println("<TD>"+rs.getString("nombre")+"</TD>");
                out.println("<TD>"+rs.getString("descripcion")+"</TD>");
                out.println("<TD>"+rs.getString("fecha_inicio")+"</TD>");
                out.println("<TD>"+rs.getString("fecha_fin")+"</TD>");
                out.println("<TD>"+rs.getString("numero_horas")+"</TD>");
                out.println("<TD>"+rs.getString("objetivos")+"</TD>");
                out.println("<TD>"+rs.getString("requisitos")+"</TD>");
                
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