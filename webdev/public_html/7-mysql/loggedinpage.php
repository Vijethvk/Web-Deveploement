<?php
session_start();
$diarycontent="";
if(array_key_exists("id",$_COOKIE)){
  $_SESSION['id']=$_COOKIE['id'];  
}

 if(array_key_exists("id",$_SESSION)){
 //echo "<p>Logged In!<a href='diary.php?logout=1'>Log Out</a></p>";
   include("connection.php");
   $query="SELECT diary FROM `users` WHERE id='".$_SESSION['id']."'LIMIT 1";
   
   $row=mysqli_fetch_array(mysqli_query($link,$query));
   $diarycontent = $row['diary'];
                                                 
 }else{
  header("Location: diary.php"); 
 }
 include("header.php");
?>
<nav class="navbar navbar-light bg-faded navbar-fixed-top">
  <a class="navbar-brand" >Secret Diary</a>
  
    <div class="pull-xs-right">
       <a href='diary.php?logout=1'><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button></a>
   </div>
</nav>

<div class="container-fluid">
  <textarea class="form-control" id="diary"><?php echo $diarycontent; ?></textarea>
</div>  

<?php
include("footer.php");
?>