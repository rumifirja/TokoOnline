<?php
    include 'db.php';

    if(isset($_GET['idk'])){
        $delete = mysqli_query($conn, "DELETE FROM tb_category WHERE id_category = '".$_GET['idk']."'");
        echo '<script>window.location="data-kategori.php"</script>';

    }

    if(isset($_GET['idp'])){
        $produk = mysqli_query($conn, "SELECT image_product FROM tb_product WHERE id_product = '".$_GET['idp']."' ");
        $p = mysqli_fetch_object($produk);

        unlink('/produk'.$p->image_product);

        $delete = mysqli_query($conn, "DELETE FROM tb_product WHERE id_product = '".$_GET['idp']."' ");
        echo '<script>window.location="data-produk.php"</script>';
    }

    if(isset($_GET['idu'])){
        $delete = mysqli_query($conn, "DELETE FROM tb_user WHERE id_user = '".$_GET['idu']."'");
        echo '<script>window.location="data_pelanggan.php"</script>';

    }

    if(isset($_GET['ida'])){
        $delete = mysqli_query($conn, "DELETE FROM tb_admin WHERE id_admin = '".$_GET['ida']."'");
        echo '<script>window.location="data_admin.php"</script>';

    }
?>