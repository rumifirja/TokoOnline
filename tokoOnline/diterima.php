<?php
if($_GET['id']){
    include "db.php";
    $id_pembelian=$_GET['id'];
        $update=mysqli_query($conn,"update tb_pembelian set status='Produk Sudah diterima' where id_pembelian = ".$id_pembelian."") or die(mysqli_error($conn));
        echo "<script>alert('Sukses update status');location.href='histori_pembelian.php';</script>";
    }
?>