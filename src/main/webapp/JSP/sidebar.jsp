<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 
	String username ="";
	if (session.getAttribute("username")!=null){
		username = session.getAttribute("username").toString();
	}
	else {
	response.sendRedirect("auth.jsp");
	}%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/home.css">
<title></title>

</head>
<style>
    </style>
<body id="body-pd" style="background-color: #F5F5F5">
<%@ include file="bootstrap.jsp" %>
    <header class="header" id="header" style="background-color: #77B5FE;position:none">
        <div class="header_toggle"><i class='bx bx-menu' id="header-toggle" style="color:white"></i> </div>
        <div class=""  >
          <div class="dropdown dropleft" style="width:100px">
  				<a class="dropdown-toggle" data-toggle="dropdown"  style="color:white" aria-haspopup="true" aria-expanded="false">
    				<img src="./images/profil.png" alt="Nom de l'image" width="30px">
    				<%=username %>
  				</a>
  				<div class="dropdown-menu dropdown-menu" style="z-index: 10000;position:absolute" aria-labelledby="dropdownMenuButton">
    				<a class="dropdown-item disabled"  href="#"> <%=username %></a>
    				<a class="dropdown-item " href="#" >modifier le mot de passe</a>
    				<div class="dropdown-divider"></div>
    				<a class="dropdown-item " href="#" >Déconnexion</a>
 				</div>
 			</div>
        </div>
    </header>
    
    <div class="l-navbar" id="nav-bar" style="background-color: white;">
        <nav class="nav">
            
                <p  class="nav_logo" >
                    <b >UV</b>
                    <br/>
                    <span class="nav_logo-name text-secondary text-center fs-6" >FCZ   MTSI - Solution <br/> Universitaire</span>
                </p>
                <div class="nav_list-wrapper">
                <div class="nav_list list-group list-group-flush overflow-auto vh-100">
                <li data-toggle="collapse" data-target="#products"  class="collapsed" style="color:black">
                    <a href="Home" class="nav_link active  d-flex flex-rows" >
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-people-fill" viewBox="0 0 16 16">
 						 <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
					</svg>
                        <span class="nav_name text-secondary " >etudiant</span>
                          <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="black" class="bi bi-caret-right-fill nav_name" viewBox="0 0 16 16">
 							 <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
						</svg>
                    </a>
                    </li>
                  <ul class="collapse flex-column text-right" id="products" style="font-size: 12px;">
  						<li ><a href="Home" class="text-secondary ">Compte d'étudiant</a></li>
 						 <li><a href="#"  class="text-secondary ">Recherche Avancée</a></li>
 						 <li ><a href="#" class="text-secondary ">Centre d'appel</a></li>
				</ul>
				<li data-toggle="collapse" data-target="#products2"  class="collapsed" style="color:black">
                    <a href="#" class="nav_link d-flex flex-rows">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-people-fill" viewBox="0 0 16 16">
 						 <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
					</svg>
                        <span class="nav_name text-secondary">Pre-inscription</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="black" class="bi bi-caret-right-fill nav_name" viewBox="0 0 16 16">
 							 <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
						</svg>
                    </a>
                    </li>
                    <ul class="collapse flex-column text-right" id="products2" style="font-size: 12px;">
  						<li ><a href="Preinscription" class="text-secondary ">Gestion des pre-inscription</a></li>
					</ul>
				<li data-toggle="collapse" data-target="#products3"  class="collapsed" style="color:black">
                    <a href="#" class="nav_link  d-flex flex-rows">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-people-fill" viewBox="0 0 16 16">
 						 <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
					</svg>
                        <span class="nav_name text-secondary">admission</span>
                          <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="black" class="bi bi-caret-right-fill nav_name" viewBox="0 0 16 16">
 							 <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
						</svg>
                    </a>
                </li>                    
                    <ul class="collapse flex-column text-right" id="products3" style="font-size: 12px;">
  						<li ><a href="#" class="text-secondary ">admission</a></li>
 						 <li><a href="#"  class="text-secondary ">gestion des admisions</a></li>
					</ul>
				<li data-toggle="collapse" data-target="#products4"  class="collapsed" style="color:black">
                    <a href="#" class="nav_link d-flex flex-rows">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-people-fill" viewBox="0 0 16 16">
 						 <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
					</svg>
                        <span class="nav_name text-secondary">inscription</span>
                          <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="black" class="bi bi-caret-right-fill nav_name" viewBox="0 0 16 16">
 							 <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
						</svg>
                    </a>
                    </li>
                    <ul class="collapse flex-column text-right" id="products4" style="font-size: 12px;">
  						<li ><a href="#" class="text-secondary">Gestion des inscriptions</a></li>
 						 <li><a href="#"  class="text-secondary">gestion des groupes</a></li>
					</ul>
                    <a href="#" class="nav_link">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
  						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
					</svg>
                        <span class="nav_name text-secondary">administration epreuve</span>
                    </a>
                    <a href="#" class="nav_link ">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
  						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
					</svg>
                        <span class="nav_name text-secondary">evaluation</span>
                    </a>
                    <a href="#" class="nav_link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-calendar-fill" viewBox="0 0 16 16">
  						<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
                        <span class="nav_name text-secondary">Planification</span>
                    </a>
                    <a href="#" class="nav_link">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-cash" viewBox="0 0 16 16">
 							 <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
  					<path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
					</svg>
                        <span class="nav_name text-secondary">Facture</span>
                    </a>
                    <a href="#" class="nav_link">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-calendar-fill" viewBox="0 0 16 16">
 				 <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"/>
				</svg>
                        <span class="nav_name text-secondary">honoraire</span>
                    </a>
                       <a href="#" class="nav_link">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#303030" class="bi bi-gear-fill" viewBox="0 0 16 16">
  						<path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
						</svg>
                        <span class="nav_name text-secondary">parametrage</span>
                    </a>
                </div>
            </div>
            
        </nav>
    </div>
   
    <!--Container Main start-->
   

    <script src="JS/sidebar.js"></script>
</body>
</html>
