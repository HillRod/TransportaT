<script src="jquery.js" type="text/javascript"></script> <!--Libreria-->
  <link rel="stylesheet" type="text/css" href="css/card.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"><div class="card">
  <div class="thumbnail"><img class="left" src="res/card.png"/></div>
  <div class="right">
    <h1>Información de tarjeta</h1>
    <div class="author"><img src="https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg"/>
     <h2> 
      <?php
  
  //Paso 1: Conexión
  $Link =  new mysqli("localhost","root","","transportaT");
 
  //Paso 3: Cadena de Alta de tipo de pagos

$Query="SELECT * FROM `PASAJERO` WHERE usuario=".$id;
  $Reciente= mysqli_query($Link,$Query);
//Obtener todos los registros de la tabla
while ($Opc= mysqli_fetch_array($Reciente, MYSQLI_BOTH))
{
echo $Opc['usuario'];
}

?>
    </h2>
    </div>
    <div class="separator"></div>
    <h1>Número de Tarjeta:</h1>
    <h1 class="center"> 
      <?php 
      
//Obtener todos los registros de la tabla
$Query="SELECT * FROM `PASAJERO` WHERE usuario=".$id;
  $Reciente1= mysqli_query($Link,$Query);
while ($Opc1= mysqli_fetch_array($Reciente1, MYSQLI_BOTH))
{
echo $Opc1['tarjeta_idtarjeta'];
}

?></h1>
    <h1>Tipo de Tarjeta:</h1>
    <h1 class="center"> <?php
      $Query="SELECT * FROM `PASAJERO` WHERE usuario=".$id;
  $Reciente= mysqli_query($Link,$Query);
//Obtener todos los registros de la tabla
while ($Opc= mysqli_fetch_array($Reciente, MYSQLI_BOTH))
{
if($Opc['pasajero_tipo_idpasajero_tipo']==1)
  {
    echo "General";
}else
    {
      echo "Preferente";
    }
}

?>
</h1>
<h1>Saldo:</h1>
    <h1 class="center"> <?php
      $Query="SELECT * FROM `PASAJERO` WHERE usuario=".$id;
  $Reciente= mysqli_query($Link,$Query);
//Obtener todos los registros de la tabla
while ($Opc= mysqli_fetch_array($Reciente, MYSQLI_BOTH))
{
echo $Opc['saldo'];
  
}
?>
</h1>
  </div>
  <ul>
    <li><i class="fa fa-sync fa-2x"  title="Cambiar de Tarjeta" ></i></li>
    <li><i class="fa fa-trash fa-2x"  title="Eliminar Tarjeta" ></i></li>
    <li><i class="fa fa-ban fa-2x"  title="Reportar Tarjeta" ></i></li>
    <li><i class="fa fa-check-square fa-2x" title=
      <?php
      $Query="SELECT `activa` FROM `tarjeta` JOIN `pasajero` WHERE idtarjeta=tarjeta_idtarjeta and usuario".$id;
  $Reciente2= mysqli_query($Link,$Query);
//Obtener todos los registros de la tabla
while ($Opc2= mysqli_fetch_array($Reciente2, MYSQLI_BOTH))
{
if ($Opc2['activa']==1)
  {
    echo "Desactivar Tarjeta";
  }else
  {
    echo "Activar Tarjeta";
  } 
}

?> ></i></li>
    <li><i class="fa fa-dollar fa-2x"  title="Recargar Tarjeta" ></i></li>
  </ul>
  <div class="fab"><a href="#"><i class="fa fa-arrow-down fa-3x" ></i> </a></div>
</div>                 


    
