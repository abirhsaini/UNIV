package servelet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import beans.etudiant;
import controller.HomeImpl;
import controller.preinscriptionImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Preinscription
 */
public class Preinscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	preinscriptionImpl preinscriptionImpl =new controller.preinscriptionImpl();

    /**
     * Default constructor. 
     */
    public Preinscription() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		HttpSession session = request.getSession();
		try {
			List<etudiant> etudiants = preinscriptionImpl.getEtudiantsAdmis();
			System.out.println(etudiants);
			session.setAttribute("etudiants", etudiants);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.getRequestDispatcher("JSP/preinscription.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
	    System.out.println(action);
	    if (action!=null) {
	    	
		    if (action.equals("admission") ) {
		    	String[] selectedIdsArray = request.getParameterValues("selectedIdsInput");
		 	    System.out.println("selectedIdsArray: " + Arrays.toString(selectedIdsArray));
		 	    int numberOfSelectedStudents = selectedIdsArray.length;
		 	    request.setAttribute("numberOfSelectedStudents", numberOfSelectedStudents);
		 	    List<String> selectedIdsList = new ArrayList<>();
		 	    String[] ids = selectedIdsArray[0].split(",");
	            selectedIdsList.addAll(Arrays.asList(ids));	
		 	 
		        for (int k=0; k<selectedIdsList.size();k++) {
		        	
		            try {
		                preinscriptionImpl.admisEtudiant(Integer.parseInt(selectedIdsList.get(k)) );
		                // You can provide a success message here if needed
		            } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
		                e.printStackTrace();
		                // You can handle the exception and provide feedback to the user if needed
		            }
		        }
		        // Redirect the user to the doGet URL after the POST request
		        response.sendRedirect(request.getContextPath() + "/Preinscription");
		        return; // Optional, but it's good practice to stop further processing of the request after the redirect.
		    }
		doGet(request, response);
	}
	}

	}

