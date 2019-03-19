<?php
 
$link=mysqli_connect("shareddb-h.hosting.stackcp.net","myusers-33331cd4","on7ygo0emk","myusers-33331cd4");
 if(mysqli_connect_error()){
   die("error connecting to the database");
 }
 
//$query="INSERT INTO `users` (`email`,`password`) VALUES('vasanthadk@yahoo.com','vastare')";
// $query="UPDATE `users` SET password='qwerty1223~' WHERE email='vijethvk11@gmail.com' LIMIT 1";
//$name="rob 'o' percival";
//$query="SELECT * FROM users WHERE name='".mysqli_real_escape_string($link,$name)."'";

$query=" SELECT * FROM `users` WHERE email LIKE '%gowda%";
mysqli_query($link,$query);

 
  if($result=mysqli_query($link,$query)){
    while($row = mysqli_fetch_array($result)){
      
    echo $row['id'].". Email : ".$row['email']."<br>Password : ".$row['password'];
    }   
  }

?>
