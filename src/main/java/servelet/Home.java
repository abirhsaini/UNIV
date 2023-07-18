package servelet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import beans.etudiant;
import controller.HomeImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Home
 */
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Home() {
       
    	
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HomeImpl home =new controller.HomeImpl();
		HttpSession session = request.getSession();
		try {
			List<etudiant> etudiants = home.allSEtudiants();
			
			session.setAttribute("etudiants", etudiants);
			System.out.print(session.getAttribute("etudiants"));
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
		HomeImpl home =new controller.HomeImpl();
	    String[] selectedIdsArray = request.getParameterValues("selectedIdsInput");
	    System.out.println("selectedIdsArray: " + Arrays.toString(selectedIdsArray));

	    List<String> selectedIds = Arrays.asList(selectedIdsArray);
	    
	    String action= request.getParameter("action");
	    System.out.println(action);
	    if (action.equals("valider")) {
	        for (String id : selectedIds) {
	            try {
	                home.ValiderEtudiant(Integer.parseInt(id));
	                // You can provide a success message here if needed
	            } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
	                e.printStackTrace();
	                // You can handle the exception and provide feedback to the user if needed
	            }
	        }
	        // Redirect the user to the doGet URL after the POST request
	        response.sendRedirect(request.getContextPath() + "/Home");
	        return; // Optional, but it's good practice to stop further processing of the request after the redirect.
	    }
	    
	    request.getRequestDispatcher("/home.jsp").forward(request, response);
	    
	   
	}
	







}
