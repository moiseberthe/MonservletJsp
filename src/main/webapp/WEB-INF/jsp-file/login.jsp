<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="content">
        <form action="/Servlet/connexion" method="post" id="login">
            <div class="form-content">
                <div class="title text-center">
                    <h2>CONNEXION</h2>
                    <p>Veuillez renseigner vos informations pour vous connecter</p>
                </div>
                <div class="sub-content">
                    <div class="form-group">
                        <input type="email" name="email" id="email" placeholder="Adresse mail">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" placeholder="Mot de passe">
                    </div>
                    <div class="form-group mb-0 submit">
                        <button class="" type="submit">Se connecter</button>
                    </div>
                </div>
                <div class="after-form">
                    <div class="divider d-flex align-items-center my-2">
                        <p class="text-center">OU</p>
                    </div>
                    <div class="have-content text-center">
                        Vous avez déjà un compte ? <a href="/Servlet/inscription">S'inscrire</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>