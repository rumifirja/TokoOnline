<?php 
	session_start();
	include 'db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login_admin.php"</script>';
	}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Data Admin</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<header>
		<div class="container">
			<h1><a href="dashboard.php">.fu<span>rni</span>ture</a></h1>
			<ul>
				<li><a href="dashboard.php">Dashboard</a></li>
				<li><a href="profil.php">Profil</a></li>
				<li><a href="data-kategori.php">Data Kategori</a></li>
				<li><a href="data-produk.php">Data Produk</a></li>
				<li><a href="data_pelanggan.php">Data Pelanggan</a></li>
				<li><a href="data_admin.php">Data Admin</a></li>
				<li><a href="keluar.php">Logout</a></li>
			</ul>
		</div>
	</header>

	<!-- content -->
	<div class="section">
		<div class="container">
			<h3>Data Admin</h3>
			<div class="box">
			<p><a href="tambah_admin.php">Tambah Data</a></p>
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="60px">No</th>
							<th>Name</th>
							<th>Username</th>
							<th>No. Telp</th>
							<th>Email</th>
							<th>Address</th>
							<th width="150px">Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$no = 1;
							$user = mysqli_query($conn, "SELECT * FROM tb_admin ORDER BY id_admin DESC");
							if(mysqli_num_rows($user) > 0){
							while($row = mysqli_fetch_array($user)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['admin_name'] ?></td>
							<td><?php echo $row['username'] ?></td>
                            <td><?php echo $row['telp_admin']?></td>
                            <td><?php echo $row['email_admin']?></td>
                            <td><?php echo $row['address_admin']?></td>
							<td>
                                <a href="proses-hapus.php?ida=<?php echo $row['id_admin'] ?>" onclick="return confirm('Yakin ingin hapus?')">Hapus</a>
							</td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="7">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer>
		<div class="container">
			<small>Copyright &copy; 2022 - Toko Online</small>
		</div>
	</footer>
</body>
</html>