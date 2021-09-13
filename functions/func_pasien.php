<?php 
	require 'config.php';

	// get data pasien
	function getData($sql){
		global $conn;
		$res = mysqli_query($conn, $sql);
		$rows = [];
		while ($row = mysqli_fetch_assoc($res)) {
			$rows[] = $row;
		}
		return $rows;
	}

	// insert data
	function insert($data){
		global $conn;
		$nama = htmlspecialchars($data['nama']);
		$tmp_lahir = htmlspecialchars($data['tmp_lahir']);
		$tgl_lahir = $data['tgl_lahir'];
		$umur = htmlspecialchars($data['umur']);
		$jk = htmlspecialchars($data['jk']);
		$alamat = htmlspecialchars($data['alamat']);

		$sql = "INSERT INTO pasien VALUES(
			'','$nama','$tmp_lahir','$tgl_lahir','$umur','$jk','$alamat')";
		mysqli_query($conn, $sql);

		return mysqli_affected_rows($conn);
	}

	// delete data
	function delete($id){
		global $conn;
		mysqli_query($conn, "DELETE FROM pasien WHERE id = $id");
		return mysqli_affected_rows($conn);
	}

	// update data
	function update($data){
		global $conn;
		$id = $data['id'];

		$nama = htmlspecialchars($data['nama']);
		$tmp_lahir = htmlspecialchars($data['tmp_lahir']);
		$tgl_lahir = $data['tgl_lahir'];
		$umur = htmlspecialchars($data['umur']);
		$jk = $data['jk'];
		$alamat = htmlspecialchars($data['alamat']);

		$sql = "UPDATE pasien set
					nama_pasien = '$nama',
					tmp_lahir = '$tmp_lahir',
					tgl_lahir = '$tgl_lahir',
					umur = '$umur',
					jk = '$jk',
					alamat = '$alamat' WHERE id = $id
		";
		//var_dump($sql);die();
		mysqli_query($conn, $sql);

		return mysqli_affected_rows($conn);
	}

	// search data
	function search($keyword){
		$sql = "SELECT * FROM obat WHERE
				nama LIKE '%$keyword%' OR
				tmp_lahir LIKE '%$keyword%' OR
				tgl_lahir LIKE '%$keyword%' OR
				umur LIKE '%$keyword%' OR
				jk LIKE '%$keyword%' OR
				alamat LIKE '%$keyword%'";
		return getData($sql);
	}
 ?>