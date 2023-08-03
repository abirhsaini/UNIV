package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connexion {
	Connection connection;
	public  Connection  connection() throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:mysql://mysql:3306/univ";
		String user ="root";
		String pwd="root";
		
		
		
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("hii");
		System.out.print("bye");
		this.connection= DriverManager.getConnection(url, user,pwd);
		return connection;
	}
	public void close() throws SQLException {
		this.connection.close();
	}

}
