<?php
echo "<h2>hello world</h2>";
$name="vijeth";
echo "<p>hey!</p>".$name."\n"; 
echo "name within name<br>";
  $name1="gowda";
  $name2="name1";
  echo "<p>$name2</p>";
  echo $$name2."<br>";
  $myarray=array("vijeth","gowda","vastare");
  print_r($myarray); echo"<br>";
 $myarray2[0]="mudde";
 $myarray2[2]="koli sarru";
 $myarray2[4]="chitranna";
print_r($myarray2);
  echo"<br><br>";
 $myarray3=array("karnataka"=>"kannada","Punjab"=>"punjabi","West Bengal"=>"bengali","Tamil Nadu"=>"tamil");
  print_r($myarray3);
  echo"<br><br>";
  unset($myarray3["Tamil Nadu"]);
  $myarray3[]="kerala";
 echo"<br><br>";
 print_r($myarray3);
echo sizeof($myarray3);
?>
