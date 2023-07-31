package servelet;

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

import controller.connexion;



/**
 * Servlet implementation class Login
 */


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username =request.getParameter("username");
		String password=request.getParameter("password");
		Connection connection;
		System.out.println("hhh");
		

			try {
				connexion connexionInstance = new connexion(); // Créer une instance de la classe connexion
			    connection = connexionInstance.connection();
				PreparedStatement  pst=connection.prepareStatement("SELECT iduser FROM user WHERE username=? AND password=?");
				pst.setString(1,username);
				pst.setString(2, password);
				ResultSet rs=pst.executeQuery();
				if (rs.next()) {
					 session.setAttribute("username", username);
					 
					 response.sendRedirect("Home");
					 System.out.println("connexion faite");
				}
				 else {
		                session.setAttribute("loginError", "Mot de passe incorrect");
		                response.sendRedirect("Login");
		                System.out.println("Mot de passe incorrect");
				 }
				connection.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			 
		} 

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/JSP/auth.jsp").forward(req, resp);
			super.doGet(req, resp);
		}
	

}
