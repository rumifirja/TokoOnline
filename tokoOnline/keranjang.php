<?php
session_start();
error_reporting(0);
include 'db.php';

if($_SESSION['status_login_user'] != true){
    echo '<script>window.location="login_user.php"</script>';
}

$kontak = mysqli_query($conn, "SELECT telp_admin, email_admin, address_admin FROM tb_admin WHERE id_admin = 1");
$a = mysqli_fetch_object($kontak);


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

    <!-- Keranjang -->
    <div class="section">
        <div class="container">
        <h1><strong>Keranjang Belanja</strong></h1>
		<hr>
		<table class="table">
    <thead>
        <tr>
            <th>NO</th><th>Nama Produk</th><th>Harga</th><th>Jumlah</th><th>Subtotal</th><th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        
        foreach (@$_SESSION['cart'] as $key_produk => $val_produk): 
            $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE id_product = '".$val_produk['id_product']."'");
            $p = mysqli_fetch_object($produk);
        ?>
            <tr>
                <th><?=($key_produk+1)?></th>
                <th><?=$val_produk['name_product']?></th>
                <th><?=$p->price_product?></th>
                <th><?=$val_produk['qty']?></th>
                <th><?=$subtotal = $val_produk['qty'] * $p->price_product?></th>
                <th><a href="hapus_cart.php?id=<?=$key_produk?>" class="btn"><strong>X</strong></a></th>
            </tr>

        <?php endforeach ?>
        <?php
            $grand_total += $subtotal;
        ?>

            <tr>
                <td colspan="4"><h2>Total</h2></td>
                <td><?php echo $grand_total;?></td>
                <td align="right"><a href="checkout.php" class="btn">Check Out</a></td>
            </tr>
    </tbody>
</table>
            
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