<?php
session_start();
include 'db.php';
if($_SESSION['status_login'] != true){
    echo '<script>window.location="login.php"</script>';
}

   $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE id_product = '".$_GET['id']."'");
   if(mysqli_num_rows($produk) == 0){
    echo '<script>window.location="produk.php"</script>';
}
   
$p = mysqli_fetch_object($produk);

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TokoOnline</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>

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

    <!-- content -->
    <div class="section">
        <div class="container">
            <h3>Edit Data Produk</h3>
            <div class="box">
                <form action="" method="POST" enctype="multipart/form-data">
                   <select class="input-control" name="kategori" required>
                    <option value="">--Pilih--</option>
                    <?php
                      $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY id_category DESC");
                      while($r = mysqli_fetch_array($kategori)){
                        ?>
                        <option value="<?php echo $r['id_category']?> "><?php echo ($r['id_category'] == $p->id_category)? '
                        selected':''; ?> <?php echo $r['name_category'] ?></option>
                 <?php } ?>
                 </select>

                 <input type="text" name="nama" class="input-control" placeholder="Nama Produk" value="<?php echo $p-> name_product ?>" required>
                 <input type="text" name="harga" class="input-control" placeholder="Harga" value="<?php echo $p-> price_product ?>" required>
                 
                 
                 <img src="produk/<?php echo $p->image_product ?>" width="100px">
                 <input type="hidden" name="foto" value="<?php echo $p->image_product ?>">
                 <input type="file" name="gambar" class="input-control">
                 <textarea class="input-control" name="desc" placeholder="Deskripsi"><?php echo $p-> description_product ?></textarea><br>
                 <select class="input-control" name="status">
                    <option value="">--Pilih--</option>
                    <option value="1" <?php echo ($p->status_product == 1)? 'selected' : ''; ?>>Aktif</option>
                    <option value="0"<?php echo ($p->status_product == 0)? 'selected' : ''; ?>>Tidak Aktif</option>
                 </select>
                 <input type="submit" name="submit" value="Submit" class="btn">
                      </form>
                    <?php
                 if(isset($_POST['submit'])){

                    // data inputan dari form 
                    $kategori   = $_POST['kategori'];
                    $nama       = $_POST['nama'];
                    $harga      = $_POST['harga'];
                    $status     = $_POST['status'];
                    $deskripsi = $_POST['desc'];
                    $foto       = $_POST['foto'];

                    // menampung data file yang diupload 
                    $filename = $_FILES['gambar']['name'];
                    $tmp_name = $_FILES['gambar']['tmp_name'];

                    // Jika admin ganti gambar
                    if($filename != ''){
                        $type1 = explode('.',$filename);
                        $type2 = $type1[1];
    
                        $newname = 'produk'.time().".".$type2;
    
                        // menampung data format file yang diizinkan
                        $tipe_diizinkan = array('jpg', 'jpeg', 'png', 'gif');
                    //validasi format file
                    if(!in_array($type2, $tipe_diizinkan)){

                    // jika format file tidak ada di dalam tipe diizinkan
                        echo'<script>alert("Format file tidak diizinkan")</script';
                    }else{

                        unlink('produk/'.$foto);
                        move_uploaded_file($tmp_name, 'produk/'.$newname);
                        $namagambar = $newname;

                    }

                    }else{
                        // jika admin tidak ganti gambar
                        $namagambar = $foto;

                    }

                    // query update data produk
                    $update = mysqli_query($conn, "UPDATE tb_product SET 
                                           id_category   = '".$kategori."', 
                                           name_product  = '".$nama."', 
                                           price_product = '".$harga."', 
                                           description_product = '".$deskripsi."', 
                                           image_product = '".$namagambar."',
                                           status_product = '".$status."'
                                           WHERE id_product = '".$p->id_product."'  ");

                    if($update){
                        echo '<script>alert("Tambah data berhasil")</script>';
                        echo '<script>window.location="data-produk.php"</script>';
                }else{
                    echo 'gagal'.mysqli_error($conn);
                }

                 }
                 ?>
            </div>
                </div>
            </div>
        </div>
        <!-- footer -->
        <footer>
            <div class="container">
                <small>Copyright &copy; 2022 - TokoOnline</small>
            </div>
        </footer>
        <script>
            CKEDITOR.replace( 'deskripsi' );
        </script>
    </body>
    </html>