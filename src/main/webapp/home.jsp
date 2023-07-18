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
	response.sendRedirect("auth.jsp");
	}%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>

    <jsp:include page="WEB-INF/sidebar.jsp" />
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
                      <input type="hidden" name="selectedIdsInput" id="selectedIdsInput" value="" />
                    <button class="btn btn-success btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                        </svg>
                        importer etudiant
                    </button>
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
                    <button class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                        </svg>
                        modifier
                    </button>
                    <button class="btn btn-primary btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-5H2a.5.5 0 0 1 0-1h3V2.5A.5.5 0 0 1 8 2zm0-2A1.5 1.5 0 0 0 6.5.5h-3A1.5 1.5 0 0 0 2 2v3H.5a.5.5 0 0 0 0 1H2v3a1.5 1.5 0 0 0 1.5 1.5h3A1.5 1.5 0 0 0 8 9.5v-3h3a.5.5 0 0 0 0-1H8V2.5A1.5 1.5 0 0 0 6.5 1z"/>
                        </svg>
                        ajouter
                    </button>
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
				            <td><c:out value="${etudiant.idEtudiant}" /></td>
				            <td><c:out value="${etudiant.codeEtudiant}" /></td>
				            <td><c:out value="${etudiant.nom}" /></td>
				            <td><c:out value="${etudiant.prenom}" /></td>
				            <td><c:out value="${etudiant.categorie}" /></td>
				            <td><c:out value="${etudiant.typeDeBac}" /></td>
				            <td><c:out value="${etudiant.note}" /></td>
				            <td><c:out value="${etudiant.tel1}" /></td>
				            <td><c:out value="${etudiant.tel2}" /></td>
				            <td><c:out value="${etudiant.valider}" /></td>
				            <td><c:out value="${etudiant.statut}" /></td>
				            <td><c:out value="${etudiant.getDimport()}" /></td>
				            <td><c:out value="${etudiant.reg}" /></td>
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
        
        // Acc�der � l'id de l'�tudiant de la ligne s�lectionn�e
        var idEtudiant = e.currentTarget.getAttribute("data-idetudiant");
        
        // V�rifier si l'ID de l'�tudiant est d�j� pr�sent dans le tableau
        var index = idEtudiants.indexOf(idEtudiant);
        if (index !== -1) {
            // L'ID est d�j� pr�sent, le supprimer du tableau
            idEtudiants.splice(index, 1);
            console.log('ID de l\'�tudiant supprim� :', idEtudiant);
        } else {
            // L'ID n'est pas pr�sent, l'ajouter au tableau
            idEtudiants.push(idEtudiant);
            console.log('Nouvel ID de l\'�tudiant ajout� :', idEtudiant);
        }
        
        console.log('Tableau des ID d\'�tudiants :', idEtudiants);
        document.getElementById('selectedIdsInput').value = idEtudiants.join(",");
    });
    
</script>

</body>
</html>
