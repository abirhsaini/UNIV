package controller;


import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfWriter;

import beans.etudiant;

public class preinscriptionImpl {
	

	private Connection connection;
	private HomeImpl homeImpl=new HomeImpl();
	
	public List<etudiant> getEtudiantsAdmis() throws ClassNotFoundException, SQLException {
		
		List<etudiant> listEtudiants=new ArrayList<etudiant>();
		
		 connexion connexionInstance = new connexion(); // Crï¿½er une instance de la classe connexion
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
		connexion connexionInstance = new connexion(); // Crï¿½er une instance de la classe connexion
	    connection = connexionInstance.connection();
	    PreparedStatement statement =connection.prepareStatement("UPDATE etudiant SET admission = ? WHERE idEtudiant = ?");
	    System.out.println("modidier valider");
	    statement.setString(1, "admis");
	    statement.setInt(2, IdEtudiant);
	    int rSet= statement.executeUpdate();
	    connection.close();
	}
	public etudiant chercherEtudiantCode(String codeEtudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		PreparedStatement statement =connection.prepareStatement("select * from etudiant where codeEtudiant= ?");
		
		statement.setString(1,codeEtudiant);
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
	    	 etudiant.setAdmission(rSet.getString("admission"));
	    	 
	    	 return etudiant;
		}
		return null;
	}
	public void importerEtudiant(FileInputStream inputStream) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
			
			try (
	
		             Workbook workbook = new XSSFWorkbook(inputStream)) {
	
		            Sheet sheet = workbook.getSheetAt(0);
		            // Assuming your Excel data starts from the second row (index 1)
		            for (Row row : sheet) {
		                // Skip the header row (if any)
		                if (row.getRowNum() == 0) {
		                    continue;
		                    
		                }
		                
		             etudiant etudiant = new etudiant();
		             String codeEtudiant = row.getCell(1).getStringCellValue();
		             etudiant.setCodeEtudiant(codeEtudiant);
	
		             String nom = row.getCell(2).getStringCellValue();
		             etudiant.setNom(nom);
	
		             String prenom = row.getCell(3).getStringCellValue();
		             etudiant.setPrenom(prenom);
	
		             String categorie = row.getCell(4).getStringCellValue();
		             etudiant.setCategorie(categorie);
	
		             String typeDeBac = row.getCell(5).getStringCellValue();
		             etudiant.setTypeDeBac(typeDeBac);
	
		             double note = row.getCell(6).getNumericCellValue();
		             etudiant.setNote(note);
		             
		      	     String tel1 = row.getCell(7).getStringCellValue();
		             etudiant.setTel1(tel1);
		             
		             String tel2 = row.getCell(8).getStringCellValue();
		             etudiant.setTel2(tel2);  
		             
		             etudiant.setValider("validé");
		             
		             String statut=row.getCell(9).getStringCellValue();
		             etudiant.setStatut(statut);
		             
		             String reg =row.getCell(10).getStringCellValue();
		             etudiant.setReg(reg);
		             
		             etudiant.setAdmission("admis");
		             
		             
		             
		             etudiant.setStatut("non saturé");
		             etudiant.setDimport((new Date()).toString());
		             etudiant.setReg("N.R");
		             
		             etudiant existEtudiant = chercherEtudiantCode(codeEtudiant);
		             if (existEtudiant==null) {
		             ajouterEtudiant(etudiant);
		             }
		            }
		            
		            System.out.println("Data imported successfully!");
	
		        } 
		}

	public void ajouterEtudiant(etudiant etudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		PreparedStatement statement =connection.prepareStatement("INSERT INTO etudiant ( codeEtudiant, nom, prenom, categorie, typeDeBac, Note, tel1, tel2, valider, statut, Dimport, Reg, admission) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);");
		
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
		    statement.setString(13, etudiant.getAdmission());
		    
		statement.executeUpdate();
		connection.close();
		
	}

	public void modifierEtudiant(etudiant etudiant) throws ClassNotFoundException, SQLException {
		connexion connexionInstance = new connexion(); 
		connection = connexionInstance.connection();
		
		PreparedStatement statement =connection.prepareStatement("UPDATE etudiant SET codeEtudiant=?, nom=?, prenom=?, categorie=?, typeDeBac=?, Note=?, tel1=?, tel2=?, valider=?, statut=?, Dimport=?, Reg=?, admission=? WHERE idEtudiant=?");
		
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
	    statement.setInt(14, etudiant.getIdEtudiant());
	    statement.setString(13, etudiant.getAdmission());
	    System.out.println(statement);    
	statement.executeUpdate();
		
	}

	public etudiant chercherEtudiant(int idEtudiant ) throws ClassNotFoundException, SQLException {
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
	public byte[] createPDFPreinscription(etudiant etudiant) throws IOException {
			LocalDate todaysDate = LocalDate.now();
		    String fileName = "C:\\Users\\pc\\eclipse-workspace\\UNIV\\src\\main\\webapp\\images\\preinscription.pdf";
	        String content = "This is an example PDF text that will be written into the PDF file.";

	        try {
	        	 // Create a new Document
	            Document document = new Document();

	            // Create a ByteArrayOutputStream to write the PDF content
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();

	            // Create a PdfWriter to write the document to the ByteArrayOutputStream
	            PdfWriter.getInstance(document, baos);


	            
	            // Open the document to write content
	            document.open();
	            String FCZPath = "C:\\Users\\pc\\eclipse-workspace\\UNIV\\src\\main\\webapp\\images/logo-off-1.png";
	            Image imageFCZ = Image.getInstance(FCZPath);
	            imageFCZ.scaleToFit(50, 50);
	            
	            String abuPath = "C:\\Users\\pc\\eclipse-workspace\\UNIV\\src\\main\\webapp\\images/abulkassis.png";
	            Image imageabu = Image.getInstance(abuPath);
	            imageabu.scaleToFit(100, 50);
	            imageabu.setAbsolutePosition(PageSize.A4.getWidth() - imageabu.getScaledWidth() - 30, PageSize.A4.getHeight() - imageabu.getScaledHeight() - 30);
	            
	            String cachetPath="C:\\Users\\pc\\eclipse-workspace\\UNIV\\src\\main\\webapp\\images/cachet.png";
	            Image imagecachet=Image.getInstance(cachetPath);
	            imagecachet.scaleToFit(100, 100);
	            imagecachet.setAlignment(Element.ALIGN_RIGHT);
	            
	            Font font = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD,BaseColor.BLACK);
	            Font fontbody = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL,BaseColor.BLACK);
	            
	            Chunk chunkbody = new Chunk("Nous, soussigné Université internationale ABULCASSIS des sciences et santé , aprés examen du dossier présenté, donnons acte à ",fontbody);
	            Font fontEtudiant=new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD,BaseColor.BLACK);
				Chunk chunketudiantChunk =new Chunk( etudiant.getNom() + " " + etudiant.getPrenom() , fontEtudiant);
	            Chunk chunkBody1 = new Chunk(" sa préinscription en Université internationale ABULCASSIS des sciences et santé au titre de l'année academique 2022 - 2023 .",fontbody);
	            Chunk chunkbody2=new Chunk("L'inscription ne sera definitive qu'apres l'admission dans le concour.",fontbody);
	            @SuppressWarnings("deprecation")
				Chunk chunkbody3 =new Chunk ("Fait à Rabat, le "+ todaysDate, fontbody);
	            Chunk chunkfooter =new Chunk ("Direction" , fontEtudiant);
	            Chunk chunk = new Chunk("Attestation de la préinscription ", font);
	            
	            Paragraph objectParagraph = new Paragraph();
	            Paragraph bodyParagraph = new Paragraph();
	            Paragraph bodyParagraph1 = new Paragraph();
	            Paragraph bodyParagraph2 = new Paragraph();
	            Paragraph footerParagraph =new Paragraph();
	            
	            objectParagraph.add(chunk);
	            objectParagraph.setAlignment(Element.ALIGN_CENTER);
	            objectParagraph.setSpacingBefore(150);
	            objectParagraph.setSpacingAfter(30);
	            
	            bodyParagraph.add(chunkbody);
	            bodyParagraph.add(chunketudiantChunk);
	            bodyParagraph.add(chunkBody1);
	            footerParagraph.add(chunkfooter);
	            
	            bodyParagraph.setSpacingAfter(20);
	            bodyParagraph1.add(chunkbody2);
	            bodyParagraph1.setSpacingAfter(20);
	            bodyParagraph2.add(chunkbody3);
	            bodyParagraph2.setSpacingAfter(100);
	            footerParagraph.setAlignment(Element.ALIGN_RIGHT);
	            footerParagraph.setSpacingAfter(40);
	            
	            
	            
	            
	            // Add content to the document
	            document.add(imageFCZ);
	            document.add(imageabu);
	            document.add(objectParagraph);
	            document.add(bodyParagraph);
	            document.add(bodyParagraph1);
	            document.add(bodyParagraph2);
	            document.add(footerParagraph);
	            document.add(imagecachet);
	            document.addTitle("attestation de la preinscription");
	            
	            // Close the document
	            document.close();

	            // Get the PDF content as a byte array
	            byte[] pdfContent = baos.toByteArray();
	            baos.close();

	            return pdfContent;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
			
	    }
	public void imprimmerPreinscription(etudiant etudiant) {
		
		
	}
}
