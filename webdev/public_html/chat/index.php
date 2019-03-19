<?php
include('database_connection.php');

session_start();
if(!isset($_SESSION['user_id']))
{
 header("location:login.php");
}

//echo "<br>".$_SESSION["otheruser"]."<br>";

/* $query = "
   SELECT * FROM login 
    WHERE user_id ='".mysqli_real_escape_string($link,$_POST['first'])."' LIMIT 1";
      $result=mysqli_query($link,$query);   
  
  if(mysqli_num_rows($result)>0)
 {
   
    while ($row=mysqli_fetch_array($result))   
    {
      //if($_POST["password"]== $row["password"])
      //{
        $_SESSION['user_id'] = $row['user_id'];
        $_SESSION['username'] = $row['username'];
        $_SESSION['notify'] = "";
        $_SESSION['otheruser'] = $_POST['second'];      
        $sub_query = "
        INSERT INTO login_details 
        (user_id) 
        VALUES ('".$row['user_id']."')
        ";
         $result=mysqli_query($link,$sub_query); 
        $_SESSION['login_details_id'] = mysqli_insert_id($link);
          
        header("location:index.php");
        echo $_SESSION['login_details_id'];
      //}
     // else
      //{
      // $message = "<label>Wrong Password</label>";
     // }
    }
 }
*/

?>

<html>  
    <head>  
         <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
        <title>Chat</title>  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.rawgit.com/mervick/emojionearea/master/dist/emojionearea.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.js"></script>  
    </head>  
    <body>  
        <div class="container">
   <br />
   
   <h3 align="center">friendsKart</h3><br />
   <br />
   
   <div class="table-responsive">
    <h4 align="center">Online User</h4>
    <p align="right">Hi - <?php echo $_SESSION['username'];  ?> - <a href="logout.php">Logout</a></p>
    <div id="user_details"></div>
    <div id="user_model_details"></div>
   </div>
  </div>
    </body>  
</html>  




<script>  
$(document).ready(function(){

 // console.log($_POST["first"]);
  
 fetch_user();

 setInterval(function(){
  update_last_activity();
  fetch_user();
  update_chat_history_data(); 
 }, 1000);

 function fetch_user()
 {
  $.ajax({
   url:"fetch_user.php",
   method:"POST",
   success:function(data){
    $('#user_details').html(data);
   }
  })
 }

 function update_last_activity()
 {
  $.ajax({
   url:"update_last_activity.php",
   success:function()
   {

   }
  })
 }

 function make_chat_dialog_box(to_user_id, to_user_name)
 {
  var modal_content = '<div id="user_dialog_'+to_user_id+'" class="user_dialog" title="Chatting with '+to_user_name+'">';
  modal_content += '<div style="height:400px; border:1px solid #ccc; overflow-y: scroll; margin-bottom:24px; padding:16px;" class="chat_history" data-touserid="'+to_user_id+'" id="chat_history_'+to_user_id+'">';
  modal_content += '</div>';
  modal_content += '<div class="form-group">';
  modal_content += '<textarea name="chat_message_'+to_user_id+'" id="chat_message_'+to_user_id+'" class="form-control chat_message"></textarea>';
  modal_content += '</div><div class="form-group" align="right">';
  modal_content+= '<button type="button" name="send_chat" id="'+to_user_id+'" class="btn btn-info send_chat" disabled>Send</button></div></div>';
  $('#user_model_details').html(modal_content);
 }

 $(document).on('click', '.start_chat', function(){
  var to_user_id = $(this).data('touserid');
  var to_user_name = $(this).data('tousername');
  make_chat_dialog_box(to_user_id, to_user_name);
  $("#user_dialog_"+to_user_id).dialog({
   autoOpen:false,
   width:400
  });
  $('#user_dialog_'+to_user_id).dialog('open');
 });
  
 $(document).on('change keyup paste', '.chat_message', function() {
          $(".send_chat").removeAttr("disabled"); 
    }); 
  

 $(document).on('click', '.send_chat', function(){
  var to_user_id = $(this).attr('id');
  var chat_message = $('#chat_message_'+to_user_id).val();

   if(chat_message!=""){
      var x='<?php echo $_SESSION['notify']; ?>';
     if(x == 'Offline'){
       <?php
        
       $squery="SELECT * FROM login WHERE user_id='".$_SESSION['otheruser']."' LIMIT 1"; 
   if($result1 = mysqli_query($link,$squery))
   { $row1 = mysqli_fetch_assoc($result1);
       
        $emailTo = $row1['email'];
          $subject = "New Chat";
          $content = "You have a new chat from ".$_SESSION['username'];
          $headers = "From: "."friendskarttech@gmail.com";
          mail($emailTo,$subject,$content,$headers);
   }else{
       
      echo "Something Went Wrong";
   }
       
       ?>
       
       
     }
       
   
  $.ajax({
   url:"insert_chat.php",
   method:"POST",
   data:{to_user_id:to_user_id, chat_message:chat_message},
   success:function(data)
   {
    $('#chat_message_'+to_user_id).val('');
    $('#chat_history_'+to_user_id).html(data);
    
   }
  })
  
   }
  
 });
 
   function fetch_user_chat_history(to_user_id)
 {
  $.ajax({
   url:"fetch_user_chat_history.php",
   method:"POST",
   data:{to_user_id:to_user_id},
   success:function(data){
    $('#chat_history_'+to_user_id).html(data);
   }
  })
 }

 function update_chat_history_data()
 {
  $('.chat_history').each(function(){
   var to_user_id = $(this).data('touserid');
   fetch_user_chat_history(to_user_id);
  });
 }

 $(document).on('click', '.ui-button-icon', function(){
  $('.user_dialog').dialog('destroy').remove();
 });
 
   $(document).on('focus', '.chat_message', function(){
  var is_type = 'yes';
  $.ajax({
   url:"update_is_type_status.php",
   method:"POST",
   data:{is_type:is_type},
   success:function()
   {

   }
  })
 });

 $(document).on('blur', '.chat_message', function(){
  var is_type = 'no';
  $.ajax({
   url:"update_is_type_status.php",
   method:"POST",
   data:{is_type:is_type},
   success:function()
   {
    
   }
  })
 });
 
  
}); 
</script>
