<?php

//setcookie("userid","1234",time() + 60*60*24);
setcookie("userid","",time()-60*60);
echo $_COOKIE["userid"];
$_COOKIE["userid"]="hey";
echo $_COOKIE["userid"];



?>