<?php
  if (!isset($_SESSION['usuario'])) {

  }
  else{header("Location: index.php?link=perfil");}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Iniciar sesión</title>
        
        <link rel="stylesheet" type="text/css" href="css/login.css">
        
    </head>
    <body>
        <div class="" id="main-container">
          
            <form id="acceso" action="validacion.php" method="POST">
                <input type="email"  name="user" class="campo" placeholder="Nombre Usuario" autofocus maxlength="65" required>
                <input type="password" name="pass" class="campo" placeholder="Password" maxlength="85" required>
                <div class="" id="control">
                    <div id="boton">
                        <button type="submit" id="btn-sign-in" name="btn-sign-in"> Iniciar Sesion</button>
                    </div>
                </div>
            </form>
        </div>
   </body>
</html>
