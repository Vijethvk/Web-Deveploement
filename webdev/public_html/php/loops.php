<?php
for ($i = 10; $i >0 ;$i--){
                      
     echo $i."<br>";
 }                      
      $myarray=array("vijeth","gowda","vastare");
 for($i=0;$i< sizeof($myarray);$i++)
   echo $myarray[$i]."<br>";
 $family=array("Vijeth","Vasantha","krishne");
echo "<br><br>";
 foreach($family as $key => $value){
    $family[$key]=$value." Gowda";
    echo $value."<br><br>";
 }
for($i=0;$i< sizeof($family);$i++)
   echo $family[$i]."<br>";

 $j=1;
 while($j<=10){
   $i=$j*5;
   echo $i."<br><br>";
     $j++;
 }
 ?>     