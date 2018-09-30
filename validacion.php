<?php
	$user = $_POST['user'];
	$pass = $_POST['pass'];
	$enlaceInicial = mysqli_connect("localhost","root","","transportat");
	$cuentas = mysqli_query($enlaceInicial,"SELECT * from pasajero where usuario='" . $user . "'");
	
	if($row = mysqli_fetch_array($cuentas)){
	if($row['pass'] == $pass){
		session_start();
	$_SESSION['usuario'] = $user;
	header("Location: index.php?link=perfil");
	}else{
		echo "Contraseña Incorrecta";
	header("Location: index.php");
	exit();	
	}
	}else{
	header("Location: index.php");
	exit();	
	}
?>