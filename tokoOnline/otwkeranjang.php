<?php
session_start();

    error_reporting(0);
    include 'db.php';
    $kontak = mysqli_query($conn, "SELECT telp_admin, email_admin, address_admin FROM tb_admin WHERE id_admin = 1");
    $a = mysqli_fetch_object($kontak);
    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE id_product = '".$_GET['id_product']."'");
    $p = mysqli_fetch_object($produk);
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
            <h1><a href="index_user.php">.fu<span>rni</span>ture</a></h1>
            <ul>
                <li><a href="produk.php">Produk</a></li>
                <li><a href="keranjang.php">Keranjang</a></li>
                <li><a href="histori_pembelian.php">Histori</a></li>
                <li><a href="login_user.php">Keluar</a></li>
            </ul>
        </div>
    </header>
    <!-- Header End -->

    <!-- product detail -->
    <div class="section">
        <div class="container">
            <div class="box">
                <div class="col-2">
                    <img src="produk/<?php echo $p->image_product ?>" width="100%">
                </div>
                <div class="col-2">
                    <form action="masukkankeranjang.php?id_product=<?php echo $p->id_product ?>" method="post">
                        <h3><?php echo $p->name_product ?></h3>
                        <h4>Rp. <?php echo number_format($p->price_product) ?></h4>
                        <p>Deskripsi :<br>
                        <?php echo $p->description_product?>
                        </p>
                        <p>Jumlah Barang <input type="number" name="jumlah" value="1"></p>
                        <input class="btn" type="submit" value="Tambah ke keranjang">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <h4>Alamat</h4>
            <p><?php echo $a->address_admin ?></p>

            <h4>Email</h4>
            <p><?php echo $a->email_admin ?></p>

            <h4>Telp</h4>
            <p><?php echo $a->telp_admin ?></p>
            <small>Copyright &copy; 2022 - TokoOnline.</small>
        </div>
    </div>
</body>
</html>