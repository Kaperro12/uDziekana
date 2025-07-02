-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lip 03, 2025 at 12:34 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uDziekana`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Karta_Lojalnosciowa`
--

CREATE TABLE `Karta_Lojalnosciowa` (
  `ID_Karty` int(11) NOT NULL,
  `ID_Klienta` int(11) NOT NULL,
  `Punkty` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Karta_Lojalnosciowa`
--

INSERT INTO `Karta_Lojalnosciowa` (`ID_Karty`, `ID_Klienta`, `Punkty`) VALUES
(1, 1, 120),
(2, 2, 50),
(3, 3, 200),
(4, 4, 80),
(5, 5, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Klient`
--

CREATE TABLE `Klient` (
  `ID_Klienta` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Klient`
--

INSERT INTO `Klient` (`ID_Klienta`, `Imie`, `Nazwisko`, `Email`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com'),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com'),
(3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com'),
(4, 'Katarzyna', 'Wójcik', 'katarzyna.wojcik@example.com'),
(5, 'Tomasz', 'Kaczmarek', 'tomasz.kaczmarek@example.com'),
(6, 'Maria', 'Mazur', 'maria.mazur@example.com'),
(7, 'Paweł', 'Krawczyk', 'pawel.krawczyk@example.com'),
(8, 'Magdalena', 'Zielińska', 'magdalena.zielinska@example.com'),
(9, 'Michał', 'Szymański', 'michal.szymanski@example.com'),
(10, 'Agnieszka', 'Woźniak', 'agnieszka.wozniak@example.com'),
(11, 'Grzegorz', 'Dąbrowski', 'grzegorz.dabrowski@example.com'),
(12, 'Ewa', 'Lewandowska', 'ewa.lewandowska@example.com'),
(13, 'Krzysztof', 'Lis', 'krzysztof.lis@example.com'),
(14, 'Aleksandra', 'Sikora', 'aleksandra.sikora@example.com'),
(15, 'Rafał', 'Wróbel', 'rafal.wrobel@example.com'),
(16, 'Karolina', 'Zając', 'karolina.zajac@example.com'),
(17, 'Patryk', 'Pawlak', 'patryk.pawlak@example.com'),
(18, 'Dominika', 'Król', 'dominika.krol@example.com'),
(19, 'Sebastian', 'Wieczorek', 'sebastian.wieczorek@example.com'),
(20, 'Natalia', 'Górska', 'natalia.gorska@example.com'),
(21, 'Nowy', 'Klient', 'brak@brak.pl'),
(22, 'Nowy', 'Klient', 'brak@brak.pl'),
(23, 'Nowy', 'Klient', 'brak@brak.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Magazyn`
--

CREATE TABLE `Magazyn` (
  `ID_Produktu` int(11) NOT NULL,
  `Ilosc_na_stanie` int(11) NOT NULL,
  `Data_uzupelnienia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Magazyn`
--

INSERT INTO `Magazyn` (`ID_Produktu`, `Ilosc_na_stanie`, `Data_uzupelnienia`) VALUES
(1, 95, '2025-07-01'),
(2, 197, '2025-07-01'),
(3, 92, '2025-07-01'),
(4, 116, '2025-07-01'),
(5, 128, '2025-07-01'),
(6, 88, '2025-07-01'),
(7, 160, '2025-07-01'),
(8, 80, '2025-07-01'),
(9, 70, '2025-07-01'),
(10, 140, '2025-07-01'),
(11, 150, '2025-07-01'),
(12, 100, '2025-07-01'),
(13, 106, '2025-07-01'),
(14, 94, '2025-07-01'),
(15, 198, '2025-07-01'),
(17, 0, '2025-07-02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Metoda_Platnosci`
--

CREATE TABLE `Metoda_Platnosci` (
  `ID_Metody` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `Bezgotowkowa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Metoda_Platnosci`
--

INSERT INTO `Metoda_Platnosci` (`ID_Metody`, `Nazwa`, `Bezgotowkowa`) VALUES
(1, 'Karta', 1),
(2, 'Blik', 1),
(3, 'Gotówka', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Partie_Produktow`
--

CREATE TABLE `Partie_Produktow` (
  `ID_Partii` int(11) NOT NULL,
  `ID_Produktu` int(11) NOT NULL,
  `Data_produkcji` date NOT NULL,
  `Data_waznosci` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Partie_Produktow`
--

INSERT INTO `Partie_Produktow` (`ID_Partii`, `ID_Produktu`, `Data_produkcji`, `Data_waznosci`) VALUES
(1, 1, '2025-06-01', '2025-09-01'),
(2, 2, '2025-06-10', '2025-12-10'),
(3, 3, '2025-06-15', '2025-07-15'),
(4, 4, '2025-06-20', '2025-07-20'),
(5, 5, '2025-06-01', '2025-08-01'),
(6, 6, '2025-06-10', '2025-09-10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Platnosc`
--

CREATE TABLE `Platnosc` (
  `ID_Platnosci` int(11) NOT NULL,
  `Kwota` decimal(10,2) NOT NULL,
  `ID_Metody` int(11) NOT NULL,
  `Status_platnosci` enum('oczekująca','zakończona','błąd') NOT NULL DEFAULT 'oczekująca'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Platnosc`
--

INSERT INTO `Platnosc` (`ID_Platnosci`, `Kwota`, `ID_Metody`, `Status_platnosci`) VALUES
(1, 15.00, 1, 'zakończona'),
(2, 7.50, 2, 'zakończona'),
(3, 22.00, 1, 'zakończona'),
(4, 5.50, 3, 'zakończona'),
(5, 12.00, 1, 'zakończona'),
(6, 5.50, 1, 'zakończona'),
(7, 4.00, 1, 'zakończona'),
(8, 13.50, 2, 'zakończona'),
(9, 196.00, 1, 'zakończona'),
(10, 1750.00, 2, 'zakończona'),
(11, 38.00, 1, 'zakończona'),
(12, 0.00, 1, 'zakończona'),
(13, 16.50, 1, 'zakończona'),
(14, 22.00, 1, 'zakończona'),
(15, 107.30, 1, 'zakończona'),
(16, 175.00, 1, 'zakończona'),
(17, 14.00, 1, 'zakończona'),
(18, 0.00, 3, 'zakończona');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Produkt`
--

CREATE TABLE `Produkt` (
  `ID_Produktu` int(11) NOT NULL,
  `Nazwa` varchar(100) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `Waga` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Produkt`
--

INSERT INTO `Produkt` (`ID_Produktu`, `Nazwa`, `Cena`, `Waga`) VALUES
(1, 'Baton Czekoladowy', 3.50, 0.050),
(2, 'Woda Mineralna', 2.00, 0.500),
(3, 'Kanapka', 7.50, 0.250),
(4, 'Kawa w Kubku', 5.00, 0.300),
(5, 'Chipsy', 4.50, 0.150),
(6, 'Sok Pomarańczowy', 6.00, 0.500),
(7, 'Ciastko', 2.50, 0.100),
(8, 'Hot-dog', 8.00, 0.350),
(9, 'Sałatka', 9.50, 0.400),
(10, 'Orzeszki', 3.00, 0.100),
(11, 'Napój Energetyczny', 5.50, 0.250),
(12, 'Czekolada', 4.00, 0.100),
(13, 'Baton Proteinowy', 6.50, 0.070),
(14, 'Herbata', 3.00, 0.250),
(15, 'Mus Jabłkowy', 2.00, 0.150),
(17, 'energetyk', 4.99, 500.000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Sesja_Zakupowa`
--

CREATE TABLE `Sesja_Zakupowa` (
  `ID_Sesji` int(11) NOT NULL,
  `ID_Klienta` int(11) NOT NULL,
  `Data_startu` datetime NOT NULL,
  `Data_zakonczenia` datetime DEFAULT NULL,
  `Aktywna` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Szczegoly_Transakcji`
--

CREATE TABLE `Szczegoly_Transakcji` (
  `ID_Szczegolu` int(11) NOT NULL,
  `ID_Transakcji` int(11) NOT NULL,
  `ID_Produktu` int(11) NOT NULL,
  `Ilosc` int(11) NOT NULL,
  `Cena_za_sztuke` decimal(10,2) NOT NULL,
  `Wartosc` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Transakcja`
--

CREATE TABLE `Transakcja` (
  `ID_Transakcji` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ID_Klienta` int(11) NOT NULL,
  `ID_Metody` int(11) NOT NULL,
  `Kwota` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Waga`
--

CREATE TABLE `Waga` (
  `ID_Wagi` int(11) NOT NULL,
  `ID_Produktu` int(11) NOT NULL,
  `Waga` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Waga`
--

INSERT INTO `Waga` (`ID_Wagi`, `ID_Produktu`, `Waga`) VALUES
(1, 1, 0.051),
(2, 2, 0.502),
(3, 3, 0.248),
(4, 4, 0.301),
(5, 5, 0.151);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Karta_Lojalnosciowa`
--
ALTER TABLE `Karta_Lojalnosciowa`
  ADD PRIMARY KEY (`ID_Karty`),
  ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- Indeksy dla tabeli `Klient`
--
ALTER TABLE `Klient`
  ADD PRIMARY KEY (`ID_Klienta`);

--
-- Indeksy dla tabeli `Magazyn`
--
ALTER TABLE `Magazyn`
  ADD PRIMARY KEY (`ID_Produktu`);

--
-- Indeksy dla tabeli `Metoda_Platnosci`
--
ALTER TABLE `Metoda_Platnosci`
  ADD PRIMARY KEY (`ID_Metody`);

--
-- Indeksy dla tabeli `Partie_Produktow`
--
ALTER TABLE `Partie_Produktow`
  ADD PRIMARY KEY (`ID_Partii`),
  ADD KEY `ID_Produktu` (`ID_Produktu`);

--
-- Indeksy dla tabeli `Platnosc`
--
ALTER TABLE `Platnosc`
  ADD PRIMARY KEY (`ID_Platnosci`),
  ADD KEY `ID_Metody` (`ID_Metody`);

--
-- Indeksy dla tabeli `Produkt`
--
ALTER TABLE `Produkt`
  ADD PRIMARY KEY (`ID_Produktu`);

--
-- Indeksy dla tabeli `Sesja_Zakupowa`
--
ALTER TABLE `Sesja_Zakupowa`
  ADD PRIMARY KEY (`ID_Sesji`),
  ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- Indeksy dla tabeli `Szczegoly_Transakcji`
--
ALTER TABLE `Szczegoly_Transakcji`
  ADD PRIMARY KEY (`ID_Szczegolu`),
  ADD KEY `ID_Transakcji` (`ID_Transakcji`),
  ADD KEY `ID_Produktu` (`ID_Produktu`);

--
-- Indeksy dla tabeli `Transakcja`
--
ALTER TABLE `Transakcja`
  ADD PRIMARY KEY (`ID_Transakcji`),
  ADD KEY `ID_Klienta` (`ID_Klienta`),
  ADD KEY `ID_Metody` (`ID_Metody`);

--
-- Indeksy dla tabeli `Waga`
--
ALTER TABLE `Waga`
  ADD PRIMARY KEY (`ID_Wagi`),
  ADD KEY `ID_Produktu` (`ID_Produktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Karta_Lojalnosciowa`
--
ALTER TABLE `Karta_Lojalnosciowa`
  MODIFY `ID_Karty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `Klient`
--
ALTER TABLE `Klient`
  MODIFY `ID_Klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Metoda_Platnosci`
--
ALTER TABLE `Metoda_Platnosci`
  MODIFY `ID_Metody` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Partie_Produktow`
--
ALTER TABLE `Partie_Produktow`
  MODIFY `ID_Partii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Platnosc`
--
ALTER TABLE `Platnosc`
  MODIFY `ID_Platnosci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Produkt`
--
ALTER TABLE `Produkt`
  MODIFY `ID_Produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Sesja_Zakupowa`
--
ALTER TABLE `Sesja_Zakupowa`
  MODIFY `ID_Sesji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `Szczegoly_Transakcji`
--
ALTER TABLE `Szczegoly_Transakcji`
  MODIFY `ID_Szczegolu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Transakcja`
--
ALTER TABLE `Transakcja`
  MODIFY `ID_Transakcji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Waga`
--
ALTER TABLE `Waga`
  MODIFY `ID_Wagi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Karta_Lojalnosciowa`
--
ALTER TABLE `Karta_Lojalnosciowa`
  ADD CONSTRAINT `karta_lojalnosciowa_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klient` (`ID_Klienta`) ON DELETE CASCADE;

--
-- Constraints for table `Magazyn`
--
ALTER TABLE `Magazyn`
  ADD CONSTRAINT `magazyn_ibfk_1` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkt` (`ID_Produktu`) ON DELETE CASCADE;

--
-- Constraints for table `Partie_Produktow`
--
ALTER TABLE `Partie_Produktow`
  ADD CONSTRAINT `partie_produktow_ibfk_1` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkt` (`ID_Produktu`) ON DELETE CASCADE;

--
-- Constraints for table `Platnosc`
--
ALTER TABLE `Platnosc`
  ADD CONSTRAINT `platnosc_ibfk_1` FOREIGN KEY (`ID_Metody`) REFERENCES `Metoda_Platnosci` (`ID_Metody`);

--
-- Constraints for table `Sesja_Zakupowa`
--
ALTER TABLE `Sesja_Zakupowa`
  ADD CONSTRAINT `sesja_zakupowa_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klient` (`ID_Klienta`) ON DELETE CASCADE;

--
-- Constraints for table `Szczegoly_Transakcji`
--
ALTER TABLE `Szczegoly_Transakcji`
  ADD CONSTRAINT `szczegoly_transakcji_ibfk_1` FOREIGN KEY (`ID_Transakcji`) REFERENCES `Transakcja` (`ID_Transakcji`),
  ADD CONSTRAINT `szczegoly_transakcji_ibfk_2` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkt` (`ID_Produktu`);

--
-- Constraints for table `Transakcja`
--
ALTER TABLE `Transakcja`
  ADD CONSTRAINT `transakcja_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klient` (`ID_Klienta`),
  ADD CONSTRAINT `transakcja_ibfk_2` FOREIGN KEY (`ID_Metody`) REFERENCES `Metoda_Platnosci` (`ID_Metody`);

--
-- Constraints for table `Waga`
--
ALTER TABLE `Waga`
  ADD CONSTRAINT `waga_ibfk_1` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkt` (`ID_Produktu`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
