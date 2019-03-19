<?php

$weather="";
$error="";
  if(isset($_GET['cityname'])){
  $forecastpage=file_get_contents("http://api.openweathermap.org/data/2.5/weather?q=".urlencode($_GET['cityname'])."&appid=6711f6ab43ee03b4663eead98c98a3f6");
   
    $weatherarray=json_decode($forecastpage,true);
    
  
    if($weatherarray['cod']==200){
      
      $weather = "The weather in ".$_GET['cityname']." is currently '".$weatherarray['weather'][0]['description']."'.";
      
      $temp=intval($weatherarray['main']['temp']-273);
      $weather.="Temperature ".$temp."&deg;C, Atmospheric pressure ".$weatherarray['main']['pressure']."hPa ,Humidity ".$weatherarray['main']['humidity']."% ,Wind speed is ".$weatherarray['wind']['speed']."m/s ";
        if(isset($weatherarray['rain'])){
          $weather.=",Rain volume for the last 3 hours ".$weatherarray['rain']['3h']."";
        } 
         $weather.=" and Cloudiness ".$weatherarray['clouds']['all']."%.";
      
    }else{
          $error="City could not be found";
  }
    
  }
?>


<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../jquery.min.js"></script>
     
    <style>
html body{ 
  background: url(weather_scraper_background.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  height:100%;
}
      label{
        color: white;
      }
      h1{
        color: white;
      }
 .container {
    text-align: center;
     margin-top: 200px;
   max-width: 450px;
  }
 input{
         margin:15px 0;
      }
    #weather{
               margin-top:15px;
      
      }
</style>
   
    <title>Weather</title>
</head>

<body>
    <div class="container">
        <h1>What's The Weather?</h1>
        <form>
            <fieldset class="form-group">

                <label for="city">Enter the name of the city</label>
                <input type="text" class="form-control" id="city" aria-describedby="emailHelp" placeholder="Eg: chikmagalur,Mysore" name="cityname" value="<?php if($_GET)echo $_GET['cityname']?>">

            </fieldset>

            <button type="submit" class="btn btn-primary" id="sub">Submit</button>
        </form>
       <div id="weather"><?php 
   if($weather){
     echo '<div class="alert alert-success" role="alert">'.$weather.'
</div>';
   }else if($error){
      echo '<div class="alert alert-danger" role="alert">'.$error.'
</div>';
   }
   ?>
    </div>
  </div>   

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script> 
   $("form").submit(function(e) {
       
                var error = "";
                if($("#city").val()==""){
                  error="Please enter the city";
                  }
       
                if (error != "") {
                    $("#weather").html('<div class="alert alert-danger" role="alert">' + error + '</div>');           
                    return false;
                } else {
                    return true;
                }
            });
  
  </script> 
</body>

</html>
