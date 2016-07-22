package org.academy.controllers.delete;

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


@WebServlet("/DeleteUsuarios")
public class DeleteUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// DELETE
			
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
					    String id = request.getParameter("id");
					    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
					   	Statement st = con.createStatement();
						int i =  st.executeUpdate("DELETE FROM usuarios WHERE user='"+user+"' AND id='"+id+"';");   
						
						if (i > 0) {	
			    			//this.getServletContext().getRequestDispatcher("/panelcontrol.jsp#bajauser").forward(request, response);
							response.sendRedirect("/Academia/panelcontrol.jsp#bajauser");//emitimos una respuesta
					    } else {
					    	
					    	//this.getServletContext().getRequestDispatcher("/Academia/panelcontrol.jsp").forward(request, response);
					    	
					    }
						}catch(SQLException e){
							
							e.printStackTrace();
						}
				}
			
		

	}


