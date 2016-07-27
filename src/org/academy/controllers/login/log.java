package org.academy.controllers.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/log")
public class log extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private HttpSession sesion;
       
   
    public log() {
        super();
        // TODO Auto-generated constructor stub
    }


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
		    String pass = request.getParameter("pass");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/academia", "root", "123456");
		   	Statement st = con.createStatement();
		   	ResultSet rs;
			rs =  st.executeQuery("SELECT user, pass FROM ficha_alumnos WHERE user='" + user + "' AND pass='" + pass + "';");
			
			if (rs.next()) {
	
    				HttpSession session = request.getSession();
    			//	String usuario = (String)request.getAttribute("login");
    				session.setAttribute("user", user);
    				this.getServletContext().getRequestDispatcher("/jsp/panelcontrol.jsp").forward(request, response);
    				
		    } else {
		    	this.getServletContext().getRequestDispatcher("/jsp/fallo.jsp").forward(request, response);
		        
		    }
			}catch(SQLException e){
				
				e.printStackTrace();
			}
		
		
		
		//doGet(request, response);
	}
	
}

