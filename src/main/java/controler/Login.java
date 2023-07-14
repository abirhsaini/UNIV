package controler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username =request.getParameter("username");
		String password=request.getParameter("password");
		
		String url = "jdbc:mysql://localhost:3306/univ";
		String user ="root";
		String pwd="";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("hii");
			Connection connection= DriverManager.getConnection(url, user,pwd);
			PreparedStatement  pst=connection.prepareStatement("SELECT iduser FROM user WHERE username=? AND password=?");
			pst.setString(1,username);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			if (rs.next()) {
				 session.setAttribute("username", username);
				 response.sendRedirect("home.jsp");
				 System.out.println("connexion faite");
			}
			 else {
	                session.setAttribute("loginError", "Mot de passe incorrect");
	                response.sendRedirect("auth.jsp");
	                System.out.println("Mot de passe incorrect");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

}
