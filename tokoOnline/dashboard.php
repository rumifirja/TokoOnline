<?php
include "db.php";
session_start();
if ($_SESSION['status_login'] != true) {
    echo '<script>window.location="login_admin.php"</script>';
}
error_reporting(E_ERROR | E_PARSE);
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
    <div class="sectionn">
        <div class="containerr">
            <h3>Dashboard</h3>
            <div class="boxx">
                <h3>hi, <span>admin</span></h3>
                <h1>welcome <span><?php echo $_SESSION['admin_name'] ?></span></h1>
                <p>this is an admin page</p>
            </div>
        </div>
    </div>
    <!-- Content End-->

    <!-- STATUS -->
    <div class="sectionn">
        <div class="containerr">
            <h3>ADMIN STATUS</h3>
            <div class="boxx">
                <table class="table">
                    <thead>
                        <th>NO</th>
                        <th>Pembeli</th>
                        <th>Tanggal Beli</th>
                        <th>Nama Produk</th>
                        <th>Jumlah</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Aksi</th>';'
                    </thead>
                    <tbody>
                        <?php
                        include 'db.php';
                        $no = 1;
                        $qry_histori = mysqli_query($conn, "select * from tb_pembelian join tb_user on tb_user.id_user=tb_pembelian.user_id ORDER BY id_pembelian DESC;");
                        while ($dt_histori = mysqli_fetch_array($qry_histori)) {

                            $qry_histori1 = mysqli_query($conn, "select * from detail_pembelian_produk JOIN tb_product ON detail_pembelian_produk.id_product = tb_product.id_product where id_pembelian='" . $dt_histori['id_pembelian'] . "'");
                            while ($dt_histori1 = mysqli_fetch_array($qry_histori1)) {
                                $subtotal =$dt_histori1['qty'] * $dt_histori1['price_product'];
                        ?> <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $dt_histori['username']?></td>
                                <td><?= $dt_histori['tanggal_pembelian'] ?></td>
                                <td><?= $dt_histori1['name_product'] ?></td>
                                <td><?= $dt_histori1['qty'] ?></td>
                                <td><?= "<ispan>Rp. </span>" . $subtotal?></td>
                                <td><?= $dt_histori['status'] ?></td>
                                <td><?php
                                    if ($dt_histori1['product_status']) {
                                    }
                                    ?>
                                

                                    <form action="proses_ubah_status.php" method="post">
                                        <input type="hidden" name="id_pembelian" value="<?= $dt_histori['id_pembelian'] ?>">
                                        <select name="status" onchange='if(this.value != 0) { this.form.submit(); }'>
                                            <option value=""></option>
                                            <option value="Menunggu Barang diconfirm">Menunggu Barang diconfirm</option>
                                            <option value="Barang Sudah diconfirm">Barang Sudah diconfirm</option>
                                            <option value="Barang Sedang dikemas">Barang Sedang dikemas</option>
                                            <option value="Produk Sedang dikirim">Barang Sedang dikirim</option>
                                            <option value="Produk Sudah diterima">Barang Sudah diterima</option>
                                        </select>
                                    </form>

                                </td>

                            </tr>
                        <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- STATUS End-->

    <!-- Footer -->
    <footer> 1
        <div class="container">
            <small>Copyright &copy; 2022 - TokoOnline.</small>
        </div>
    </footer>
    <!-- Footer -->

</body>

</html