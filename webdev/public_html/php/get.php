<?php
 if($_GET)
 echo "Hi ".$_GET['name']."!";
?>
<p>What's Your Name</p>
<form>
  <input type="text" name="name">
  <input  type="submit" value="Go!">
</form>  