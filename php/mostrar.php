<?php
    include "database.php";
    error_reporting(0);
    session_start();

if(isset($_SESSION["email"]))
{
    header("Location: panel.php");
}

    $sql="SELECT * FROM quiz_app.categories WHERE category_name='$name'";
    $result= mysqli_query($conn, $sql);

    if(!$result->num_rows > 0){

        $sql="INSERT INTO quiz_app.users (user_name, user_email, user_passwd) VALUE ('$username','$email' ,'$password')";
        $result=mysqli_query($conn,$sql);

        if($result){
            echo "<script>alert('Usuario registrado con éxito')</script>";
            $username="";
            $_POST["password"]="";
            $email="";

        }else{
            echo "<script>alert('Hay un error')</script>";
        }


    }else{
        echo "<script>alert('El correo ya existe')</script>";
    }

?>