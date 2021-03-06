-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2022 at 05:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level` set('admin','owner') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL,
  `status_delete` tinyint(1) NOT NULL DEFAULT 0,
  `foto_produk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `deskripsi`, `stok`, `status_delete`, `foto_produk`) VALUES
(1, 'Nutrisari Jeruk rasa Mangga', 'Enak pokok e', 20, 0, '11.JPG'),
(2, 'Jasjus', 'Hemmmm segerrr', 0, 0, '10.JPG'),
(15, 'cek', 'cek', 0, 0, '3.JPG'),
(16, '1', '1', 0, 0, '13.JPG'),
(17, 'y', 'y', 0, 0, '23.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `jenis_masuk` set('pengembalian','pengadaan') NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang_pinjam`
--

CREATE TABLE `barang_pinjam` (
  `id_barang_pinjam` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `waktu_pinjam` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'UPT'),
(2, 'Innovation Center'),
(3, 'Prodi Manajemen Informatika'),
(4, 'Prodi Teknik Informatika'),
(5, 'Kemahasiswaan'),
(6, 'Rektorat');

-- --------------------------------------------------------

--
-- Table structure for table `stok_bulanan`
--

CREATE TABLE `stok_bulanan` (
  `id_stok_bulanan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `jumlah_stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `status_delete` (`status_delete`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD PRIMARY KEY (`id_barang_pinjam`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indexes for table `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD PRIMARY KEY (`id_stok_bulanan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  MODIFY `id_barang_pinjam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  MODIFY `id_stok_bulanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD CONSTRAINT `barang_pinjam_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `barang_pinjam_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_pinjam_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD CONSTRAINT `stok_bulanan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
