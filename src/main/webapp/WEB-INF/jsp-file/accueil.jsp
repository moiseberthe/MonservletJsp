<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    	if(session.getAttribute("list") == null)	
    		response.sendRedirect(request.getContextPath() + "/connexion");
    %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/accueil.css">
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
    <div class="container">
        <div class="top">
            <p>
                Bienvenu(e) <span><%out.print(user.getFirstname() + " "+ user.getLastname()); %></span>
            </p>
            <a class="my_link" href="<% out.print(request.getContextPath() + "/inscription"); %>">Déconnecter</a>
        </div>
        <div class="bottom">
            <div class="title">
                <h2>Liste des utilisateurs déjà inscrits</h2>
            </div>
            <div class="list">
                <div class="users-list">
	                <%
						List<User> users = (ArrayList<User>) session.getAttribute("list");
	                	int i = 1;
						for(User u : users){
						%>
		                    <div class="user-item">
		                        <div class="item-left">
		                            <div class="item-number"><% out.print(i); %></div>
		                        </div>
		                        <div class="item-right">
		                            <div class="user-name">
		                            	<%out.print(u.getFirstname() + " "+ u.getLastname()); %>
		                            </div>
		                            <div class="user-pseudo">@<% out.print(u.getPseudo()); %></div>
		                            <div class="user-pseudo"><% out.print(u.getEmail()); %></div>
		                        </div>
		                    </div>
                    	<%
                    		i++;
                    	}
					%>
                </div>
				<%
					if(i == 1){
				%>
					<div class="text-center">
						<h3 class="text-center">Aucun membre enregistré</h3>
					</div>
				<%
					}
				%>
            </div>
        </div>
    </div>
</body>
</html>