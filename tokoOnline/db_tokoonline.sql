-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 10:11 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokoonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian_produk`
--

CREATE TABLE `detail_pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(255) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pembelian_produk`
--

INSERT INTO `detail_pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `qty`, `subtotal`, `id_product`) VALUES
(26, 20, 1, 0, 46);

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan`
--

CREATE TABLE `penerimaan` (
  `id_pembelian` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp_admin` varchar(20) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `address_admin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `admin_name`, `username`, `password`, `telp_admin`, `email_admin`, `address_admin`) VALUES
(1, 'ArumiFirja', 'AdminArumi', '202cb962ac59075b964b07152d234b70', '+6281288346360', 'arfrw@gmail.com', 'Jl. Margonda Raya No.4, Pondok Cina, Beji, Depok, Jawa Barat, Indonesia'),
(3, 'Firja', 'AdminFirja', '202cb962ac59075b964b07152d234b70', '083421567890', 'firja@gmail.com', 'semarang');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id_category`, `name_category`) VALUES
(25, 'Beds'),
(26, 'Chairs'),
(27, 'Tables'),
(28, 'Lamps'),
(29, 'Storages');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian`
--

CREATE TABLE `tb_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name_product` varchar(100) NOT NULL,
  `price_product` int(11) NOT NULL,
  `description_product` text NOT NULL,
  `image_product` varchar(100) NOT NULL,
  `status_product` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`id_product`, `id_category`, `name_product`, `price_product`, `description_product`, `image_product`, `status_product`, `date_created`) VALUES
(18, 25, 'Scott Bed', 8935898, '<p>Inspired by the iconic design of the 60s, Scott bed has an undistinguished style, blending bold lines with modernism effortlessly. This design celebrates the fascinating curved shapes imbued with a fresh vision, resulting in a distinctive and elegant bed.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 228 cm | 89,76&rsquo;&rsquo;<br />\r\nD 212 cm | 83,466&rsquo;&rsquo;<br />\r\nH 134 cm | 52,76&rsquo;&rsquo;<br />\r\nMattress:<br />\r\nW 180 cm | 70,87&rsquo;&rsquo; D 200 cm | 78,74&rsquo;&rsquo;<br />\r\nMattress not included<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric, and Synthetic Leather.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666142212.jpg', 1, '2022-10-19 01:16:52'),
(19, 25, 'Barlow Bed', 7957234, '<p>Barlow&rsquo;s singular elegance serves as a personality element in the overall bedroom decor. Recalling the retro style through its bold headboard, the composition of sophisticated materials and the subtle design details in all its silhouette gives it a charming look, creating the focal point of the space.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 225 cm | 88,58&rsquo;&rsquo;<br />\r\nD 221 cm | 87,01&rsquo;&rsquo;<br />\r\nH 130 cm | 51,18&rsquo;&rsquo;<br />\r\nMattress:<br />\r\nW 180 cm | 70,87&rsquo;&rsquo; D 200 cm | 78,74&rsquo;&rsquo;<br />\r\nMattress not included<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood and Fabric.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666142489.jpg', 1, '2022-10-19 01:21:29'),
(20, 25, 'Como Bed', 8564779, '<p>Como promises to take anyone back to the 50s with its sophisticated yet edgy look. The design brings to the bedroom a gentle balance between modern and retro style, playing with simplicity and boldness in a graceful move. The two light sources perfectly aligned in the headboard gives it the golden year&rsquo;s glamour, turning this bed into a showpiece.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 250 cm | 98,43&rsquo;&rsquo;<br />\r\nD 217 cm | 85,43&rsquo;&rsquo;<br />\r\nH 167 cm | 65,75&rsquo;&rsquo;<br />\r\nMattress:<br />\r\nW 180 cm | 70,87&rsquo;&rsquo; D 200 cm | 78,74&rsquo;&rsquo;<br />\r\nMattress not included<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666142569.jpg', 1, '2022-10-19 01:22:49'),
(21, 25, 'Rivers Bed', 8789577, '<p>Rivers&nbsp;look is easy on the eye. Balancing between simplicity and boldness, the gentle vertical lines guiding the eye within its silhouette create a sleek design. Though, the appeal of the piece lies in the headboard thickness, due to the irregular yet contemplative shape, embellished by sophisticated brass elements with a unique style.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 210 cm | 82,68&rsquo;&rsquo;<br />\r\nD 228 cm | 89,76&rsquo;&rsquo;<br />\r\nH 130 cm | 51,18&rsquo;&rsquo;<br />\r\nMattress:<br />\r\nW 180 cm | 70,87&rsquo;&rsquo; D 200 cm | 78,74&rsquo;&rsquo;<br />\r\nMattress not included<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666189731.jpg', 1, '2022-10-19 14:28:51'),
(22, 26, 'Crawford Dining Chair', 1456689, '<p>The Crawford dining chair is a statement piece that will enhance any dining room. Inspired by the powerful actress and businesswoman Joan Crawford, this dining chair shows the elegance and glamour characteristic of that time.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 60 cm | 23,62&rsquo;&rsquo;<br />\r\nD 47 cm | 18,50&rsquo;&rsquo;<br />\r\nH 68 cm | 26,77&rsquo;&rsquo;<br />\r\nSeat Height: 45 cm | 17,71&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n12 kg | 26,46 lbs</p>\r\n', 'produk1666190068.jpg', 1, '2022-10-19 14:34:28'),
(23, 26, 'Jarman Dining Chair', 2547483, '<p>Joseph Jarman, a famous jazz musician, was the inspiration for this stunning dining chair. Made by the noblest and elegant materials, the Jarman dining chair will be a center of attention for any project.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 53 cm | 20,87&rsquo;&rsquo;<br />\r\nD 53 cm | 20,87&rsquo;&rsquo;<br />\r\nH 70 cm | 27,56&rsquo;&rsquo;<br />\r\nSeat Height: 45 cm | 17,71&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n12 kg | 26,46 lbs</p>\r\n', 'produk1666190200.jpg', 1, '2022-10-19 14:36:40'),
(24, 26, 'Rivers Armchair', 3657446, '<p>The Rivers armchair gathers its inspiration from the undistinguished style of the jazz saxophonist Sam Rivers. By seeking the limits of shape, this armchair is the ultimate statement piece that can easily integrate into a modern mid-century living room.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 114 cm | 44,88&rsquo;&rsquo;<br />\r\nD111 cm | 43,70&rsquo;<br />\r\nH 88 cm | 34,65&rdquo;<br />\r\nSeat Height 42 cm | 16, 53&quot;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n65 kg | 143,30 lbs</p>\r\n', 'produk1666190412.jpg', 1, '2022-10-19 14:40:12'),
(25, 26, 'James Armchair', 3546227, '<p>James Armchair is a piece with simple lines and bright colors, made in polished brass and walnut wood. It is the perfect luxury furniture piece to add a mid-century modern touch to your home. This armchair can be used just by herself or as part of the James Modular Sofa.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 93 cm | 36,61&rsquo;&rsquo;<br />\r\nD 105 cm | 41,34&rsquo;&rsquo;<br />\r\nH 91 cm | 35,83&rsquo;&rsquo;<br />\r\nSeat Height 42 cm | 16, 53&quot;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666190539.png', 1, '2022-10-19 14:42:19'),
(26, 26, 'Otis I Bar Chair', 2453664, '<p>The Otis I bar chair insinuates the Hollywood glamour of the golden years. The elegant and distinctive shape will steal the attention in the room and, at the same time, letting you comfortable enjoying the drink and a good conversation.&nbsp;</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 50 cm | 19,69&rsquo;&rsquo;<br />\r\nD 53 cm | 20,87&rsquo;&rsquo;<br />\r\nH 103 cm | 40,55&rsquo;&rsquo;<br />\r\nSeat Height: 85 cm | 33,46&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Fabric and Polished Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nAlso available in counter stool size:<br />\r\nSeat Height 65 cm |&nbsp;25,59&rdquo;<br />\r\n<br />\r\nWEIGHT<br />\r\n17 kg | 37,48 lbs</p>\r\n', 'produk1666190703.jpg', 1, '2022-10-19 14:45:03'),
(27, 26, 'Gilmore Bar Chair', 3885647, '<p>The Gilmore bar chair was designed to bring a touch of luxury to any bar. This vintage bar chair features elegant lacquered legs, adorned with brass details, providing the vintage glamour that any modern mid-century bar seeks to have.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 54 cm | 21,26&rsquo;&rsquo;<br />\r\nD 48 cm | 18,90&rsquo;&rsquo;<br />\r\nH 105 cm | 44,09&rsquo;&rsquo;<br />\r\nSeat Height: 85 cm | 33,46&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nAlso available in counter stool size:<br />\r\nSeat Height 65 cm |&nbsp;25,59&rdquo;<br />\r\n<br />\r\nWEIGHT<br />\r\n17 kg | 37,48 lbs</p>\r\n', 'produk1666190811.jpg', 1, '2022-10-19 14:46:51'),
(28, 26, 'Lauren Sofa', 12643792, '<p>Lauren Sofa is the perfect complement for a bar. Drawing inspiration from the aesthetics of mid-century modern design this sofa has a small table on the side, made with polished brass, to handle cups of drinks. The backrest with details in matte walnut wood gives consistency to his structure.&nbsp;</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 264 cm | 103,94&rsquo;&rsquo;<br />\r\nD 107 cm | 42,13&rsquo;&rsquo;<br />\r\nH 84 cm | 37,07&rsquo;&rsquo;<br />\r\nSeat Height: 42 cm | 16, 53&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Solid Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n150 kg | 330,70 lbs</p>\r\n', 'produk1666190995.png', 1, '2022-10-19 14:49:55'),
(29, 26, 'Rivers Sofa', 13664357, '<p>The Rivers sofa gathers its inspiration from the undistinguished style of the jazz saxophonist Sam Rivers. By seeking the limits of shape, this sofa is the ultimate statement piece that can easily integrate into a modern mid-century living room.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 226 cm | 88,98&rsquo;&rsquo;<br />\r\nD 111 cm | 38,98&rsquo;&rsquo;<br />\r\nH 88 cm | 29,92&rsquo;&rsquo;<br />\r\nSeat Height: 42 cm | 16, 53&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n140 kg | 308,65 lbs</p>\r\n', 'produk1666191080.jpg', 1, '2022-10-19 14:51:20'),
(30, 26, 'Harrison Sofa', 14521774, '<p>The Harrison Sofa is a classic of mid-century incorporated into a modern vision. Its simple geometrical forms are born out of the 50s aesthetic, bringing back the true sense of the vintage charm to the modern living spaces. Reinterpreting the line-work of the ceramic artist McIntosh, this piece features graceful vertical seams that emphasize the rhythm and movement from its inspiration. Harrison is a portrayal of the modern mid-century style.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 228 cm | 89,76&rsquo;&rsquo;<br />\r\nD 109 cm | 42,91&rsquo;&rsquo;<br />\r\nH 86 cm | 33,86&rsquo;&rsquo;<br />\r\nSeat Height: 42 cm | 16,53&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Fabric, Polished Brass and Black Lacquered Metal<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n150 kg | 330,69 lbs</p>\r\n', 'produk1666191167.jpg', 1, '2022-10-19 14:52:47'),
(31, 27, 'Foster Bar Table', 6754335, '<p>The majestic Foster bar table is stunningly produced in solid walnut and lacquered wood. The strong contrast between these two materials on the leg makes this bar table the perfect choice for any mid-century design project.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 82 cm | 32,28&rsquo;&rsquo;<br />\r\nD 82 cm | 32,28&rsquo;&rsquo;<br />\r\nH 110 cm | 43,31&rsquo;&rsquo;<br />\r\n<br />\r\nMATERIALS<br />\r\nMaterials and Finishes: Matte Walnut Wood, Glossy Lacquered Wood, Carrara Marble and Polished Brass&nbsp;<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n85 kg | 187,40 lbs</p>\r\n', 'produk1666191378.jpg', 1, '2022-10-19 14:56:18'),
(32, 27, 'Mulligan Dining Table', 11648356, '<p>Delicate yet powerful, the Mulligan&rsquo;s design is notable for its dazzling little details. The geometric foot covered by an edgy paneling contrast with the luxury marble hues on the tabletop. The Mulligan dining table is a light approach to the mid-century style, bringing in a fresh look to any modern design. As Mulligan revolutionized jazz music, this dining table is a versatile piece able to transform any space into a harmonious and stylish one.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 150 cm | 59,06&rsquo;&rsquo;<br />\r\nD 150 cm | 59,06&rsquo;&rsquo;<br />\r\nH 77 cm | 30,31&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Glossy Lacquered Wood, Carrara Marble and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n160 kg | 352,74 lbs</p>\r\n', 'produk1666191538.jpg', 1, '2022-10-19 14:58:58'),
(33, 27, 'Avery Center Table', 3674885, '<p>Avery is a simple yet elegant center table. Its striking brass details blend an impressive subtlety with the contrasting marble hues on the tabletop. Ideal for any modern mid-century living space, the Avery center table will add a touch of luxury to any d&eacute;cor.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 95 cm | 37,40&rsquo;&rsquo;<br />\r\nD 60 cm | 23,62&rsquo;&rsquo;<br />\r\nH 35 cm | 13,78&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Carrara Marble, Green Marble and Gold Plated Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n50 kg | 110,23 lbs</p>\r\n', 'produk1666191653.jpg', 1, '2022-10-19 15:00:53'),
(34, 27, 'Haynes Side Table', 2431224, '<p>The Haynes side table is a fusion of wood, brass, and marble, ideal for those who dare to create a bold interior. The design features elegant curves on the base, with an irregular silhouette, which attaches to the marble tabletop through a discreet brass row, creating the illusion of a suspended tabletop.&nbsp;</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 37 cm | 14,57&rsquo;&rsquo;<br />\r\nD 37 cm | 14,57&rsquo;&rsquo;<br />\r\nH 50 cm | 19,69&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Travertino Marble and Polished Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n18 kg | 39,68 lbs</p>\r\n', 'produk1666191771.jpg', 1, '2022-10-19 15:02:51'),
(35, 27, 'Eva Side Table', 3577835, '<p>The Eva side&nbsp;table honors the Hungarian Zeisel&rsquo;s designs, by being the unique modular design of this collection. Its sleek lines, combined with a simple and discreet design, seek to highlight the presence of the two pieces that also function separately. Eva is an elegant design statement that fits several styles perfectly.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nBig:<br />\r\nW 40 cm | 15,75&rdquo;<br />\r\nD 40 cm | 15,75&rdquo;<br />\r\nH 50 cm | 19,69&rsquo;&rsquo;<br />\r\nSmall:<br />\r\nW&nbsp;34 cm | 13,39&rdquo;<br />\r\nD 34 cm | 13,39&rdquo;<br />\r\nH 37 cm | 14,57&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Carrara Marble&nbsp;and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n12 kg | 26,46 lbs</p>\r\n', 'produk1666191869.jpg', 1, '2022-10-19 15:04:29'),
(36, 27, 'Lynch Nightstand', 2573847, '<p>Lynch&#39;s minimalistic yet elegant design brings a sense of modern sophistication to the room. Its clean lines will complement the space and never take away from the design of the bedroom, being the perfect addition to more bold pieces.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 64 cm | 25,20&rsquo;&rsquo;<br />\r\nD 40 cm | 15,75&rsquo;&rsquo;<br />\r\nH 33 cm | 12,99&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n20 kg | 44,09 lbs</p>\r\n', 'produk1666192054.jpg', 1, '2022-10-19 15:07:34'),
(38, 26, 'Spencer Stool', 2854773, '<p>Spencer Stool was designed with geometric lines and round shape combined with two strips of polished brass around it and synthetic leather upholstery giving the piece the mid-century feeling. This stool is perfect for gathering guests at home and can be used as a part of the Spencer Sofa.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 102 cm | 40,16&rsquo;&rsquo;<br />\r\nD 90 cm | 35,43&rsquo;&rsquo;<br />\r\nH 44 cm | 17,32&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric and Polished Brass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n17 kg | 37,48 lbs</p>\r\n', 'produk1666192282.jpg', 1, '2022-10-19 15:11:22'),
(39, 26, 'Ray Bench', 64321887, '<p>Ray&rsquo;s retro silhouette and its clean appearance are what stand out the most. The leather belt shaping its lines gives it the necessary bold touch, turning it into the perfect bench to add an elegant touch to the bedroom.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 142 cm | 55,91&rsquo;&rsquo;<br />\r\nD 39 cm | 15,35&rsquo;&rsquo;<br />\r\nH 42 cm | 16,54&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Walnut Wood, Fabric, Synthetic Leather and Polished Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n25 kg | 55,12 lbs</p>\r\n', 'produk1666192379.jpg', 1, '2022-10-19 15:12:59'),
(40, 28, 'Yves Table Lamp', 996587, '<p>Yves has a simple frame, adorned with a pleasing rhythm lamp. Its design is focused on the verticality of the oval brass that surrounds the elegant light source, providing it a timeless look.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 32 cm | 12,60&rsquo;&rsquo;<br />\r\nD 32 cm | 12,60&rsquo;&rsquo;<br />\r\nH 72 cm | 28,35&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes:&nbsp;Glass, Carrara Marble and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n12 kg | 26,46 lbs<br />\r\n<br />\r\nBULBS<br />\r\n1 x E27 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666192544.jpg', 1, '2022-10-19 15:15:44'),
(41, 28, 'Taylor Floor Lamp', 999999, '<p>Taylor is a floor lamp that captures the essential features of the mid-century style, with simple lines and luxurious finishes. This bespoke design is handmade and comprises a white metal frame bent in the center, secured by a gold-plated base. Taylor is perfect for a relaxation zone or minimalist spaces.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 56 cm | 22,05&rsquo;&rsquo;<br />\r\nD 56 cm | 22,05&rsquo;&rsquo;<br />\r\nH 198 cm | 77,95&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Glass, Painted Metal and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n30 kg | 66,14 lbs<br />\r\n<br />\r\nBULBS<br />\r\n2 x E27 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666192674.png', 1, '2022-10-19 15:17:54'),
(42, 28, 'Grant Floor Lamp', 994576, '<p>The Grant Floor Lamp was created to be a completely out-of-the-ordinary piece. Cylindrical in shape, covered in gold plated with openings that allow light to pass through reflecting its lush form, this piece is a true representation of the mid-century style. The combination of gold-plated and white painted metal blend perfectly with any living room or entrance, giving them a touch of luxury.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 33 cm | 12,99&rsquo;&rsquo;<br />\r\nD 33 cm | 12,99&rsquo;&rsquo;<br />\r\nH 152 cm | 59,84&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes: Painted Metal and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n25 kg | 55,11 lbs<br />\r\n<br />\r\nBULBS<br />\r\n4 x E27 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666192772.png', 1, '2022-10-19 15:19:32'),
(43, 28, 'Roy Wall Lamp', 1200467, '<p>A modern wall lamp with a vintage touch, the Roy wall lamp has a distinctive and refreshing design. The unique form of the lamp body, with two curved arches holding a sphere, provides a charming look to the interior, embellishing any plain wall.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 25 cm | 9,84&rsquo;&rsquo;<br />\r\nD 27 cm | 10,63&rsquo;&rsquo;<br />\r\nH 52 cm | 20,47&rsquo;&rsquo;<br />\r\n<br />\r\nMaterials and Finishes:&nbsp;Glass and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n5 kg | 11,02 lbs<br />\r\n<br />\r\nBULBS<br />\r\n1 x g9 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666192895.jpg', 1, '2022-10-19 15:21:35'),
(44, 28, 'Roger Ceiling Lamp', 3978555, '<p>The Roger ceiling lamp features simple lines and high- end materials. The brass frame holds the delicate glass globes that distinguish by the way they diffuse light through all of the room. Its fresh and contemporary approach provides a touch of luxury and glamour that can not be unnoticed.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 147 cm | 57,87&rsquo;&rsquo;<br />\r\nD 42 cm | 16,54&rsquo;&rsquo;<br />\r\nH 143 cm | 56,30&rsquo;&rsquo;<br />\r\nPole Height Available in 3 sizes:&nbsp;<br />\r\n60 cm | 23,62&rdquo;<br />\r\n​80 cm | 31,50&rdquo;<br />\r\n​100 cm | 39,37&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Glass and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n27 kg | 59,52 lbs<br />\r\n<br />\r\nBULBS<br />\r\n4 x G9 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666193073.jpg', 1, '2022-10-19 15:24:33'),
(45, 28, 'Adam Ceiling Lamp', 999777, '<p>The unexpected Adams&rsquo; lamp shape is mesmerizing. The appeal of the piece lies in the tailored brass frame circulating the lamp, which gives it an unusual yet alluring shape. Despite its unique silhouette, the Adams ceiling lamp is the perfect choice to create a beautiful design balancing between simplicity and edginess.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 35 cm | 13,78&rsquo;&rsquo;<br />\r\nD 35 cm | 13,78&rsquo;&rsquo;<br />\r\nH 129 cm | 50,79&rsquo;&rsquo;<br />\r\nPole Height Available in 3 sizes:&nbsp;<br />\r\n60 cm | 23,62&rdquo;<br />\r\n​80 cm | 31,50&rdquo;<br />\r\n​100 cm | 39,37&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Glass and Gold Plated Brass.<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n10 kg | 22,05 lbs<br />\r\n<br />\r\nBULBS<br />\r\n1 x G9 Halogen Bulbs (40W max) *USA not included<br />\r\nVoltage: 220-240V</p>\r\n', 'produk1666193259.jpg', 1, '2022-10-19 15:27:39'),
(46, 29, 'Murray Bookcase', 13999999, '<p>Thought to give a pop of color to the room, the Murray bookcase is the perfect complement to any project. Made of lacquered wood and polished brass, this bookcase will give you the chance to play with the color.</p>\r\n\r\n<p><br />\r\nDIMENSIONS<br />\r\nW 307 cm | 120,87&rsquo;&rsquo;<br />\r\nD 42 cm | 16,54&rsquo;&rsquo;<br />\r\nH 214 cm | 84,25&rdquo;<br />\r\n<br />\r\nMaterials and Finishes: Matte Lacquered Wood, Black Painted Metal, Polished Brass and Black Smocked Glass<br />\r\nCustomization: Custom sizes and finishes are available under consultation.<br />\r\n<br />\r\nWEIGHT<br />\r\n140 kg | 220,46 lbs</p>\r\n', 'produk1666193685.jpg', 1, '2022-10-19 15:34:45'),
(50, 27, 'Stain Cookware Glow Pan Series ', 78987890, '<p>vygkuh</p>\r\n', 'produk1667178220.jpg', 1, '2022-10-31 01:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp_user` varchar(20) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `address_user` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `user_name`, `username`, `password`, `telp_user`, `email_user`, `address_user`) VALUES
(1, 'user1', 'user1', '92daa86ad43a42f28f4bf58e94667c95', '085834567889', 'user1@gmail.com', 'Jl. Kebangsaan Raya no.56'),
(43, 'user2', 'user2', '92daa86ad43a42f28f4bf58e94667c95', '081234567890', 'user@gmail.com', 'Depok'),
(44, 'user3', 'user3', '92daa86ad43a42f28f4bf58e94667c95', '0845367892', 'ani@gmail.com', 'Malang'),
(45, 'Abidin', 'Abidin', '92daa86ad43a42f28f4bf58e94667c95', '5648382928', 'ani@gmail.com', 'Malang'),
(46, 'naia', 'naia', '202cb962ac59075b964b07152d234b70', '08989898', 'naia@gmail.com', 'jbg'),
(47, 'nayaco', 'nayaco', '202cb962ac59075b964b07152d234b70', '90909090', 'nayaco@gmail.com', 'mlg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembelian_produk`
--
ALTER TABLE `detail_pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `qty` (`qty`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `subtotal` (`subtotal`);

--
-- Indexes for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian_produk`
--
ALTER TABLE `detail_pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `penerimaan`
--
ALTER TABLE `penerimaan`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
