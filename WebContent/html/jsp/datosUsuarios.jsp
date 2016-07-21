<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>datosUsuario</title>
</head>
<body>
<%
String id =  request.getParameter("id");
String user = request.getParameter("user");
String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");
String correo = request.getParameter("correo");
String pass = request.getParameter("pass");
String rol = request.getParameter("rol");

try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String consulta = ("SELECT * FROM ficha_alumnos WHERE id LIKE '%"+id+"%' AND user LIKE '%"+user+"%' AND nombre LIKE '%"+nombre+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND pass LIKE '%"+pass+"%' AND rol LIKE '%"+rol+"%';");   
	ResultSet rs = null;
    PreparedStatement pst = null;
    pst = con.prepareStatement(consulta);
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
        out.println("</table>");
    } 
    catch(SQLException e) {
    	
    };
    %> 
</div>
	<br/>
	<br/>

</body>
</html>

	ResultSet rs = null;
	PreparedStatement pst = null;
	pst = con.prepareStatement(consulta);
	rs = pst.executeQuery();
	while (rs.next()) {

		out.println("<TR>");
		out.println("<TD>" + rs.getString("user") + "</TD>");
		out.println("<TD>" + rs.getString("nombre") + "</TD>");
		out.println("<TD>" + rs.getString("apellidos") + "</TD>");
		out.println("<TD>" + rs.getString("correo_electronico") + "</TD>");
		out.println("<TD>" + rs.getString("pass") + "</TD>");
		out.println("<TD>" + rs.getString("rol") + "</TD>");

		out.println("</TR>");
	}
	out.println("</table>");

} catch (SQLException e) {

}
; %> 
</body>
</html>