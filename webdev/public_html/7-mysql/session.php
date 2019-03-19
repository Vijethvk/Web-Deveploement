<?php
session_start();
 
if($_SESSION['email']=='%'){
   echo "Logged in<br>";
}else{
   header('Location : form.php');
 }
?>
