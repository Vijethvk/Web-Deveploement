<?php
session_start();
$error="";
$successmessage="";
$warning="";

if(isset($_GET['logout'])==1){
 session_destroy();
 setcookie("id",$_COOKIE["id"]="",time()-60*60);
 
}else if((array_key_exists("id",$_SESSION) AND $_SESSION['id']) OR (array_key_exists("id",$_COOKIE) AND $_COOKIE['id'])){
header("Location: loggedinpage.php");
}

if(array_key_exists('submit',$_POST)){
  include("connection.php");
  if($_POST['email']==""){
    $error.="Email is required<br>";
  }
  if($_POST['password']==""){
    $error.="Password is required<br>";
  }
  if($error==""){
        if($_POST['signUp']=='1'){
    $query="SELECT id FROM `users` WHERE email='".mysqli_real_escape_string($link,$_POST['email'])."' LIMIT 1";
   
    $result=mysqli_query($link,$query);
    
    if(mysqli_num_rows($result)>0)
    {
      $error = "Account with email ".$_POST['email']." already exist<br>";
    }
    else
    {
           $query="INSERT INTO `users` (`email`,`password`) VALUES ('".mysqli_real_escape_string($link,$_POST['email'])."','".mysqli_real_escape_string($link,$_POST['password'])."')";
     
     if(mysqli_query($link,$query)){
          $query="UPDATE `users` SET password='".md5(md5(mysqli_insert_id($link)).$_POST['password'])."' WHERE id='".mysqli_insert_id($link)."' LIMIT 1";
          mysqli_query($link,$query);
        $verify1=bin2hex(random_bytes(15));
     
          $query="UPDATE `users` SET verify='".$verify1."' WHERE email='".$_POST['email']."' LIMIT 1";
         
         
         if(!mysqli_query($link,$query)){
          $error="something wrong<br>"; 
         }
         
         $emailTo = $_POST['email'];
          $subject = "Verification Link To Activate Secret Diary Account";
          $content = "http://vijethvk11-com.stackstaging.com/7-mysql/verify.php?verifyaccount=".$verify1."<br>Click link to verify and activate your account</a>";
          $headers = "From: secret_diary@gmail.com";
            if(mail($emailTo,$subject,$content,$headers)){
             
              $successmessage='Signup Successful.<br>We have sent verification link Check your  mailbox.(it might be in spam box also)';
            }
           else{
             $error='Something Wrong please try again';
           }
         
       //  header("Location: loggedinpage.php");
      }
     }
    }else{
            $query="SELECT * FROM `users` WHERE email='".mysqli_real_escape_string($link,$_POST['email'])."'";
            $result=mysqli_query($link,$query);
            $row=mysqli_fetch_array($result);
             if(isset($row)){
             
             $hashpassword=md5(md5($row['id']).$_POST['password']);
             
               if($hashpassword==$row['password']){
                 
                 $query="SELECT * FROM `users` WHERE email='".mysqli_real_escape_string($link,$_POST['email'])."'";
                 $row=mysqli_fetch_array(mysqli_query($link,$query));
                 if($row['status']==1){
                
                    $_SESSION['id']=$row['id'];
                 
                  if(isset($_POST['stayloggedin'])=='1'){
                    setcookie("id",$row['id'],time()+60*60*24*365);                
                  }
                  
                  header("Location: loggedinpage.php");
                 }else{
                       $warning="Your account is not activated please check your mailbox for verfication sent from(secret_diary) to activate";
                 }
               }else{
                     
                     $error="Email or Password is incorrect.";
               }
             
             }else{
                 $error="Email or Password is incorrect.";
             }
    }
  }
}
?>

<?php include("header.php") ?>

  <div class="container">
    <h1>Secret Diary!</h1>
    <p><strong>Store your thoughts permanently and securely.</strong></p>
      <div id="error"><?php if($error!=""){
  echo '<div class="alert alert-danger" role="alert">'.$error.'</div>'; }
        if($successmessage!=""){
  echo '<div class="alert alert-success" role="alert">'.$successmessage.'</div>'; }
        if($warning!=""){
  echo '<div class="alert alert-warning" role="alert">'.$warning.'</div>';}?>
      </div>
 
<form method="post" id="loginform">
  <p>Login using email and password</p>
 <div class="form-group">
   <input type="email" class="form-control" name="email" placeholder="Your Email" id="loginemail">
 </div>
 <div class="form-group">  
  <input type="password" class="form-control" name="password" placeholder="Password" id="loginpassword">
 </div>
 <div class="form-check">  
  <input type="checkbox" class="form-check-input" name="stayloggedin" value="1">
  <label class="form-check-label" for="exampleCheck1">Stay logged in</label>
 </div> 
  <input type="hidden" name="signUp" value="0">
  <fieldset class="form-group">
  <button type="submit" name="submit" class="btn btn-success" id="login">Log In!</button>
  </fieldset>  
   <p><a id="togglelogin">Sign Up!</a></p>
</form>  

    
<form method="post" id="signupform">
  <p>Interested? Sign up now.</p>
  <div class="form-group">
     <input type="email" class="form-control" name="email" placeholder="Your Email" id="sigupemail">
    <small id="emailHelp" class="form-text" style="color:white;" >We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
     <input type="password" class="form-control" name="password" placeholder="Password" id="signuppassword">
  </div>
   <div class="form-group">
     <input type="password" class="form-control" name="password" placeholder="Confirm Password" id="confirmpassword">
  </div>
     <input type="hidden" name="signUp" value="1">
     <fieldset class="form-group">
     <button type="submit" name="submit" class="btn btn-success">Sign Up!</button>
     </fieldset>  
  <p><a id="togglesignup">Log in!</a></p>
</form>  
</div>
   
 <?php include('footer.php')?>

