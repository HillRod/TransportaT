<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" type="text/css" href="css/header.css"> 
    <title>TransportaT</title>
</head>
<body>
        <div id="barra_inv">
            <div id="barra_fondo"></div>

            <div id="barra_cont"> 
                <table>
                <td>
                    <a href="?link=main">
                    <img src="res/logo/logo-placeholder.png">
                    </a>
                </td>
            </table>
            </div>            
        </div>
        <div id="barra_enlaces">
            <table>
                <td> <a href="?link=login">
                            <?php
                            session_start();
                            if (!isset($_SESSION['usuario'])) {
                                echo "Iniciar Sesion";
                            }
                            else{
                            echo "Usuario: ".$_SESSION['usuario'];
                            }
                            ?>
            </a></td>
                <td> <a href="?link=queja"><?php
                            if (!isset($_SESSION['usuario'])) {
                                echo "Queja";
                            }
                            
                            ?></a> </td>
                <td><a href="?link=sugerencia">
                    <?php
                            if (!isset($_SESSION['usuario'])) {
                                echo "Suegerencia";
                            }
                            
                            ?>
                </a></td>
                <td><a href="?link=registro">
                    <?php
                            if (!isset($_SESSION['usuario'])) {
                                echo "Registro";
                            }
                            
                            ?>
                </a></td>
                
            </table>
        </div>
</body>
</html>
