package servelet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import beans.etudiant;
import controller.HomeImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class Home
 */

@MultipartConfig
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Home() {
       
    	
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		HomeImpl home =new controller.HomeImpl();
		HttpSession session = request.getSession();
		try {
			List<etudiant> etudiants = home.allSEtudiants();
			session.setAttribute("etudiants", etudiants);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		request.getRequestDispatcher("JSP/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
		HomeImpl home =new HomeImpl();
	
	    String action= request.getParameter("action");
	    System.out.println(action);
	    if (action!=null) {
	    	
		    if (action.equals("valider") ) {
		    	String[] selectedIdsArray = request.getParameterValues("selectedIdsInput");
		 	    System.out.println("selectedIdsArray: " + Arrays.toString(selectedIdsArray));
		 	    int numberOfSelectedStudents = selectedIdsArray.length;
		 	    request.setAttribute("numberOfSelectedStudents", numberOfSelectedStudents);
		 	   List<String> selectedIdsList = new ArrayList<>();
		 	    String[] ids = selectedIdsArray[0].split(",");
	            selectedIdsList.addAll(Arrays.asList(ids));	
		 	 
		        for (int k=0; k<selectedIdsList.size();k++) {
		        	
		            try {
		                home.ValiderEtudiant(Integer.parseInt(selectedIdsList.get(k)) );
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
		    if(action.equals("ajouter")) {
		    	System.out.println("ajouter entrer");
		    	etudiant etudiant =new etudiant();
		    	Date date= new Date();
		    	String etudiantCode= request.getParameter("studentCode");
		    	String etudiantnom= request.getParameter("studentName");
		    	String etudiantprenom= request.getParameter("studentPrenom");
		    	String studentCategorie= request.getParameter("studentCategorie");
		    	String studentTypeDeBac= request.getParameter("studentTypeDeBac");
		    	String studentNote= request.getParameter("studentNote");
		    	String studentTel1= request.getParameter("studentTel1");
		    	String studentTel2= request.getParameter("studentTel2");
		    	String etudiantvalider= request.getParameter("valider");
		    	String etudiantsatuer= request.getParameter("satuer");
		    	String etudiantReglement= request.getParameter("reglement");
		    	
		    	etudiant.setCategorie(studentCategorie);
		    	etudiant.setCodeEtudiant(etudiantCode);
		    	etudiant.setDimport(date.toString());
		    	etudiant.setNom(etudiantnom);
		    	etudiant.setNote(Double.parseDouble(studentNote));
		    	etudiant.setPrenom(etudiantprenom);
		    	etudiant.setReg(etudiantReglement);
		    	etudiant.setStatut(etudiantsatuer);
		    	etudiant.setTel1(studentTel1);
		    	etudiant.setTel2(studentTel2);
		    	etudiant.setTypeDeBac(studentTypeDeBac);
		    	etudiant.setValider(etudiantvalider);
		    	
		    	try {
					home.ajouterEtudiant(etudiant);
					response.sendRedirect(request.getContextPath() + "/Home");
			        return;
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
		    	
		    	
		    }
		    if (action.equals("importer")) {
		        Part filePart = request.getPart("file");
		        
		        FileInputStream fileInputStream =(FileInputStream) filePart.getInputStream();
		        System.out.print(filePart.getName());
		        try {
					home.importerEtudiant(fileInputStream);
					response.sendRedirect(request.getContextPath() + "/Home");
			        return;
				} catch (ClassNotFoundException | SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        
		        response.setStatus(HttpServletResponse.SC_OK);
		    }
		  
		    if (action.equals("modifier-phase2")) {
		    	String[] selectedIdsArray = request.getParameterValues("selectedIdsInput");
		 	    System.out.println("selectedIdsArray: " + Arrays.toString(selectedIdsArray));
		 	    int numberOfSelectedStudents = selectedIdsArray.length;
		 	    request.setAttribute("numberOfSelectedStudents", numberOfSelectedStudents);
		 	   List<String> selectedIds = Arrays.asList(selectedIdsArray);
		    	try {
					etudiant etudiant=home.chercherEtudiant(Integer.parseInt(selectedIds.get(0)));
					String etudiantCode= request.getParameter("studentCode1");
			    	String etudiantnom= request.getParameter("studentName1");
			    	String etudiantprenom= request.getParameter("studentPrenom1");
			    	String studentCategorie= request.getParameter("categorie1");
			    	System.out.println(studentCategorie);
			    	String studentTypeDeBac= request.getParameter("typeDeBac1");
			    	String studentNote= request.getParameter("studentNote1");
			    	String studentTel1= request.getParameter("studentTel11");
			    	String studentTel2= request.getParameter("studentTel21");
			    	String etudiantvalider= request.getParameter("valider1");
			    	String etudiantsatuer= request.getParameter("statut1");
			    	String etudiantReglement= request.getParameter("reglement1");
			    	etudiant.setCategorie(studentCategorie);
			    	etudiant.setCodeEtudiant(etudiantCode);
			    	etudiant.setNom(etudiantnom);
			    	etudiant.setStatut(etudiantsatuer);
			    	etudiant.setNote(Double.parseDouble(studentNote));
			    	etudiant.setPrenom(etudiantprenom);
			    	etudiant.setReg(etudiantReglement);
			    	etudiant.setStatut(etudiantsatuer);
			    	etudiant.setTel1(studentTel1);
			    	etudiant.setTel2(studentTel2);
			    	etudiant.setTypeDeBac(studentTypeDeBac);
			    	etudiant.setValider(etudiantvalider);
			    	home.modifierEtudiant(etudiant);
			    	response.sendRedirect(request.getContextPath() + "/Home");
			        return;
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    
		    }
		   
	    
	    }
	    
	    request.getRequestDispatcher("JSP/home.jsp").forward(request, response);
	    
	   
	}
	







}