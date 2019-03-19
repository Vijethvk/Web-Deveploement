<?php

if($_GET['logout']==1)
   echo 'success';
else  
   echo  'fail';
$name=bin2hex(random_bytes(5));
echo $name;
?>