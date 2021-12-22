<?php

$server="localhost";
$user="admin";
$pass="psswd";
$database="quiz_app";

$conn = mysqli_connect($server,$user,$pass,$database);

if(!$conn){
    die("Conexión fallida");
}

?>