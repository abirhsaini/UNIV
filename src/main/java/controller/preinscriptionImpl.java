package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.etudiant;

public class preinscriptionImpl {
	
	private Connection connection;
	
	public List<etudiant> getEtudiantsAdmis() throws ClassNotFoundException, SQLException {
		
		List<etudiant> listEtudiants=new ArrayList<etudiant>();
		
		 connexion connexionInstance = new connexion(); // Créer une instance de la classe connexion
	     connection = connexionInstance.connection();
	     
	     PreparedStatement statement =connection.prepareStatement("select * from etudiant where valider= 'validé' ");
	     ResultSet rSet= statement.executeQuery();
	     while (rSet.next()) {
	    	 
	    	 etudiant etudiant=new etudiant();
	    	 etudiant.setIdEtudiant(rSet.getInt("idEtudiant"));
	    	 etudiant.setCodeEtudiant(rSet.getString("CodeEtudiant"));
	    	 etudiant.setNom(rSet.getString("nom"));
	    	 etudiant.setPrenom(rSet.getString("prenom"));
	    	 etudiant.setCategorie(rSet.getString("categorie"));
	    	 etudiant.setTypeDeBac(rSet.getString("typeDeBac"));
	    	 etudiant.setNote(rSet.getDouble("note"));
	    	 etudiant.setValider(rSet.getString("valider"));
	    	 etudiant.setTel1(rSet.getString("tel1"));
	    	 etudiant.setTel2(rSet.getString("tel2"));
	    	 etudiant.setDimport(rSet.getString("Dimport"));
	    	 etudiant.setStatut(rSet.getString("statut"));
	    	 etudiant.setReg(rSet.getString("reg"));
	    	 etudiant.setAdmission(rSet.getString("admission"));
	    	 listEtudiants.add(etudiant);
	    	 
		     
	    	
	     }
	     connection.close();
		return (ArrayList<etudiant>) listEtudiants;
	}

	public void admisEtudiant(int IdEtudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); // Créer une instance de la classe connexion
	    connection = connexionInstance.connection();
	    PreparedStatement statement =connection.prepareStatement("UPDATE etudiant SET admission = ? WHERE idEtudiant = ?");
	    System.out.println("modidier valider");
	    statement.setString(1, "admis");
	    statement.setInt(2, IdEtudiant);
	    int rSet= statement.executeUpdate();
	    connection.close();
		
	}

}
