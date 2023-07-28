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
    document.getElementById('addStudentBtn1').addEventListener('click', function(e) {
        if (idEtudiants.length !== 1) {
            alert("Veuillez sélectionner un seul étudiant.");
        } else {
            console.log("ID de l'étudiant sélectionné :", idEtudiants[0]);
           
            var selectedRow = document.querySelector('tr.selected[data-idetudiant]');
            
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
                var admissionEtudiant = selectedRow.querySelector('td[dataadmission]').innerText;
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
                document.querySelector('select[name="admission1"]').value = admissionEtudiant;
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
 document.getElementById('addStudentBtn').addEventListener('click', function() {
        document.getElementById('myModal').style.display = 'block';
        document.body.classList.add('modal-active');
    });
    document.getElementById('importer').addEventListener('click', function() {
        document.getElementById('myModal3').style.display = 'block';
        document.body.classList.add('modal-active3');
    });
    document.getElementById('cancelAddBtn').addEventListener('click', function() {
        document.getElementById('myModal').style.display = 'none';
        document.body.classList.remove('modal-active');
    });
    document.getElementById('cancelAddBtn3').addEventListener('click', function() {
        document.getElementById('myModal3').style.display = 'none';
        document.body.classList.remove('modal-active3');
    });
    
    document.getElementById('cancelAddBtn1').addEventListener('click', function() {
        document.getElementById('myModal1').style.display = 'none';
        document.body.classList.remove('modal-active1');
    });
    document.getElementById("imprimer").addEventListener("click",function(){
	 if (idEtudiants.length !== 1) {
            alert("Veuillez sélectionner un seul étudiant.");
        }
})
     function importExcel() {
        // Récupérer le fichier sélectionné par l'utilisateur
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];
		console.log(fileInput);
		console.log(file)
        // Créer un objet FormData pour envoyer le fichier au serveur
        var formData = new FormData();
        formData.append('file', file);
        console.log(formData)
        // Envoyer le fichier au serveur en utilisant une requête AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'Home'); // Remplacez 'importExcelServlet' par l'URL de votre servlet ou contrôleur de gestion de l'importation
        xhr.onload = function() {
            if (xhr.status === 200) {
                alert('Importation réussie !');
            } else {
                alert('Erreur lors de l\'importation du fichier.');
            }
        };
        xhr.send(formData);
    }

/**
 * 
 */