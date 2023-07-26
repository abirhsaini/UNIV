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
    


/**
 * 
 */