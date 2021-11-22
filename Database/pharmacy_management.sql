-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2021 pada 13.30
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin1', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`) VALUES
(1, 'Free Medicine', 'can be obtained without a doctor\'s prescription'),
(2, 'Limited Medicine', 'can be purchased without a doctor\'s prescription but in limited quantities'),
(3, 'Potent Medicine', 'Must use a doctor\'s prescription');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `address`, `phone`) VALUES
(1, 'Alexander', 'Malang', 876544221),
(2, 'Noe', 'Kediri', 876544222),
(3, 'Budi', 'Jakarta', 876544211);

-- --------------------------------------------------------

--
-- Struktur dari tabel `medicines`
--

CREATE TABLE `medicines` (
  `medicine_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type_id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `expired_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `medicines`
--

INSERT INTO `medicines` (`medicine_id`, `name`, `type_id`, `category_id`, `expired_date`, `price`, `stock`, `description`) VALUES
(1, 'Enervon C Multivitamin [1 Amplop/ 4 Tablet]', 2, 1, '2022-01-31', 5500, 100, 'Vitamin C'),
(2, 'Paracetamol 500mg', 4, 1, '2022-01-31', 3500, 200, 'Febrifuge'),
(3, 'Betadine 60ml', 8, 1, '2022-01-31', 4500, 50, 'Wound medicine'),
(4, 'Paramex', 2, 2, '2022-01-31', 2000, 100, 'Muscle Aches, Flu and Cough'),
(5, 'Neozep', 2, 2, '2022-01-31', 2600, 100, 'Flu medicine and stuffy nose'),
(6, 'Listerine Coolmint 500ml', 5, 2, '2022-01-31', 31200, 50, 'Mouthwash'),
(7, 'Proris Ibuprofen', 2, 3, '2022-01-31', 10000, 100, ' 400 MG STRIP 10 TABLET'),
(9, 'Panadol', 2, 2, '2021-12-31', 7000, 100, 'Panadol '),
(10, 'Tolak Angin', 5, 1, '2021-12-31', 5000, 100, 'Tolak Angin'),
(12, 'Antangin', 5, 1, '2021-12-31', 5000, 100, 'Antangin'),
(13, 'Tolak Angin', 5, 1, '2021-12-31', 10000, 100, 'Tolak Angin Sachet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchased`
--

CREATE TABLE `purchased` (
  `purchase_id` int(11) NOT NULL,
  `medicines_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `purchased`
--

INSERT INTO `purchased` (`purchase_id`, `medicines_id`, `admin_id`, `customer_id`, `amount`, `purchase_date`) VALUES
(1, 5, 1, 2, 2, '2021-10-21'),
(2, 1, 1, 2, 2, '2021-10-21'),
(3, 3, 1, 1, 2, '2021-10-21'),
(4, 1, 1, 1, 2, '2021-10-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'Pulvis'),
(2, 'Tablet'),
(3, 'Pilulae'),
(4, 'Capsule'),
(5, 'Solutiones'),
(6, 'Guttae'),
(7, 'Extractum'),
(8, 'Other');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_medicines`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_medicines` (
`ID` int(11)
,`Product` varchar(100)
,`Type` varchar(20)
,`Category` varchar(20)
,`expired_date` date
,`price` int(11)
,`stock` int(11)
,`description` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_purchased`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_purchased` (
`ID` int(11)
,`Product` varchar(100)
,`Admin` varchar(20)
,`Customer` varchar(20)
,`amount` int(11)
,`purchase_date` date
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_medicines`
--
DROP TABLE IF EXISTS `view_medicines`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_medicines`  AS  select `m`.`medicine_id` AS `ID`,`m`.`name` AS `Product`,`t`.`type_name` AS `Type`,`c`.`category_name` AS `Category`,`m`.`expired_date` AS `expired_date`,`m`.`price` AS `price`,`m`.`stock` AS `stock`,`m`.`description` AS `description` from ((`medicines` `m` join `type` `t` on((`m`.`type_id` = `t`.`type_id`))) join `category` `c` on((`m`.`category_id` = `c`.`category_id`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_purchased`
--
DROP TABLE IF EXISTS `view_purchased`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_purchased`  AS  select `p`.`purchase_id` AS `ID`,`m`.`name` AS `Product`,`a`.`username` AS `Admin`,`c`.`name` AS `Customer`,`p`.`amount` AS `amount`,`p`.`purchase_date` AS `purchase_date` from (((`purchased` `p` join `medicines` `m` on((`p`.`medicines_id` = `m`.`medicine_id`))) join `admin` `a` on((`p`.`admin_id` = `a`.`admin_id`))) join `customer` `c` on((`p`.`customer_id` = `c`.`customer_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`medicine_id`),
  ADD KEY `fk_type` (`type_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indeks untuk tabel `purchased`
--
ALTER TABLE `purchased`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `fk_medicine` (`medicines_id`),
  ADD KEY `fk_admin` (`admin_id`),
  ADD KEY `fk_customer` (`customer_id`);

--
-- Indeks untuk tabel `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `medicines`
--
ALTER TABLE `medicines`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `purchased`
--
ALTER TABLE `purchased`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Ketidakleluasaan untuk tabel `purchased`
--
ALTER TABLE `purchased`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_medicine` FOREIGN KEY (`medicines_id`) REFERENCES `medicines` (`medicine_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
