<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>

<%
//String id =  request.getParameter("id");
String user = request.getParameter("user");System.out.println("User: " + user);

try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String sqlQry = "delete from ficha_alumnos where user = '" + user + "'";

	System.out.println("Consulta SQL: "+sqlQry);
	
	//String consulta = ("SELECT * FROM ficha_alumnos WHERE id LIKE '%"+id+"%' AND user LIKE '%"+user+"%' AND id LIKE '%"+id+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND pass LIKE '%"+pass+"%' AND rol LIKE '%"+rol+"%';");   
	int rs = 0;
	ResultSet rs2 = null;
    PreparedStatement pst = null;
    PreparedStatement pst2 = null;
    pst = con.prepareStatement(sqlQry);
    rs = pst.executeUpdate();//estro es para actualizar ya que devuelve el numero de filas afectadas por esto.
    System.out.println(rs);

	sqlQry = "select id, user, nombre, apellidos, correo_electronico, pass, rol ";
	sqlQry += "from ficha_alumnos ";
	pst2 = con.prepareStatement(sqlQry);
	rs2=pst2.executeQuery();
     while(rs2.next()) {
    	
        out.println("<TR>");
        out.println("<TD>"+rs2.getString("id")+"</TD>");
        out.println("<TD>"+rs2.getString("user")+"</TD>");
        out.println("<TD>"+rs2.getString("nombre")+"</TD>");
        out.println("<TD>"+rs2.getString("apellidos")+"</TD>");
        out.println("<TD>"+rs2.getString("correo_electronico")+"</TD>");
        out.println("<TD>"+rs2.getString("pass")+"</TD>");
        out.println("<TD>"+rs2.getString("rol")+"</TD>");
     
        out.println("</TR>"); 
    } 
}catch(SQLException e) {};
    %> 