<?php
session_start();
if(!isset($_SESSION['usn']))
  {
    header("Location: index.php");   
  }


  echo $_POST['testid'];
   for($i=1;$i<$_SESSION['max'];$i++)
   {
     
        echo $_POST[$j]."<br>".$_POST[$j.'optradio']
     
   }  

?>