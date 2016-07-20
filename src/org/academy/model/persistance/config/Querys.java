package org.academy.model.persistance.config;

public class Querys {
	
	private static String password;
	private static String login;
	private static String user;
	private static String pass;
	private static String apellidos;
	private static String nombre;
	private static String correo;
	private static String nombreUsuario;
	
	
	public static final String LOGIN ="SELECT nombre_usuario, clave FROM usuarios WHERE nombre_usuario='" + login + "' AND clave='" + password + "';";
	public static final String INSERTALUMNO = "INSERT INTO usuarios (nombre_usuario, nombre, apellidos, correo_electronico, clave) VALUES ('"+ nombreUsuario +"','"+ nombre +"', '"+apellidos+"', '"+correo+"', '"+pass+"') ;";
	public static final String ACTUALIZARALUMNO ="UPDATE usuarios SET nombre_usuario='"+ user +"', nombre='"+ nombre +"', apellidos='"+apellidos+"', correo_electronico='"+correo+"', clave='"+pass+"' WHERE nombre_usuario='"+ user +"'; ";
	public static final String ELIMINARALUMNO ="DELETE FROM usuarios WHERE nombre_usuario='"+user+"' AND clave='"+pass+"';";

}
