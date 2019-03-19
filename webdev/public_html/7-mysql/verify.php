<?php
$msg="";
if(array_key_exists('verifyaccount',$_GET)){
  include("connection.php");
  $query="SELECT id FROM `users` WHERE verify='".$_GET['verifyaccount']."' LIMIT 1";
  $result=mysqli_query($link,$query);
   
  if(mysqli_num_rows($result)>0){
    $query="UPDATE `users` SET status='1' WHERE verify='".$_GET['verifyaccount']."' LIMIT 1"; 
        if( mysqli_query($link,$query) ){
           $msg='<div class="alert alert-success" role="alert">Your account has been activated.please go back and login</div>';
        }
        
  }
}
  include("header.php");
?>  

<div class="container">
  <div id="activation"><?php echo $msg; ?></div>
 <a href='diary.php'><button type="button" name="submit" class="btn btn-success" id="active">Back to Login Page!</button></a>
</div>  

<?php
include("footer.php");
?>