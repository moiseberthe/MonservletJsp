<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="content">
        <form action="/Servlet/inscription" method="post" id="registration">
            <div class="form-content">
                <div class="title text-center">
                    <h2>INSCRIPTION</h2>
                    <p>Veuillez renseigner vos informations pour vous inscrire</p>
                </div>
                <div class="progress-bar">
                    <div class="circle-container">
                        <div class="circle one">1</div>
                        <div class="bar">
                            <div class="bar-content"></div>
                        </div>
                        <div class="circle two">2</div>
                    </div>
                </div>
                <div class="step-container">
                    <div class="step step-one">
                        <div class="form-group">
                            <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Prénom(s)">
                        </div>
                        <div class="form-group">
                            <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Nom de famille"">
                        </div>
                        <div class="form-group mb-0">
                            <input type="text" name="pseudo" id="pseudo" class="form-control" placeholder="Pseudo">
                        </div>
                    </div>
                    <div class="step step-two">
                        <div class="form-group">
                            <input type="email" name="email" id="email" class="form-control" placeholder="Adresse mail">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" id="password" class="form-control" placeholder="Mot de passe" autocomplete="on">
                        </div>
                        <div class="form-group mb-0">
                            <input type="password" name="password1" id="password1" class="form-control" placeholder="Confirmer le mot de passe" autocomplete="on">
                            <div class="invalid-feedback">Les mots de passe ne correspondent pas</div>
                            <div id="popover-password">
                                <p><span id="result"></span></p>
                                <div class="progress">
                                    <div id="password-strength" class="progress-bars password-strength" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="after-form">
                    <div class="navigation">
                        <div class="temp"></div>
                        <button class="prev d-none">Précédent</button>
                        <button class="next" type="submit">Suivant</button>
                    </div>
                    <div class="divider d-flex align-items-center my-2">
                        <p class="text-center">OU</p>
                    </div>
                    <div class="have-content text-center">
                        Vous avez déjà un compte ? <a href="/Servlet/connexion">Se connecter</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>