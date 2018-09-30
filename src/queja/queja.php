<body>
<body>
<script src="jquery.js" type="text/javascript"></script> <!--Libreria-->
  <link rel="stylesheet" type="text/css" href="css/sugerencia.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"><div class="card">
      
  <div class="space"></div>
    <div class="author">
     <h2> 
      Quejas
    </h2>
  </div>
    <div class="separator"></div>
    <h1>Asunto:</h1>
    <input type="text" name="tituloQueja" class="campo" placeholder="Titulo" size="80">
    <?php
    if(!isset($_SESSION['usuario'])){
      echo "<h1>Ruta</h1>";
      echo "<input type='text' name='ruta' class='campo' placeholder='Ruta' size='25'>";
      echo "<h1>ECO</h1>";
      echo "<input type='text' name='ECO' class='campo' placeholder='ECO' size='25'>";
    }
    ?>
    <h1>Descripción:</h1>
	<textarea class="campo" placeholder="Descripción" cols="80" rows="6"></textarea>
     <div class="fab"><a href="#"><i class="fa fa-check fa-3x" ></i> </a></div>
</div>

</body>
</body> 