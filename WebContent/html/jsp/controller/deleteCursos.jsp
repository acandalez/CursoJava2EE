<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* , java.io.* , java.util.*" pageEncoding="UTF-8"%>

<%
//String id =  request.getParameter("id");
String dcnombre = request.getParameter("dcnombre");System.out.println("Nombre del curso eliminado: " + dcnombre);

try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
	String sqlQry = "delete from cursos where nombre = '" + dcnombre + "'";

	System.out.println("Consulta SQL: "+sqlQry);
	
	//String consulta = ("SELECT * FROM ficha_alumnos WHERE id LIKE '%"+id+"%' AND user LIKE '%"+user+"%' AND id LIKE '%"+id+"%' AND apellidos LIKE '%"+apellidos+"%' AND correo_electronico LIKE '%"+correo+"%' AND pass LIKE '%"+pass+"%' AND rol LIKE '%"+rol+"%';");   
	int rs = 0;
	ResultSet rs2 = null;
    PreparedStatement pst = null;
    PreparedStatement pst2 = null;
    pst = con.prepareStatement(sqlQry);
    rs = pst.executeUpdate();//estro es para actualizar ya que devuelve el numero de filas afectadas por esto.
    System.out.println(rs);

	sqlQry = "select id, nombre, descripcion, fecha_inicio, fecha_fin, numero_horas, objetivos, requisitos ";
	sqlQry += "from cursos ";
	pst2 = con.prepareStatement(sqlQry);
	rs2=pst2.executeQuery();
     while(rs2.next()) {
    	
    	 out.println("<TR>");
         out.println("<TD>"+rs2.getString("id")+"</TD>");
         out.println("<TD>"+rs2.getString("nombre")+"</TD>");
         out.println("<TD>"+rs2.getString("descripcion")+"</TD>");
         out.println("<TD>"+rs2.getString("fecha_inicio")+"</TD>");
         out.println("<TD>"+rs2.getString("fecha_fin")+"</TD>");
         out.println("<TD>"+rs2.getString("numero_horas")+"</TD>");
         out.println("<TD>"+rs2.getString("objetivos")+"</TD>");
         out.println("<TD>"+rs2.getString("requisitos")+"</TD>");
      
         out.println("</TR>"); 
    } 
}catch(SQLException e) {};
    %> 