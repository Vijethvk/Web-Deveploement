<?php

$weather="";
$error="";
$secondpagearray=array();
  if($_GET){
  $city=str_replace(' ','',$_GET["cityname"]);
  $file_headers=@get_headers("https://www.weather-forecast.com/locations/".$city."/forecasts/latest");
  
  if($file_headers[0]=='HTTP/1.1 404 Not Found'){
  
  $error="Hope you misspelled it!";
  }else{
  
  $forecastpage=file_get_contents("https://www.weather-forecast.com/locations/".$city."/forecasts/latest");
   
   $pagearray=explode('(1&ndash;3 days)</span><p class="b-forecast__table-description-content"><span class="phrase">',$forecastpage);
   
   
    
    if(sizeof($pagearray)>1){
     $secondpagearray=explode('</span></p></td><td colspan="9">',$pagearray[1]);
      
      if(sizeof($secondpagearray)>1){
        $weather=$secondpagearray[0];
      }else{
         $error="Hope you misspelled it!";
      }
      
    }else{
       $error="Hope you misspelled it!";
    }
     
     // $weather=$secondpagearray[0];
  
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

            <button type="submit" class="btn btn-primary">Submit</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
