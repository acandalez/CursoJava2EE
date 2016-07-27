<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>

<%
//String id =  request.getParameter("id");
String nombre = request.getParameter("nombre");System.out.println("Nombre: " + nombre);
String descripcion = request.getParameter("descripcion");System.out.println("Descripcion: " + descripcion);
String fecha_inicio = request.getParameter("fecha_inicio");
String fecha_fin = request.getParameter("fecha_fin");
String numero_horas = request.getParameter("numero_horas");
String objetivos = request.getParameter("objetivos");
String requisitos = request.getParameter("requisitos");

boolean filterNombre = false;
boolean filterDescripcion = false;
boolean filterFechaInicio = false;
boolean filterFechaFin = false;
boolean filterNumeroHoras = false;
boolean filterObjetivos = false;
boolean filterRequisitos = false;

try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String sqlQry = "select id, nombre, descripcion, fecha_inicio, fecha_fin, numero_horas, objetivos, requisitos ";
	sqlQry += "from cursos ";

	filterNombre = nombre != null && nombre.length() != 0;
	filterDescripcion = descripcion != null && descripcion.length() != 0;
	filterFechaInicio = fecha_inicio != null && fecha_inicio.length() != 0;
	filterFechaFin = fecha_fin != null && fecha_fin.length() != 0;
	filterNumeroHoras = numero_horas != null && numero_horas.length() != 0;
	filterObjetivos = objetivos != null && objetivos.length() != 0;
	filterRequisitos = requisitos != null && requisitos.length() != 0;

	if(
		filterNombre ||
		filterDescripcion ||
		filterFechaInicio ||
		filterFechaFin ||
		filterNumeroHoras || filterObjetivos || filterRequisitos ){
		sqlQry += "where ";

		if(filterNombre){
			sqlQry += "nombre = '" + nombre + "'";
		}

		if(filterDescripcion && filterNombre){
			sqlQry += " and descripcion = '" + descripcion + "'";
		}else if(filterDescripcion){
			sqlQry += "descripcion = '" + descripcion + "'";
		}

		if(filterFechaInicio && (filterDescripcion || filterNombre)){
			sqlQry += " and fecha_inicio = '" + fecha_inicio + "'";
		}else if(filterFechaInicio){
			sqlQry += "fecha_inicio = '" + fecha_inicio + "'";
		}

		if(filterFechaFin && (filterFechaInicio || filterDescripcion || filterNombre)){
			sqlQry += " and fecha_fin = '" + fecha_fin + "'";
		}else if(filterFechaFin){
			sqlQry += "fecha_fin = '" + fecha_fin + "'";
		}
		
		if(filterNumeroHoras && (filterFechaFin || filterFechaInicio || filterDescripcion || filterNombre)){
			sqlQry += " and numero_horas = '" + numero_horas + "'";
		}else if(filterNumeroHoras){
			sqlQry += "numero_horas = '" + numero_horas + "'";
		}
		
		if(filterObjetivos && (filterNumeroHoras || filterFechaFin || filterFechaInicio || filterDescripcion || filterNombre)){
			sqlQry += " and objetivos = '" + objetivos + "'";
		}else if(filterObjetivos){
			sqlQry += "objetivos = '" + objetivos + "'";
		}
		
		if(filterRequisitos && (filterObjetivos || filterNumeroHoras || filterFechaFin || filterFechaInicio || filterDescripcion || filterNombre)){
			sqlQry += " and requisitos = '" + requisitos + "'";
		}else if(filterObjetivos){
			sqlQry += "requisitos = '" + requisitos + "'";
		}
	}

	System.out.println(sqlQry);
	
	//String consulta = ("SELECT * FROM ficha_alumnos WHERE id LIKE '%"+id+"%' AND user LIKE '%"+user+"%' AND nombre LIKE '%"+nombre+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND pass LIKE '%"+pass+"%' AND rol LIKE '%"+rol+"%';");   
	ResultSet rs = null;
    PreparedStatement pst = null;
    pst = con.prepareStatement(sqlQry);
    rs = pst.executeQuery();
    while(rs.next()) {
    	
        out.println("<TR>");
        out.println("<TD>"+rs.getString("id")+"</TD>");
        out.println("<TD>"+rs.getString("nombre")+"</TD>");
        out.println("<TD>"+rs.getString("descripcion")+"</TD>");
        out.println("<TD>"+rs.getString("fecha_inicio")+"</TD>");
        out.println("<TD>"+rs.getString("fecha_fin")+"</TD>");
        out.println("<TD>"+rs.getString("numero_horas")+"</TD>");
        out.println("<TD>"+rs.getString("objetivos")+"</TD>");
        out.println("<TD>"+rs.getString("requisitos")+"</TD>");
     
        out.println("</TR>"); 
        }

    } 
    catch(SQLException e) {
    	
    };
    %> 

