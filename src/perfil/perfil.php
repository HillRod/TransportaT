<?php
$id=$_SESSION['usuario'];
?>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="css/profiles.css">


    <table style="background-color: #fff; margin: auto; border: 20px solid #fff;">
   <tr align="center"   height="80px">
    <td colspan="2"><img width="100px" src="https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg"
    	> </td>
    <td rowspan="4" width="80%">
      <table border="">
        <tr>
          <th>No. Viaje</th>
          <th>Ruta</th>
          <th>ECO</th>
          <th>Fecha</th>
          <th></th>
        </tr>
      <?php
      $query = "SELECT idviaje,ruta,eco,fecha_de_realizacion from viaje join unidad_has_conductor on unidad_has_conductor.unidad_idunidad = viaje.unidad_has_conductor_unidad_idunidad join unidad on unidad.idunidad=unidad_has_conductor.unidad_idunidad join pasajero on pasajero.tarjeta_idtarjeta = viaje.tarjeta_idtarjeta where pasajero.usuario='".$id."'";

      $result = mysqli_query($enlaceInicial,$query);

      while($row=mysqli_fetch_array($result)){
        echo "<tr>";
        echo "<td>";
        echo $row['idviaje'];
        echo "</td>";
        echo "<td>";
        echo $row['ruta'];
        echo "</td>";
        echo "<td>";
        echo $row['eco'];
        echo "</td>";
        echo "<td>";
        echo $row['fecha_de_realizacion'];
        echo "</td>";
        echo "<td>";
        echo "<a href='index.php?link=queja'>Reportar</a>";
        echo "</td>";
        echo "</tr>";

      }
      ?>

      </table>
      <!--<img width="600px" src="res/Historico.PNG" align="center" 
    	>--></td>
  </tr>
  <tr align="center" height="100px">
    <td colspan="2"><h1>		
      <?php
    //Paso 1: Conexión
  $Link =  new mysqli("localhost","root","","transportaT");
 
  //Paso 3: Cadena de Alta de tipo de pagos

$Query="SELECT * FROM `PASAJERO` WHERE usuario='".$id."'";
  $Reciente= mysqli_query($Link,$Query);
 //var_dump($Query);
//Obtener todos los registros de la tabla
while ($Opc= mysqli_fetch_array($Reciente, MYSQLI_BOTH))
{
echo $Opc['usuario'];
}

?>
</h1>
					</td>
					<tr align="center" height="150px">
						
    <td> <i class="fa fa-edit fa-3x"  title="Editar Perfil" ></i></td>
    <td ><a href="?link=out"><i class="fa fa-sign-out fa-3x"  title="Cerrar Sesion" ></i></a></td>


					</tr>
					<tr align="center" >
						<td colspan="2" >
							  <a class="button" href="#popup1" ><img src="res/card.png" width="200px"></a>

<div id="popup1" class="overlay">
	<?php
	include("cardview2.php");
	?>



            </div>
						</td>

					</tr>

				
			
