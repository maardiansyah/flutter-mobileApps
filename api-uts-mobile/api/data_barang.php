<?php


	//Import File Koneksi Database
	include '../config/functions.php';

	//Membuat SQL Query
	
	$rssql = "SELECT * FROM barang";		
	
	//Mendapatkan Hasil
	$sql = mysqli_query($con, $rssql);
	
	//Membuat Array Kosong
	$response = array();

	while($a = mysqli_fetch_array($sql)){

		//Memasukkan Nama dan ID kedalam Array Kosong yang telah dibuat
		$b['id_barang']     = $a['id_barang'];
		$b['id_kategori']     = $a['id_kategori'];
		$b['nama_barang']   = $a['barang'];
		$b['harga']         = $a['harga'];
		$b['image']         = $a['image'];
		array_push($response, $b);
	}

	//Menampilkan Array dalam Format JSON
	echo json_encode($response);

	//mysqli_close($con);
?>
