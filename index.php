<?php
	include("conf/conexion.php");
    $pagina = isset($_GET['link']) ? strtolower($_GET['link']) : 'main';
    // El fragmento de html que contiene la cabecera de nuestra web
    require_once 'src/header/header.php';


    /* Estamos considerando que el parámetro enviando tiene el mismo nombre del archivo a cargar, si este no fuera así
    se produciría un error de archivo no encontrado */
    ?>

    <div id="cuerpo_inv">
    <div id="cuerpo_fondo"></div>
    <div id="cuerpo_cont">   
        <link rel="stylesheet" type="text/css" href="css/body.css"> 
        <link rel="stylesheet" type="text/css" href="css/qs.css">
	 <link rel="stylesheet" type="text/css" href="css/registro.css">
	    <link rel="stylesheet" type="text/css" href="css/encargado.css">
        <link rel="stylesheet" type="text/css" href="css/card.css">
    	<?php

    require_once 'src/'.$pagina.'/' . $pagina . '.php';
    ?>
    </div>
    
    </div>
    
   