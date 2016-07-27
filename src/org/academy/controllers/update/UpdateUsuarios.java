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
 * Servlet implementation class Update
 */
@WebServlet("/UpdateUsuarios")
public class UpdateUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUsuarios() {
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
			
			
			String user = request.getParameter("user"); 

		    String nombre = request.getParameter("nombre");
		    String apellidos = request.getParameter("apellidos");
		    String correo = request.getParameter("correo");
		    String pass = request.getParameter("pass");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
		   	Statement st = con.createStatement();
			int i = st.executeUpdate("UPDATE ficha_alumnos SET user='"+ user +"', nombre='"+ nombre +"', apellidos='"+apellidos+"', correo_electronico='"+correo+"', pass='"+pass+"' WHERE user='"+ user +"'; ");   
			
			if (i > 0) {	
    			//this.getServletContext().getRequestDispatcher("/panelcontrol.jsp#updateuser").forward(request, response);
				response.sendRedirect("/Academia/jsp/panelcontrol.jsp#altauser");
		    } else {
		    	
		    //	this.getServletContext().getRequestDispatcher("/panelcontrol.jsp").forward(request, response);
		    	
		    }
			}catch(SQLException e){
				
				e.printStackTrace();
			

			/*}finally{
					try {
						rs.close();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
					try {
						stmt.close();
					} catch (SQLException e) {
					
						e.printStackTrace();
					}
					try {
						conn.close();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
				
				}
		*/
			}
		//doGet(request, response);
	}
	
}
