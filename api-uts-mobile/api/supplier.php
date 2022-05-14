<?php

	//Import File Koneksi Database
	include '../config/functions.php';

	//Membuat SQL Query
	
	$rssql = "SELECT * FROM supplier";		
	
	//Mendapatkan Hasil
	$sql = mysqli_query($con, $rssql);
	
	//Membuat Array Kosong
	$response = array();

	while($a = mysqli_fetch_array($sql)){

		//Memasukkan Nama dan ID kedalam Array Kosong yang telah dibuat
		$b['id_supplier']     = $a['id_supplier'];
		$b['kd_supplier']     = $a['kd_supplier'];
		$b['nama_supplier']   = $a['nama_supplier'];
		$b['telp']         = $a['telp'];
		$b['alamat']         = $a['alamat'];
		array_push($response, $b);
	}

	//Menampilkan Array dalam Format JSON
	echo json_encode($response);

	//mysqli_close($con);
?>
