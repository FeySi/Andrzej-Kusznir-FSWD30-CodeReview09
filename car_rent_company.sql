-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Lut 2018, 12:31
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `car_rent_company`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `additional_charges`
--

CREATE TABLE `additional_charges` (
  `Charges_id` int(11) NOT NULL,
  `info` varchar(500) DEFAULT NULL,
  `fk_payment_methot_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `amazon_payments`
--

CREATE TABLE `amazon_payments` (
  `Amazon_Payments_ID` int(11) NOT NULL,
  `Amazon_Payments_detalis` varchar(100) DEFAULT NULL,
  `fk_amazon_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars`
--

CREATE TABLE `cars` (
  `Cars_ID` int(11) NOT NULL,
  `Car_nr` int(11) DEFAULT NULL,
  `Car_color` varchar(30) DEFAULT NULL,
  `Plate_nr` varchar(12) DEFAULT NULL,
  `EnginNR` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `Date_inf` date DEFAULT NULL,
  `Car` varchar(30) NOT NULL,
  `reservation_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `google_wallet`
--

CREATE TABLE `google_wallet` (
  `Google_Wallet_ID` int(11) NOT NULL,
  `Google_Wallet_detalis` varchar(100) DEFAULT NULL,
  `fk_google_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `location`
--

CREATE TABLE `location` (
  `locaion_ID` int(11) NOT NULL,
  `adres` varchar(64) NOT NULL,
  `reservation` int(11) DEFAULT NULL,
  `start_location` varchar(60) DEFAULT NULL,
  `end_location` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payment_methot`
--

CREATE TABLE `payment_methot` (
  `Payment_ID` int(11) NOT NULL,
  `Methot` varchar(55) DEFAULT NULL,
  `fk_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `payment_methot`
--

INSERT INTO `payment_methot` (`Payment_ID`, `Methot`, `fk_payment_id`) VALUES
(0, 'PayPal', 0),
(1, 'Skrill', 0),
(2, 'Stripe', 0),
(3, 'Amazon Payments', 0),
(4, 'Google Wallet', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paypal`
--

CREATE TABLE `paypal` (
  `PayPal_ID` int(11) NOT NULL,
  `PayPal_detalis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `return_location`
--

CREATE TABLE `return_location` (
  `Return_ID` int(11) NOT NULL,
  `Adres` varchar(55) DEFAULT NULL,
  `fk_location_ID` int(11) DEFAULT NULL,
  `fk_other_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `start_location`
--

CREATE TABLE `start_location` (
  `Start_ID` int(11) NOT NULL,
  `adres` varchar(60) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `data_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stripe`
--

CREATE TABLE `stripe` (
  `Stripe_ID` int(11) NOT NULL,
  `Stripe_detalis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`Charges_id`);

--
-- Indexes for table `amazon_payments`
--
ALTER TABLE `amazon_payments`
  ADD PRIMARY KEY (`Amazon_Payments_ID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`fk_customer_ID`) USING BTREE;

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `google_wallet`
--
ALTER TABLE `google_wallet`
  ADD PRIMARY KEY (`Google_Wallet_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locaion_ID`) USING BTREE;

--
-- Indexes for table `payment_methot`
--
ALTER TABLE `payment_methot`
  ADD PRIMARY KEY (`Payment_ID`);

--
-- Indexes for table `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`PayPal_ID`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`Return_ID`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`Start_ID`);

--
-- Indexes for table `stripe`
--
ALTER TABLE `stripe`
  ADD PRIMARY KEY (`Stripe_ID`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`Charges_id`) REFERENCES `payment_methot` (`Payment_ID`);

--
-- Ograniczenia dla tabeli `amazon_payments`
--
ALTER TABLE `amazon_payments`
  ADD CONSTRAINT `amazon_payments_ibfk_1` FOREIGN KEY (`Amazon_Payments_ID`) REFERENCES `google_wallet` (`Google_Wallet_ID`);

--
-- Ograniczenia dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `payment_methot` (`Payment_ID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `cars` (`fk_customer_ID`);

--
-- Ograniczenia dla tabeli `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`locaion_ID`) REFERENCES `start_location` (`Start_ID`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`locaion_ID`) REFERENCES `return_location` (`Return_ID`);

--
-- Ograniczenia dla tabeli `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`Return_ID`) REFERENCES `additional_charges` (`Charges_id`);

--
-- Ograniczenia dla tabeli `stripe`
--
ALTER TABLE `stripe`
  ADD CONSTRAINT `stripe_ibfk_1` FOREIGN KEY (`Stripe_ID`) REFERENCES `paypal` (`PayPal_ID`),
  ADD CONSTRAINT `stripe_ibfk_2` FOREIGN KEY (`Stripe_ID`) REFERENCES `amazon_payments` (`Amazon_Payments_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
