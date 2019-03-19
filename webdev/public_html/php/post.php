<?php
 if($_POST)
 {
   $family=array('Vijeth','Vasantha','Rukmini');
   $check=0;
     foreach($family as $value){
        if($_POST['name']==$value)
            $check=1;
           }
           if($check)
             echo "<p><h3>Hi! ".$_POST['name']."</h3></p>";
           else
           echo "<p><h3>Sorry I don't know you</h3><p>";
           }          
           

?>

<form method="POST">
  <p>What is your name ?</p>
  <p><input type="text" name="name"></p>
  <p><input type="submit" value="submit"></p>
</form>  