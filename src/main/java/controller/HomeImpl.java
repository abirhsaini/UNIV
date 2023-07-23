package controller;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.etudiant;

public class HomeImpl {
	
	private Connection connection;

	public ArrayList<etudiant> allSEtudiants() throws ClassNotFoundException, SQLException {
		List<etudiant> listEtudiants=new ArrayList<etudiant>();
		
		 connexion connexionInstance = new connexion(); // Créer une instance de la classe connexion
	     connection = connexionInstance.connection();
	     
	     PreparedStatement statement =connection.prepareStatement("select * from etudiant");
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
	    	 listEtudiants.add(etudiant);
	    	 
		     
	    	
	     }
	     connection.close();
		return (ArrayList<etudiant>) listEtudiants;
		
	}
	
	public void ValiderEtudiant(int IdEtudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); // Créer une instance de la classe connexion
	    connection = connexionInstance.connection();
	    PreparedStatement statement =connection.prepareStatement("UPDATE etudiant SET valider = ? WHERE idEtudiant = ?");
	    System.out.println("modidier valider");
	    statement.setString(1, "validé");
	    statement.setInt(2, IdEtudiant);
	    int rSet= statement.executeUpdate();
	    connection.close();
		
	}
	public void ajouterEtudiant(etudiant etudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		PreparedStatement statement =connection.prepareStatement("INSERT INTO etudiant ( codeEtudiant, nom, prenom, categorie, typeDeBac, Note, tel1, tel2, valider, statut, Dimport, Reg) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);");
		
			statement.setString(1, etudiant.getCodeEtudiant());
		    statement.setString(2, etudiant.getNom());
		    statement.setString(3, etudiant.getPrenom());
		    statement.setString(4, etudiant.getCategorie());
		    statement.setString(5, etudiant.getTypeDeBac());
		    statement.setDouble(6, etudiant.getNote());
		    statement.setString(7, etudiant.getTel1());
		    statement.setString(8, etudiant.getTel2());
		    statement.setString(9, etudiant.getValider());
		    statement.setString(10, etudiant.getStatut());
		    statement.setString(11, etudiant.getDimport());
		    statement.setString(12, etudiant.getReg());
		    
		statement.executeUpdate();
		connection.close();
	}
	
	public void modifierEtudiant(etudiant etudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		
		PreparedStatement statement =connection.prepareStatement("UPDATE etudiant SET codeEtudiant=?, nom=?, prenom=?, categorie=?, typeDeBac=?, Note=?, tel1=?, tel2=?, valider=?, statut=?, Dimport=?, Reg=? WHERE idEtudiant=?");
		
		statement.setString(1, etudiant.getCodeEtudiant());
	    statement.setString(2, etudiant.getNom());
	    statement.setString(3, etudiant.getPrenom());
	    statement.setString(4, etudiant.getCategorie());
	    statement.setString(5, etudiant.getTypeDeBac());
	    statement.setDouble(6, etudiant.getNote());
	    statement.setString(7, etudiant.getTel1());
	    statement.setString(8, etudiant.getTel2());
	    statement.setString(9, etudiant.getValider());
	    statement.setString(10, etudiant.getStatut());
	    statement.setString(11, etudiant.getDimport());
	    statement.setString(12, etudiant.getReg());
	    statement.setInt(13, etudiant.getIdEtudiant());
	    System.out.println("EXECUTE");    
	statement.executeUpdate();
	
	connection.close();
		
	}
	public etudiant chercherEtudiant(int idEtudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		PreparedStatement statement =connection.prepareStatement("select * from etudiant where idEtudiant= ?");
		
		statement.setInt(1,idEtudiant );
		ResultSet rSet= statement.executeQuery();
		
		if (rSet.next()) {
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
	    	 
	    	 return etudiant;
		}
		return null;
	}
	

}
