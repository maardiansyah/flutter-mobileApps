<?php

	//Import File Koneksi Database
	include '../config/functions.php';

	//Membuat SQL Query
	
	$rssql = "SELECT * FROM kategori";		
	
	//Mendapatkan Hasil
	$sql = mysqli_query($con, $rssql);
	
	//Membuat Array Kosong
	$response = array();

	while($a = mysqli_fetch_array($sql)){

		//Memasukkan Nama dan ID kedalam Array Kosong yang telah dibuat
		$b['id_kategori']     = $a['id_kategori'];
		$b['kategori']   = $a['kategori'];
		array_push($response, $b);
	}

	//Menampilkan Array dalam Format JSON
	echo json_encode($response);

	//mysqli_close($con);
?>
