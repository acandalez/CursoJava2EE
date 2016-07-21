package org.academy.controllers.insert;

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
 * Servlet implementation class InsertUser
 */
@WebServlet("/InsertUsuarios")
public class InsertUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("estoy en insertUsuarios");
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
			
			
			String user = request.getParameter("user");    
		    String nombre = request.getParameter("nombre");
		    String apellidos = request.getParameter("apellidos");
		    String correo = request.getParameter("correo");
		    String pass = request.getParameter("pass");
		    String rol = request.getParameter("rol");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
		   	Statement st = con.createStatement();
			int i =  st.executeUpdate("INSERT INTO ficha_alumnos (user, nombre, apellidos, correo_electronico, pass, rol) VALUES ('"+ user +"','"+ nombre +"', '"+apellidos+"', '"+correo+"', '"+pass+"', '"+ rol +"') ;");
			
			if (i > 0) {
				System.out.println("estoy dentro de if");
    			//this.getServletContext().getRequestDispatcher("/panelcontrol.jsp#altauser").forward(request, response);
				response.sendRedirect("/Academia/panelcontrol.jsp#altauser");//emitimos una respuesta
    			
		    } else {
		    	
		    	//this.getServletContext().getRequestDispatcher("/Academia/panelcontrol.jsp").forward(request, response);
		    	
		    }
			}catch(SQLException e){
				
				e.printStackTrace();
			}
	}

}
