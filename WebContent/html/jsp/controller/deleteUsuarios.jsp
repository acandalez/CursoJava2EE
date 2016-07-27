<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>

<%
//String id =  request.getParameter("id");
String user = request.getParameter("user");System.out.println("User: " + user);



boolean filterUser = false;



try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String sqlQry = "delete id, user, nombre, apellidos, correo_electronico, pass, rol ";
	sqlQry += "from ficha_alumnos ";

	filterUser = user != null && user.length() != 0;
	
	

	if(filterUser 
		){
		sqlQry += "where ";

		if(filterUser){
			sqlQry += "user = '" + user + "'";
		}

		

		
	}

	System.out.println(sqlQry);
	
	//String consulta = ("SELECT * FROM ficha_alumnos WHERE id LIKE '%"+id+"%' AND user LIKE '%"+user+"%' AND id LIKE '%"+id+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND pass LIKE '%"+pass+"%' AND rol LIKE '%"+rol+"%';");   
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

