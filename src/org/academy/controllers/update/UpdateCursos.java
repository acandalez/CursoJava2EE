package org.academy.controllers.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCursos
 */
@WebServlet("/UpdateCursos")
public class UpdateCursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCursos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try{
				try{	
					Class.forName(com.mysql.jdbc.Driver.class.getName()).newInstance();
					}catch(InstantiationException e){
					
						e.printStackTrace();
					}catch (IllegalAccessException e){
					
						e.printStackTrace();
					}catch (ClassNotFoundException e){
						
						e.printStackTrace();
					}
				
				String id = request.getParameter("id");
				String nombre = request.getParameter("nombre");
				String descripcion = request.getParameter("descripcion");
			    String fechaInicio = request.getParameter("fechaInicio");
			    String fechaFin = request.getParameter("fechaFin");
			    String numeroHoras = request.getParameter("numeroHoras");
			    String objetivos = request.getParameter("objetivos");
			    String requisitos = request.getParameter("requisitos");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos", "root", "123456");
			   	Statement st = con.createStatement();
				int i = st.executeUpdate("UPDATE cursos SET nombre='"+ nombre +"', descripcion='"+ descripcion +"', fecha_inicio='"+fechaInicio+"', fecha_fin='"+ fechaFin +"', numero_horas='"+ numeroHoras +"', objetivos='"+ objetivos +"' requisitos='"+ requisitos +"',  WHERE id='"+ id +"'; ");   
				
				if (i > 0) {	
					response.sendRedirect("/Academia/jsp/panelcontrol.jsp#updatecursos");
	    			
			    } else {
			    	
			    //	this.getServletContext().getRequestDispatcher("/exito.jsp").forward(request, response);
			    	
			    }
				}catch(SQLException e){
					
					e.printStackTrace();
				
				}
		
		doGet(request, response);
	}

}
