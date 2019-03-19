<?php
session_start();
if(!isset($_SESSION['teacher_id']))
  {
    header("Location: tlogin.php");   
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Preview</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>Questions</h2>
  <p>Try not to refersh the page or Shift between the page.</p>
  <div class="panel-group">
   <?php

     $output="";
     $count=1;
     $option=array("a","b","c","d");
   include("connection.php");
   $query="SELECT * FROM `Questions` WHERE Questions.test_id='".$_GET['topic']."'";
    if($result=mysqli_query($link,$query))
     {
         while ($row=mysqli_fetch_array($result))
           {  
              echo '<div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">'.$count.')'.$row['question'].'</div><div class="panel-body">';
    
               
           //    echo $count."). ".$row['question']."<br>";
               $i=0;
                $query1="SELECT * FROM `option_table` WHERE qid='".$row['qid']."'";
                if($result1=mysqli_query($link,$query1))
                {
                    while($row1=mysqli_fetch_array($result1))
                    {
                        echo $option[$i].". ".$row1['option_value']."<br>";
                       // echo $option[$i].". ".$row1['option_value']."<br>";
                        $i++;
                    }
                }
                 
                 echo '</div></div><br><br>';
                 $count++;
           }
       echo '<a href="tdash.php"><button type="button"  class="btn btn-primary">Go Back</button></a>';
       
     }           
?>
  </div>
</div>

</body>
</html>