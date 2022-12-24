<?php 
session_start();
    if($_POST){
        include "db.php";
        
        $qry_get_tb_product=mysqli_query($conn,"SELECT * from tb_product where id_product = '".$_GET['id_product']."'") or die(mysqli_error($conn));
        $dt_produk=mysqli_fetch_object($qry_get_tb_product);
        $_SESSION['cart'][]=array(
            'id_product'=>$dt_produk->id_product,
            'name_product'=>$dt_produk->name_product,
            'qty'=>$_POST['jumlah'],
            'harga' => $dt_produk->price_product,
            'subtotal'=> $_POST['subtotal']
        );
    }
    header('location: keranjang.php');
?>