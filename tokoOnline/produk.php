<?php
session_start();
if($_SESSION['status_login_user'] != true){
    echo '<script>window.location="login_user.php"</script>';
}

    error_reporting(0);
    include 'db.php';

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

    <!-- Search -->
    <div class="search">
        <div class="container">
            <form action="produk.php">
                <input type="text" name="search" placeholder="Cari Produk" value="<?php echo $_GET['search']?>">
                <input type="hidden" name="kat" value="<?php echo $_GET['kat']?>">
                <input type="submit" name="cari" value="Cari Produk">

            </form>
        </div>
    </div>

    <!-- new product -->
    <div class="section">
        <div class="container">
            <h3>Produk</h3>
            <div class="box">
                <?php
                    if($_GET['search'] != '' || $_GET['kat'] != ''){
                        $where = "AND name_product LIKE '%".$_GET['search']."%' AND id_category LIKE '%".$_GET['kat']."%' ";
                    }
                    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE status_product = 1 $where ORDER BY id_product DESC");
                    if(mysqli_num_rows($produk) > 0){
                        while($p = mysqli_fetch_array($produk)){
                ?>
                    <a href="detail-product.php?id=<?php echo $p['id_product']?>">
                    <div class="col-4">
                        <img src="produk/<?php echo $p['image_product']?>" alt="">
                        <p class="nama"><?php echo substr($p['name_product'], 0, 30)?></p>
                        <p class="harga">Rp. <?php echo number_format($p['price_product'])?></p>
                    </div>
                    </a>
                <?php }}else{ ?>
                    <p>Produk tidak ada</p>
                <?php } ?>
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