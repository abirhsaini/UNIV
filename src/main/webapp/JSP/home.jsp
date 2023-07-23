<%@page import="java.util.ArrayList"%>
<%@page import="beans.etudiant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="beans.etudiant" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	String username ="";
	if (session.getAttribute("username")!=null){
		username = session.getAttribute("username").toString();

	}
	else {
	response.sendRedirect(request.getContextPath());
	}%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
<style>
/* The modal container */
.modal {
  display: none; /* Hide the modal by default */
  position:fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.4); /* Black background with transparency */
}

/* Modal content */
.modal-content {
  background-color: #fefefe;
  margin: 10% auto; /* 15% from the top and centered */
  padding: 10px;
  border: 1px solid #888;
  width: 80%; /* Could be adjusted based on your preference */
}
.modal1 {
  display: none; /* Hide the modal by default */
position:fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.4); /* Black background with transparency */
}

/* Modal content */
.modal-content1 {
  background-color: #fefefe;
  margin: 10% auto; /* 15% from the top and centered */
  padding: 30px;
  border: 1px solid #888;
  width: 80%; /* Could be adjusted based on your preference */
}

/* Hide other elements when the modal is active */
body.modal-active {
  overflow: hidden;
}
body.modal-active1 {
  overflow: hidden;
}
input{
	padding:5px;
	text-align:center;
	border-radius:10px;
	border: thin solid #000}
</style>

    <jsp:include page="../WEB-INF/sidebar.jsp" />

    <div style="margin-left:60px">
        <div class="bg-white" style="margin-top:-20px;z-index:100;position:relative">
            <div class="container" style="display: flex;align-items: center;justify-content: space-between; padding:10px;">
                <strong>compte etudiant</strong>
                <div>
                <form action="Home" method="post">
                
                    <button class="btn btn-primary btn-sm" type="submit" name="action" value="valider">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                        </svg>
                        valider
                    </button>
                      
                    <button class="btn btn-success btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                        </svg>
                        importer etudiant
                    </button>
                    <input type="hidden" name="selectedIdsInput" id="selectedIdsInput" value="" />
                    <button class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                            <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2 2 2 0 0 0 2-2V4a2 2 0 0 0-2-2 2 2 0 0 0-2-2zm2 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1V3zM2 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V2z"/>
                            <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                        </svg>
                        status
                    </button>
                    <button class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-files-alt" viewBox="0 0 16 16">
                            <path d="M11 0H3a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2 2 2 0 0 0 2-2V4a2 2 0 0 0-2-2 2 2 0 0 0-2-2zm2 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1V3zM2 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V2z"/>
                        </svg>
                        releve de note
                    </button>
                    <button class="btn btn-primary btn-sm" type="button"  id="addStudentBtn1" name="action" value="modifier-phase1" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                        </svg>
                        modifier
                        
                    </button>
                       <button class="btn btn-primary btn-sm" type="button" id="addStudentBtn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-5H2a.5.5 0 0 1 0-1h3V2.5A.5.5 0 0 1 8 2zm0-2A1.5 1.5 0 0 0 6.5.5h-3A1.5 1.5 0 0 0 2 2v3H.5a.5.5 0 0 0 0 1H2v3a1.5 1.5 0 0 0 1.5 1.5h3A1.5 1.5 0 0 0 8 9.5v-3h3a.5.5 0 0 0 0-1H8V2.5A1.5 1.5 0 0 0 6.5 1z"/>
                        </svg>
                        ajouter
                    </button>
                     <div id="myModal1" class="modal1">
							  <div class="modal-content1">
				                    <form action="Home" method="post">
				                    	 <div class="row justify-content-center">
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentName1" class="form-control" placeholder="Nom de l'étudiant" value="${nomEtudiant}" >
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentPrenom1" class="form-control" value="${prenomEtudiant}" placeholder="Prénom de l'étudiant">
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentCode1" value="${codeEtudiant}" class="form-control" placeholder="Code de l'étudiant">
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentNote1" value="${noteEtudiant}" class="form-control" placeholder="Note de l'étudiant" >
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentTel11" value="${tel1Etudiant}" class="form-control" placeholder="Téléphone 1">
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentTel21"value="${tel2Etudiant}"  class="form-control" placeholder="Téléphone 2" >
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="categorie1"  >
							                        <option selected disabled>${categorieEtudiant}</option>
							                        <option value="payant">payant</option>
							                        <option value="boursier">boursier</option>
							                        <option value="etranger">etranger</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="typeDeBac1" >
							                        <option selected disabled>${typeDeBacEtudiant}</option>
							                        <option value="public">public</option>
							                        <option value="etranger">etranger</option>
							                        <option value="prive">prive</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="valider1" >
							                        <option selected disabled>${validerEtudiant}</option>
							                        <option value="validé">validé</option>
							                        <option value="non validé">non validé</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="statut1" >
							                        <option selected disabled>${statutEtudiant}</option>
							                        <option value="saturé">satué</option>
							                        <option value="non saturé">non satué</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="reglement1" >
							                        <option selected disabled>${regEtudiant}</option>
							                        <option value="R">R</option>
							                        <option value="N.R">N.R</option>
							                    </select>
							                </div>
							            </div>
							            <div class="row justify-content-center mt-2">
							                <div class="col-md-8 text-center">
							                    <button type="submit" class="btn btn-primary btn-lg"  name="action" value="modifier-phase2" >modifier l'étudiant</button>
							                    <button type="button" class="btn btn-secondary btn-lg" id="cancelAddBtn1">Annuler</button>
							                </div>
							            </div>
							        </form>
                    </div>
                    </div>
                 
                    
            		 <div id="myModal" class="modal">
							  <div class="modal-content">
							    <!-- Add your form here -->
							    <!-- For example: -->
							     <form  method="post">
							            <div class="row justify-content-center">
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentName" class="form-control" placeholder="Nom de l'étudiant" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentPrenom" class="form-control" placeholder="Prénom de l'étudiant" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentCode" class="form-control" placeholder="Code de l'étudiant" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentNote" class="form-control" placeholder="Note de l'étudiant" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentTel1" class="form-control" placeholder="Téléphone 1" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <input type="text" name="studentTel2" class="form-control" placeholder="Téléphone 2" required>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="studentCategorie" required>
							                        <option selected disabled>Catégorie</option>
							                        <option value="payant">payant</option>
							                        <option value="boursier">boursier</option>
							                        <option value="etranger">etranger</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="studentTypeDeBac" required>
							                        <option selected disabled>Type de bac</option>
							                        <option value="public">public</option>
							                        <option value="etranger">etranger</option>
							                        <option value="prive">prive</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="valider" required>
							                        <option selected disabled>Valider</option>
							                        <option value="1">validé</option>
							                        <option value="2">non validé</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="satuer" required>
							                        <option selected disabled>Statut</option>
							                        <option value="satué">satué</option>
							                        <option value="non satué">non satué</option>
							                    </select>
							                </div>
							                <div class="col-md-4 mb-3">
							                    <select class="form-select" name="reglement" required>
							                        <option selected disabled>Réglement</option>
							                        <option value="R">R</option>
							                        <option value="N.R">N.R</option>
							                    </select>
							                </div>
							            </div>
							            <div class="row justify-content-center mt-2">
							                <div class="col-md-8 text-center">
							                    <button type="submit" class="btn btn-primary btn-lg"  name="action" value="ajouter" >Ajouter l'étudiant</button>
							                    <button type="button" class="btn btn-secondary btn-lg" id="cancelAddBtn">Annuler</button>
							                </div>
							            </div>
							        </form>
					  </div>
				</div>
                    </form>
                </div>
            </div>
        </div>
        <div class="bg-white mt-4 p-4">
            <p class="text-primary font-weight-bold">Tableau des etudiants</p>
            
 
            <table id="example" class="table table-striped " style="width:100px;font-size: 15px;">
                <thead>
                    <tr>
                        <th class="th-sm">id</th>
                        <th class="th-sm">code</th>
                        <th class="th-sm">Nom</th>
                        <th class="th-sm">Prenom</th>
                        <th class="th-sm">categorie</th>
                        <th class="th-sm">type de bac</th>
                        <th class="th-sm">note</th>
                        <th class="th-sm">Tel1</th>
                        <th class="th-sm">Tel2</th>
                        <th class="th-sm">valider</th>
                        <th class="th-sm">D.D.appele</th>
                        <th class="th-sm">D.import</th>
                        <th class="th-sm">Reg</th>
                   
                    </tr>
                </thead>
                <tbody>
                
				     <c:forEach var="etudiant" items="${etudiants}">
				        <tr data-idetudiant="${etudiant.idEtudiant}">
				            <td dataId="id"><c:out value="${etudiant.idEtudiant}" /></td>
				            <td dataCode="code"><c:out value="${etudiant.codeEtudiant}" /></td>
				            <td dataNom="nom"><c:out value="${etudiant.nom}" /></td>
				            <td dataprenom="prenom" ><c:out value="${etudiant.prenom}" /></td>
				            <td datacategorie="categorie"><c:out value="${etudiant.categorie}" /></td>
				            <td datatypeDeBac="typeDeBac"><c:out value="${etudiant.typeDeBac}" /></td>
				            <td datanote="note"><c:out value="${etudiant.note}" /></td>
				            <td datatel1="tel1"><c:out value="${etudiant.tel1}" /></td>
				            <td datatel2="tel2"><c:out value="${etudiant.tel2}" /></td>
				            <td datavalider="valider"><c:out value="${etudiant.valider}" /></td>
				            <td datastatut="statut"><c:out value="${etudiant.statut}" /></td>
				            <td ><c:out value="${etudiant.getDimport()}" /></td>
				            <td datareg="reg"><c:out value="${etudiant.reg}" /></td>
				        </tr>
				    </c:forEach>
                </tbody>
               
            </table>
        </div>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <script>
    let table = new DataTable('#example', { scrollX: true });
    const idEtudiants = [];
    table.on('click', 'tbody tr', function (e) {
        e.currentTarget.classList.toggle('selected');
        
        // Accéder à l'id de l'étudiant de la ligne sélectionnée
        var idEtudiant = e.currentTarget.getAttribute("data-idetudiant");
        
        // Vérifier si l'ID de l'étudiant est déjà présent dans le tableau
        var index = idEtudiants.indexOf(idEtudiant);
        if (index !== -1) {
            // L'ID est déjà présent, le supprimer du tableau
            idEtudiants.splice(index, 1);
            console.log('ID de l\'étudiant supprimé :', idEtudiant);
        } else {
            // L'ID n'est pas présent, l'ajouter au tableau
            idEtudiants.push(idEtudiant);
            console.log('Nouvel ID de l\'étudiant ajouté :', idEtudiant);
        }
        
        console.log('Tableau des ID d\'étudiants :', idEtudiants);
        document.getElementById('selectedIdsInput').value = idEtudiants.join(",");
    });
 
    document.getElementById('addStudentBtn').addEventListener('click', function() {
        document.getElementById('myModal').style.display = 'block';
        document.body.classList.add('modal-active');
    });

    document.getElementById('cancelAddBtn').addEventListener('click', function() {
        document.getElementById('myModal').style.display = 'none';
        document.body.classList.remove('modal-active');
    });
    
    document.getElementById('cancelAddBtn1').addEventListener('click', function() {
        document.getElementById('myModal1').style.display = 'none';
        document.body.classList.remove('modal-active1');
    });

    document.getElementById('addStudentBtn1').addEventListener('click', function(e) {
        if (idEtudiants.length !== 1) {
            alert("Veuillez sélectionner un seul étudiant.");
        } else {
            console.log("ID de l'étudiant sélectionné :", idEtudiants[0]);
           
            var selectedRow = document.querySelector('tr.selected[data-idetudiant]');
            console.log(selectedRow.querySelector('td[datavalider]').innerText);
            if (selectedRow) {
            	var studentId = selectedRow.querySelector('td[dataId]').innerText;
                var studentCode = selectedRow.querySelector('td[dataCode]').innerText;
                var studentName = selectedRow.querySelector('td[dataNom]').innerText;
                var studentPrenom = selectedRow.querySelector('td[dataprenom]').innerText;
                var studentCategorie = selectedRow.querySelector('td[datacategorie]').innerText;
                var studentTypeDeBac = selectedRow.querySelector('td[datatypeDeBac]').innerText;
                var studentNote = selectedRow.querySelector('td[datanote]').innerText;
                var studentTel1 = selectedRow.querySelector('td[datatel1]').innerText;
                var studentTel2 = selectedRow.querySelector('td[datatel2]').innerText;
                var validerEtudiant = selectedRow.querySelector('td[datavalider]').innerText;
                var statutEtudiant = selectedRow.querySelector('td[datastatut]').innerText;
                var regEtudiant = selectedRow.querySelector('td[datareg]').innerText;

                // Populate the form fields in the modal with the student information
                document.querySelector('input[name="studentName1"]').value = studentName;
                document.querySelector('input[name="studentPrenom1"]').value = studentPrenom;
                document.querySelector('input[name="studentCode1"]').value = studentCode;
                document.querySelector('input[name="studentNote1"]').value = studentNote;
                document.querySelector('input[name="studentTel11"]').value = studentTel1;
                document.querySelector('input[name="studentTel21"]').value = studentTel2;
                document.querySelector('select[name="categorie1"]').value = studentCategorie;
                document.querySelector('select[name="typeDeBac1"]').value = studentTypeDeBac;
                document.querySelector('select[name="valider1"]').value = validerEtudiant;
                document.querySelector('select[name="statut1"]').value = statutEtudiant;
                document.querySelector('select[name="reglement1"]').value = regEtudiant;

                // Display the modal for modification
                document.getElementById('myModal1').style.display = 'block';
                document.body.classList.add('modal-active1');
            } else {
                console.log('Please select a row before clicking on "modifier".');
            }
        }
    });
   
</script>


</body>
</html>
