-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Sep 2021 pada 17.50
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek_pratama`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL,
  `khasiat` varchar(255) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama`, `harga`, `stok`, `kategory`, `khasiat`, `expired`) VALUES
(4, 'antimo', 1000, 10, 'obat bebas', 'pusing,mual', '2018-07-25'),
(10, 'alummi', 1000, 10, 'obat bebas', 'mual, maag', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(60) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur` varchar(15) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `tmp_lahir`, `tgl_lahir`, `umur`, `jk`, `alamat`) VALUES
(1, 'Udin Sedunia', 'Bandung', '2021-09-12', '12', 'Laki-Laki', 'jl. Suka ngoding'),
(2, 'Nurlia', 'Bandung', '2021-09-14', '23', 'Perempuan', 'Jl. Suka cinta'),
(7, 'Dwi agata', 'Bali', '2021-09-09', '45', 'Perempuan', 'sxmslmx'),
(8, 'Test pasien next', 'Jakarta', '2021-09-06', '22', 'Laki-Laki', 'fffflslskksks'),
(9, 'zzzzzz', 'zzzzzzzzz', '2021-08-31', '32', 'Laki-Laki', 'ddsss');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `tanggal` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_pasien`, `id_obat`, `tanggal`, `jumlah_obat`) VALUES
(8, 1, 4, '2021-09-13 15:23:16', 5),
(11, 2, 4, '2021-09-13 15:23:22', 1),
(12, 7, 4, '2021-09-13 15:23:26', 3),
(13, 9, 10, '2021-09-13 15:35:59', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_obat`
--

CREATE TABLE `request_obat` (
  `id_request` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategory` enum('obat bebas','obat bebas terbatas','obat keras','jamu','obat herbal terstandar','fitofarmaka') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `request_obat`
--

INSERT INTO `request_obat` (`id_request`, `nama`, `stok`, `kategory`) VALUES
(1, 'paramex', 10, 'obat bebas terbatas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `level` enum('pegawai','apoteker','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(7, 'Annatasya Zahra Napu', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(8, 'Bagus Prasetyo Usman', 'apoteker', '326dd0e9d42a3da01b50028c51cf21fc', 'apoteker'),
(9, 'Rizky Tuloli', 'pegawai', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(10, 'Usman Ibrahim', 'pegawai2', '047aeeb234644b9e2d4138ed3bc7976a', 'pegawai'),
(13, 'Test 2', 'pegawai', '5525f75d130f2802430c6651a613f0b5', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `request_obat`
--
ALTER TABLE `request_obat`
  ADD PRIMARY KEY (`id_request`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `request_obat`
--
ALTER TABLE `request_obat`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
