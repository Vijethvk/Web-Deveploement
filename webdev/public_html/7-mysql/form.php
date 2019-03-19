<?php
 session_start();
 $link=mysqli_connect("shareddb-h.hosting.stackcp.net","myusers-33331cd4","on7ygo0emk","myusers-33331cd4");
    
    if(mysqli_connect_error())
    {
      die("error connecting to server");
    } 

if(array_key_exists('email',$_POST) or array_key_exists('password',$_POST))
{
  
   if($_POST['email']=="")
   {
     echo "<p>email is required<p>";
    }
  else if($_POST['password']=="")
  {
     echo "<p>password is required</p>";
  }
  else
  {    
    
    $query="SELECT `id` FROM `users` WHERE email='".mysqli_real_escape_string($link,$_POST['email'])."'";
     $result=mysqli_query($link,$query);
     
     if(mysqli_num_rows($result) > 0)
     {
       echo "<p>user with email id ".$_POST['email']." already exist</p>";
     }
    else
     {
           $query="INSERT INTO `users` (`email`,`password`) VALUES ('".$_POST['email']."','".$_POST['password']."')";
          
              if(mysqli_query($link,$query))
                 {
                   $_SESSION['email']=$_POST['email'];
                   header('Location : session.php');
                 } 
              else{
                   echo "<p> Something is worng please try again later</p>";
                  }
      } 
   }  
  
}  
?>
<form method="post">
  <input name='email' type="text" placeholder="Email address">
  <input name="password" type="password" placeholder="Password">
  <input type="submit" value="Sign Up">
</form> 