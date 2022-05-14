<?php

$config["server"]='localhost';
$config["username"]='root';
$config["password"]='';
$config["database_name"]='api_point-of-sale';

////SERVER
define('DB_NAME', 'api_point-of-sale');
define('DB_USER', 'root');
define('DB_PASS', '');	
define('DB_HOST', 'localhost');	

 //membuat koneksi dengan database
 $con = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME) or die('Database tidak dapat terhubung');

;?>