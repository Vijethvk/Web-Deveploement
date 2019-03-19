<?php
   $error="";$successmessage="";
   if($_POST){
   
   if(!$_POST['email']){
   $error.="Email is requried.<br>";
   }
   
   if(!$_POST['subject']){
   $error.="Subject is requried.<br>";
   }
   
   if(!$_POST['content']){
   $error.="Content is requried.<br>";
   }
   
   if($_POST['email'] && filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)===false)
   {
     $error.="The email address is invalid.<br>";
     
   }
   
   if ($error !="") {
                    $error='<div class="alert alert-danger" role="alert"><p><strong>There were some erros(s) correct those before submiting:</strong></p>'.$error.'</div>';
                }
               
    else{
          $emailTo = "friendskarttech@gmail.com";
          $subject = $_POST['subject'];
          $content = $_POST['content'];
          $headers = "From: ".$_POST['email'];
            if(mail($emailTo,$subject,$content,$headers)){
             
              $successmessage='<div class="alert alert-success" role="alert">Your message was sent ,we\'ll get back to you soon!</div>';
            }
           else{
             $error='<div class="alert alert-danger" role="alert">Your message couldn\'t be sent-please try again!</div>';
           }
       }
    }
  
?>


    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap.min.css">
        <script src="../jquery.min.js"></script>
        <script src="../popper.min.js"></script>
        <script src="../bootstrap.min.js"></script>

        <title>Contact</title>
    </head>

    <body>
        <div class="container">
            <h1>Contact Us For Any Queries</h1>
            <div id="error"><?php echo $error.$successmessage ?></div>
            <form method="post">
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" placeholder="name@example.com" name="email">
                    <small class="text-muted">We'll never share your email with anyone</small>
                </div>
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject">
                </div>
                <div class="form-group">
                    <label for="content">What would you like to ask us?</label>
                    <textarea class="form-control" id="content" rows="3" name="content"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <script type="text/javascript">
            $("form").submit(function(e) {
                var error = "";
                if ($("#email").val() == "") {
                    error += "Email is requried.<br>";
                }
                if ($("#subject").val() == "") {
                    error += "Subject is requried.<br>";
                }
                if ($("#content").val() == "") {
                    error += "Conent is requried.<br>";
                }

                if (error != "") {
                    $("#error").html('<div class="alert alert-danger" role="alert"><p><strong>There were some erros(s) correct those before submiting:</strong></p>' + error + '</div>');           
                    return false;
                } else {
                    return true;
                }
            });
           
        </script>

    </body>

    </html>
