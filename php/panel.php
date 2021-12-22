<?php

session_start();

if(!isset($_SESSION['user_name'])){
    header("Location: ../main.html");
}

?>
<h1>BIENVENIDO A SU CUENTA</h1><br><br>
<a href="desconectar.php">Desconectar</a>