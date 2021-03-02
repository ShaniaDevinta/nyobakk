-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2020 at 09:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_1818066`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kd_barang` varchar(7) NOT NULL,
  `nm_barang` varchar(15) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_card`
--

CREATE TABLE `tb_card` (
  `id_card` varchar(25) NOT NULL,
  `nm_card` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice_jual`
--

CREATE TABLE `tb_invoice_jual` (
  `no_invoice` varchar(10) NOT NULL,
  `waku_transaksi` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_user` varchar(7) NOT NULL,
  `id_costumer` varchar(7) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_karyawan`
--

CREATE TABLE `tb_karyawan` (
  `id_karyawan` varchar(24) NOT NULL,
  `nama` varchar(24) NOT NULL,
  `no_ktp` varchar(34) NOT NULL,
  `jenis_pembayaran` varchar(25) NOT NULL,
  `tmp_lahir` varchar(24) NOT NULL,
  `tgl_lahir` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `alamat_tinggal` int(11) NOT NULL,
  `alamat_ktp` int(11) NOT NULL,
  `no_ijaza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kd_kategori` varchar(7) NOT NULL,
  `nm_kategori` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran_jual`
--

CREATE TABLE `tb_pembayaran_jual` (
  `no_invoice` varchar(15) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_bayar` int(11) NOT NULL,
  `jenis_pembayaran` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `no_transaksi` varchar(10) NOT NULL,
  `no_invoice` varchar(15) DEFAULT NULL,
  `id_barang` varchar(7) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(25) NOT NULL,
  `role_id` int(11) NOT NULL,
  `image` tinyblob NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_create` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `email`, `password`, `name`, `role_id`, `image`, `is_active`, `date_create`) VALUES
(10, 'irbad05@gmail.com', '$2y$10$hoGcpoQmOtyeEKoMXabirut80cTy9sZHBjbwa0ojwbAPdBrN4irjK', 'irbad05', 1, 0x64656661756c742e6a7067, 1, '1592744740'),
(11, 'rananda003@gmail.com', '$2y$10$qRKPQ2md7kdIF0GWkq/nROkfhCYc0IVpZcFMWwtDKnK6Ht7VuC4pK', 'shania', 2, 0x64656661756c742e6a7067, 1, '1592764721');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tb_card`
--
ALTER TABLE `tb_card`
  ADD PRIMARY KEY (`id_card`);

--
-- Indexes for table `tb_invoice_jual`
--
ALTER TABLE `tb_invoice_jual`
  ADD PRIMARY KEY (`no_invoice`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `tb_pembayaran_jual`
--
ALTER TABLE `tb_pembayaran_jual`
  ADD PRIMARY KEY (`no_invoice`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
