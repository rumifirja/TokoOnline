<?php
    session_start();
    include 'db.php';
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login_admin.php"</script>';
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TokoOnline</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
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
                <li><a href="keluar.php">Keluar</a></li>

            </ul>
        </div>
    </header>
    <!-- Header End -->

    <!-- Content -->
    <div class="section">
        <div class="container">
            <h3>Tambah Data Kategori</h3>
            <div class="box">
                <form action="" method="POST">
                    <input type="text" name="nama" placeholder="Nama Kategori" class="input-control" required>
                    <input type="submit" name="submit" value="Submit" class="btn">
                </form>
                <?php
                    if(isset($_POST['submit'])){
                        $nama = ucwords($_POST['nama']);
                        $insert = mysqli_query($conn, "INSERT INTO tb_category VALUES (
                            null,
                            '".$nama."') ");
                        if($insert){
                            echo '<script>alert("Tambah data berhasil")</script>';
                            echo '<script>window.location="data-kategori.php"</script>';                        }else{
                            echo 'gagal' .mysqli_error($conn);
                        }
                    }
                ?>
            </div>
        </div>
    </div>
    <!-- Content End-->

    <!-- Footer -->
    <footer>
        <div class="container">
            <small>Copyright &copy; 2022 - TokoOnline.</small>
        </div>
    </footer>
    <!-- Footer -->

</body>
</html>