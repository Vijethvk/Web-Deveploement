<?php
session_start();

$error="";
$successmessage="";
$warning="";

/*if(!isset($_SESSION['teacher_id']))
  {
    header("Location: tlogin.php");   
  }*/

include("connection.php");


?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>DashBoard</title>
  </head>
  <body>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#"><?php echo $_SESSION['username']; ?></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#home" id="hom">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#students"  id="stu">Students</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="addquestion.php" id="aquiz">Add Quiz</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#" id="ranking">Ranking</a>
      </li>
    </ul>
    
      <div class="pull-xs-right"  style="margin: 10px;">
       <a href='index.php?logout=1'><button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Logout</button></a>
   </div>  
    <form class="form-inline my-2 my-lg-0">  
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<br><br>
<div id="home">
<div class="container">
<div id="q02"></div>    
<div class="table-responsive-sm">    
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Test ID</th>
      <th scope="col">Subject Code</th>
       <th scope="col">Topic</th>
      <th scope="col">Time Limit</th>
      <th scope="col">Tag</th>
      <th scope="col">Total Marks</th>
      <th scope="col">Total Questions</th>
      <th scope="col">Description</th>
       <th scope="col">Status</th>
       <th scope="col">Delete</th>
       <th scope="col">Results</th>
       
    </tr>
  </thead>
  <tbody id="q01">
  </tbody>
</table>
</div>
</div>
</div>

<div id="students">
<div class="container">
<div class="table-responsive-sm">    
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">USN</th>
      <th scope="col">Name</th>
      <th scope="col">Semester</th>
      <th scope="col">Email</th>
    </tr>
  </thead>
  <tbody id="q03">
   
  </tbody>
</table>
</div>
</div>
</div>

<div id="rank">
<div class="container">
<div class="table-responsive-sm">    
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">USN</th>
      <th scope="col">Name</th>
      <th scope="col">Semester</th>
      <th scope="col">Email</th>
      <th scope="col">Time Taken</th>
      <th scope="col">Marks Obtained</th>
      <th scope="col">Maximum Marks</th>
    </tr>
  </thead>
  <tbody id="q04">
   
  </tbody>
</table>
</div>
</div>
</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.js"></script>  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
    
     <script type="text/javascript">
     
     $(document).ready(function(){

        document.getElementById('students').style.display='none';
        document.getElementById('rank').style.display='none';
        //document.getElementById('removequiz').style.display='none';
         setInterval(function(){
  fetch_quiz();
  fetch_student();
 }, 2000);
 
 
       function fetch_quiz()
 {
     console.log("hey");
  $.ajax({
   url:"teacher_quiz.php",
   method:"POST",
   success:function(data){
    $('#q01').html(data);
    
      $(".remove").click(function(){
        alert($(this).val());
          $.ajax({
   url:"remove_quiz.php",
   method:"POST",
   data: { remove:$(this).val() },
   success: function(response) {
        //$("#del").html(response);
        
        $("#q02").html(response);
    }
   
  })
    });
    
     $(".start").click(function(){
        alert($(this).val());
         $.ajax({
   url:"remove_quiz.php",
   method:"POST",
   data: { start:$(this).val() },
   success: function(response) {
        //$("#del").html(response);
        
        $("#q02").html(response);
    }
   
  })
    });
    
    $(".stop").click(function(){
        alert($(this).val());
          $.ajax({
   url:"remove_quiz.php",
   method:"POST",
   data: { stop:$(this).val() },
   success: function(response) {
        //$("#del").html(response);
        
        $("#q02").html(response);
    }
   
  })
    });
 
   }
  })
 } 
 
 

    });
       
       $("#stu").click(function(){
       $("#home").hide(); 
       $("#students").show();
        $("#rank").hide();
       
    });
      
      $("#hom").click(function(){
         $("#students").hide();
         $("#home").show(); 
          $("#rank").hide();
       });
       
      $("#ranking").click(function(){
         $("#students").hide();
         $("#home").hide(); 
         $("#rank").show();
       }); 
       
        
           function fetch_student()
        {
          console.log("hey");
         $.ajax({
            url:"teacher_student.php",
            method:"POST",
            success:function(data){
            $('#q03').html(data);
       }
  })
 } 
    
    </script>
    
  </body>
</html>