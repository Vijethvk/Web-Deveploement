  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script>
    $("#togglesignup").click(function(){
       $("#signupform").hide(); 
       $("#loginform").show();
       $("#error").html('<div></div>');
    });
      
      $("#togglelogin").click(function(){
         $("#loginform").hide();
         $("#signupform").show(); 
         $("#error").html('<div></div>');
       });
    
       $("#signupform").submit(function(e) {
                var error = "";
                if ($("#sigupemail").val() == "") {
                    error += "Email is requried.<br>";
                }
                if ($("#signuppassword").val() == "") {
                    error += "Password is requried.<br>";
                }
             /*   if ($("#content").val() == "") {
                    error += "Conent is requried.<br>";
                }*/
            
            if ($("#signuppassword").val() != ""){
               
              if ($("#confirmpassword").val() == "") {
                    error += "Password didn't match.<br>";
                }
            }
             
              if($("#confirmpassword").val() != ""){
                
                if($("#confirmpassword").val() != $("#signuppassword").val()){
                    error += "Password didn't match.<br>";
                }
                
              } 
                if (error != "") {
                    $("#error").html('<div class="alert alert-danger" role="alert">' + error + '</div>');           
                    return false;
                } else {
                    return true;
                }
            });
      
       $("#loginform").submit(function(e) {
                var error = "";
                if ($("#loginemail").val() == "") {
                    error += "Email is requried.<br>";
                }
                if ($("#loginpassword").val() == "") {
                    error += "Password is requried.<br>";
                }
             /*   if ($("#content").val() == "") {
                    error += "Conent is requried.<br>";
                }*/

                if (error != "") {
                    $("#error").html('<div class="alert alert-danger" role="alert">' + error + '</div>');           
                    return false;
                } else {
                    return true;
                }
            });
      
    $("textarea").on('change keyup paste', function() {
           $.ajax({
                    method: "POST",
                    url: "updatedatabase.php",
                   data: { content:$("#diary").val() }
                 })
                   
    });
    </script>
  </body>
</html>
