-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 18 Gru 2017, 13:18
-- Wersja serwera: 5.5.58-0+deb8u1
-- Wersja PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `jakubs1`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktura_mieszkaniowa`
--

CREATE TABLE IF NOT EXISTS `faktura_mieszkaniowa` (
  `id` int(11) NOT NULL,
  `kwota` int(11) NOT NULL,
  `opis` int(11) NOT NULL,
  `data` date NOT NULL,
  `Polisy_mieszkaniowe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `ID` int(255) NOT NULL,
  `imie` char(30) NOT NULL,
  `nazwisko` char(50) NOT NULL,
  `adres_zamieszkania` char(100) NOT NULL,
  `kod_pocztowy` int(6) NOT NULL,
  `email` char(50) NOT NULL,
  `numer_telefonu` int(9) NOT NULL,
  `pesel` int(11) NOT NULL,
  `seria_dowodu` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polisy_mieszkaniowe`
--

CREATE TABLE IF NOT EXISTS `polisy_mieszkaniowe` (
  `id` int(11) NOT NULL,
  `miasto` char(255) NOT NULL,
  `kod_pocztowy` int(6) NOT NULL,
  `ulica` int(10) NOT NULL,
  `numer_budynku` int(10) NOT NULL,
  `numer_mieszkania` int(10) NOT NULL,
  `ubezpieczenia_ID` int(11) NOT NULL,
  `Klienci_ID` int(255) NOT NULL,
  `Pracownicy_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polisy_samochodowe`
--

CREATE TABLE IF NOT EXISTS `polisy_samochodowe` (
  `ID` int(11) NOT NULL,
  `data_dodania` date NOT NULL,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `typ_umowy` int(10) NOT NULL,
  `status` int(11) NOT NULL,
  `ubezpieczenia_ID` int(11) NOT NULL,
  `Klienci_ID` int(255) NOT NULL,
  `Pracownicy_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polisy_turystyczne`
--

CREATE TABLE IF NOT EXISTS `polisy_turystyczne` (
  `id` int(11) NOT NULL,
  `data_dodania` date NOT NULL,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `cena` double NOT NULL,
  `max_odszkodowanie` double NOT NULL,
  `Klienci_ID` int(255) NOT NULL,
  `Pracownicy_ID` int(255) NOT NULL,
  `Warianty_turystyczne_id` int(11) NOT NULL,
  `Warianty_turystyczne_ubezpieczenia_ID` int(11) NOT NULL,
  `ubezpieczenia_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE IF NOT EXISTS `pracownicy` (
  `ID` int(255) NOT NULL,
  `imie` char(30) NOT NULL,
  `nazwisko` char(50) NOT NULL,
  `adres_zamieszkania` char(100) NOT NULL,
  `kod_pocztowy` int(6) NOT NULL,
  `email` char(50) NOT NULL,
  `numer_telefonu` int(9) NOT NULL,
  `pesel` int(11) NOT NULL,
  `seria_dowodu` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod`
--

CREATE TABLE IF NOT EXISTS `samochod` (
  `ID` int(11) NOT NULL,
  `rok_produkcji` date NOT NULL,
  `marka` char(255) NOT NULL,
  `model` char(255) NOT NULL,
  `wartosc` int(11) NOT NULL,
  `nr_rejestracyjny` varchar(16) NOT NULL,
  `Polisa_samochodowa_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ubezpieczenia`
--

CREATE TABLE IF NOT EXISTS `ubezpieczenia` (
  `ID` int(11) NOT NULL,
  `kategoria` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `opis` longtext,
  `zdjecie` blob,
  `kwota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warianty_turystyczne`
--

CREATE TABLE IF NOT EXISTS `warianty_turystyczne` (
  `id` int(11) NOT NULL,
  `nazwa` char(255) NOT NULL,
  `opis_polisy` text NOT NULL,
  `skladka_miesieczna` double NOT NULL,
  `max_odszkodowanie` double NOT NULL,
  `ubezpieczenia_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenie_szkody_mieszkaniowej`
--

CREATE TABLE IF NOT EXISTS `zgloszenie_szkody_mieszkaniowej` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `dokumentacja_url` char(255) NOT NULL,
  `rozpatrzone` int(11) NOT NULL,
  `data_weryfikacji` date NOT NULL,
  `Polisa_mieszkaniowa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenie_szkody_samochodowej`
--

CREATE TABLE IF NOT EXISTS `zgloszenie_szkody_samochodowej` (
  `id_zgloszenia` int(11) NOT NULL,
  `data_zgloszenia` date NOT NULL,
  `status_zgloszenia` char(255) NOT NULL,
  `Polisa_samochodowa_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zgloszenie_szkody_turystycznej`
--

CREATE TABLE IF NOT EXISTS `zgloszenie_szkody_turystycznej` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `opis` text NOT NULL,
  `status` int(10) NOT NULL,
  `oplata_polisy` double NOT NULL,
  `Polisa_turystyczna_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `faktura_mieszkaniowa`
--
ALTER TABLE `faktura_mieszkaniowa`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_Faktura_mieszkaniowa_Polisy_mieszkaniowe1_idx` (`Polisy_mieszkaniowe_id`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `polisy_mieszkaniowe`
--
ALTER TABLE `polisy_mieszkaniowe`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_Polisa_mieszkaniowa_ubezpieczenia1_idx` (`ubezpieczenia_ID`), ADD KEY `fk_Polisy_mieszkaniowe_Klienci1_idx` (`Klienci_ID`), ADD KEY `fk_Polisy_mieszkaniowe_Pracownicy1_idx` (`Pracownicy_ID`);

--
-- Indexes for table `polisy_samochodowe`
--
ALTER TABLE `polisy_samochodowe`
 ADD PRIMARY KEY (`ID`), ADD KEY `fk_Polisa_samochodowa_ubezpieczenia1_idx` (`ubezpieczenia_ID`), ADD KEY `fk_Polisy_samochodowe_Klienci1_idx` (`Klienci_ID`), ADD KEY `fk_Polisy_samochodowe_Pracownicy1_idx` (`Pracownicy_ID`);

--
-- Indexes for table `polisy_turystyczne`
--
ALTER TABLE `polisy_turystyczne`
 ADD PRIMARY KEY (`id`,`Warianty_turystyczne_id`,`Warianty_turystyczne_ubezpieczenia_ID`), ADD KEY `fk_Polisy_turystyczne_Klienci1_idx` (`Klienci_ID`), ADD KEY `fk_Polisy_turystyczne_Pracownicy1_idx` (`Pracownicy_ID`), ADD KEY `fk_Polisy_turystyczne_Warianty_turystyczne1_idx` (`Warianty_turystyczne_id`,`Warianty_turystyczne_ubezpieczenia_ID`), ADD KEY `fk_polisy_turystyczne_ubezpieczenia1_idx` (`ubezpieczenia_ID`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `samochod`
--
ALTER TABLE `samochod`
 ADD PRIMARY KEY (`ID`), ADD KEY `fk_Samochod_Polisa_samochodowa1_idx` (`Polisa_samochodowa_ID`);

--
-- Indexes for table `ubezpieczenia`
--
ALTER TABLE `ubezpieczenia`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `warianty_turystyczne`
--
ALTER TABLE `warianty_turystyczne`
 ADD PRIMARY KEY (`id`,`ubezpieczenia_ID`), ADD KEY `fk_Warianty_turystyczne_ubezpieczenia1_idx` (`ubezpieczenia_ID`);

--
-- Indexes for table `zgloszenie_szkody_mieszkaniowej`
--
ALTER TABLE `zgloszenie_szkody_mieszkaniowej`
 ADD PRIMARY KEY (`id`,`Polisa_mieszkaniowa_id`), ADD KEY `fk_Zgloszenie_szkody_mieszkaniowej_Polisa_mieszkaniowa1_idx` (`Polisa_mieszkaniowa_id`);

--
-- Indexes for table `zgloszenie_szkody_samochodowej`
--
ALTER TABLE `zgloszenie_szkody_samochodowej`
 ADD PRIMARY KEY (`id_zgloszenia`,`Polisa_samochodowa_ID`), ADD KEY `fk_Zgloszenie_szkody_samochodowej_Polisa_samochodowa_idx` (`Polisa_samochodowa_ID`);

--
-- Indexes for table `zgloszenie_szkody_turystycznej`
--
ALTER TABLE `zgloszenie_szkody_turystycznej`
 ADD PRIMARY KEY (`id`,`Polisa_turystyczna_id`), ADD KEY `fk_Zgloszenie_szkody_turystycznej_Polisa_turystyczna1_idx` (`Polisa_turystyczna_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `faktura_mieszkaniowa`
--
ALTER TABLE `faktura_mieszkaniowa`
ADD CONSTRAINT `fk_Faktura_mieszkaniowa_Polisy_mieszkaniowe1` FOREIGN KEY (`Polisy_mieszkaniowe_id`) REFERENCES `polisy_mieszkaniowe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `polisy_mieszkaniowe`
--
ALTER TABLE `polisy_mieszkaniowe`
ADD CONSTRAINT `fk_Polisa_mieszkaniowa_ubezpieczenia1` FOREIGN KEY (`ubezpieczenia_ID`) REFERENCES `ubezpieczenia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_mieszkaniowe_Klienci1` FOREIGN KEY (`Klienci_ID`) REFERENCES `klienci` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_mieszkaniowe_Pracownicy1` FOREIGN KEY (`Pracownicy_ID`) REFERENCES `pracownicy` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `polisy_samochodowe`
--
ALTER TABLE `polisy_samochodowe`
ADD CONSTRAINT `fk_Polisa_samochodowa_ubezpieczenia1` FOREIGN KEY (`ubezpieczenia_ID`) REFERENCES `ubezpieczenia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_samochodowe_Klienci1` FOREIGN KEY (`Klienci_ID`) REFERENCES `klienci` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_samochodowe_Pracownicy1` FOREIGN KEY (`Pracownicy_ID`) REFERENCES `pracownicy` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `polisy_turystyczne`
--
ALTER TABLE `polisy_turystyczne`
ADD CONSTRAINT `fk_Polisy_turystyczne_Klienci1` FOREIGN KEY (`Klienci_ID`) REFERENCES `klienci` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_turystyczne_Pracownicy1` FOREIGN KEY (`Pracownicy_ID`) REFERENCES `pracownicy` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Polisy_turystyczne_Warianty_turystyczne1` FOREIGN KEY (`Warianty_turystyczne_id`, `Warianty_turystyczne_ubezpieczenia_ID`) REFERENCES `warianty_turystyczne` (`id`, `ubezpieczenia_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_polisy_turystyczne_ubezpieczenia1` FOREIGN KEY (`ubezpieczenia_ID`) REFERENCES `ubezpieczenia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `samochod`
--
ALTER TABLE `samochod`
ADD CONSTRAINT `fk_Samochod_Polisa_samochodowa1` FOREIGN KEY (`Polisa_samochodowa_ID`) REFERENCES `polisy_samochodowe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `warianty_turystyczne`
--
ALTER TABLE `warianty_turystyczne`
ADD CONSTRAINT `fk_Warianty_turystyczne_ubezpieczenia1` FOREIGN KEY (`ubezpieczenia_ID`) REFERENCES `ubezpieczenia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zgloszenie_szkody_mieszkaniowej`
--
ALTER TABLE `zgloszenie_szkody_mieszkaniowej`
ADD CONSTRAINT `fk_Zgloszenie_szkody_mieszkaniowej_Polisa_mieszkaniowa1` FOREIGN KEY (`Polisa_mieszkaniowa_id`) REFERENCES `polisy_mieszkaniowe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zgloszenie_szkody_samochodowej`
--
ALTER TABLE `zgloszenie_szkody_samochodowej`
ADD CONSTRAINT `fk_Zgloszenie_szkody_samochodowej_Polisa_samochodowa` FOREIGN KEY (`Polisa_samochodowa_ID`) REFERENCES `polisy_samochodowe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zgloszenie_szkody_turystycznej`
--
ALTER TABLE `zgloszenie_szkody_turystycznej`
ADD CONSTRAINT `fk_Zgloszenie_szkody_turystycznej_Polisa_turystyczna1` FOREIGN KEY (`Polisa_turystyczna_id`) REFERENCES `polisy_turystyczne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
