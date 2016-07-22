<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>

<%
//String id =  request.getParameter("id");
String user = request.getParameter("user");System.out.println("User: " + user);
String nombre = request.getParameter("nombre");System.out.println("Nombre: " + nombre);
String apellidos = request.getParameter("apellidos");
String correo = request.getParameter("correo");
String pass = request.getParameter("pass");
String rol = request.getParameter("rol");

boolean filterUser = false;
boolean filterNombre = false;
boolean filterApellidos = false;
boolean filterCorreo = false;
boolean filterPass = false;
boolean filterRol = false;

try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String sqlQry = "select id, user, nombre, apellidos, correo_electronico, pass, rol ";
	sqlQry += "from ficha_alumnos ";

	filterUser = user != null && user.length() != 0;
	filterNombre = nombre != null && nombre.length() != 0;
	filterApellidos = apellidos != null && apellidos.length() != 0;
	filterCorreo = correo != null && correo.length() != 0;
	filterPass = pass != null && pass.length() != 0;
	filterRol = rol != null && rol.length() != 0 && !rol.equals("-1");

	if(filterUser ||
		filterNombre ||
		filterApellidos ||
		filterCorreo ||
		filterPass ||
		filterRol){
		sqlQry += "where ";

		if(filterUser){
			sqlQry += "user = '" + user + "'";
		}

		if(filterNombre && filterUser){
			sqlQry += " and nombre = '" + nombre + "'";
		}else if(filterNombre){
			sqlQry += "nombre = '" + nombre + "'";
		}

		if(filterApellidos && (filterNombre || filterUser)){
			sqlQry += " and apellidos = '" + apellidos + "'";
		}else if(filterApellidos){
			sqlQry += "apellidos = '" + apellidos + "'";
		}

		if(filterCorreo && (filterApellidos || filterNombre || filterUser)){
			sqlQry += " and correo = '" + correo + "'";
		}else if(filterCorreo){
			sqlQry += "correo = '" + correo + "'";
		}
		
		if(filterPass && (filterCorreo || filterApellidos || filterNombre || filterUser)){
			sqlQry += " and pass = '" + pass + "'";
		}else if(filterPass){
			sqlQry += "pass = '" + pass + "'";
		}
		
		if(filterRol && (filterPass || filterCorreo || filterApellidos || filterNombre || filterUser)){
			sqlQry += " and rol = '" + rol + "'";
		}else if(filterRol){
			sqlQry += "rol = '" + rol + "'";
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
        out.println("<TD>"+rs.getString("user")+"</TD>");
        out.println("<TD>"+rs.getString("nombre")+"</TD>");
        out.println("<TD>"+rs.getString("apellidos")+"</TD>");
        out.println("<TD>"+rs.getString("correo_electronico")+"</TD>");
        out.println("<TD>"+rs.getString("pass")+"</TD>");
        out.println("<TD>"+rs.getString("rol")+"</TD>");
     
        out.println("</TR>"); 
        }

    } 
    catch(SQLException e) {
    	
    };
    %> 

