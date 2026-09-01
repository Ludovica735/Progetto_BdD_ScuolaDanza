-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 01, 2026 alle 11:16
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scuola_danza`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `allievo`
--

CREATE TABLE `allievo` (
  `id_utente` int(11) NOT NULL,
  `livello_danza` varchar(30) DEFAULT NULL,
  `data_iscrizione_scuola` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `amministratore`
--

CREATE TABLE `amministratore` (
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corso`
--

CREATE TABLE `corso` (
  `id_corso` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `stile` varchar(50) DEFAULT NULL,
  `livello` varchar(30) DEFAULT NULL,
  `prezzo` decimal(6,2) DEFAULT NULL,
  `id_insegnante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `genitore`
--

CREATE TABLE `genitore` (
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_figlio`
--

CREATE TABLE `ha_figlio` (
  `id_genitore` int(11) NOT NULL,
  `id_allievo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `insegnante`
--

CREATE TABLE `insegnante` (
  `id_utente` int(11) NOT NULL,
  `specializzazione` varchar(50) DEFAULT NULL,
  `anni_esperienza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `iscrizione`
--

CREATE TABLE `iscrizione` (
  `id_allievo` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `data_iscrizione` date DEFAULT NULL,
  `quota_pagata` decimal(6,2) DEFAULT NULL,
  `stato` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `lezione`
--

CREATE TABLE `lezione` (
  `id_lezione` int(11) NOT NULL,
  `data` date NOT NULL,
  `ora_inizio` time NOT NULL,
  `ora_fine` time NOT NULL,
  `id_corso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipa_saggio`
--

CREATE TABLE `partecipa_saggio` (
  `id_allievo` int(11) NOT NULL,
  `id_saggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `presenza`
--

CREATE TABLE `presenza` (
  `id_allievo` int(11) NOT NULL,
  `id_lezione` int(11) NOT NULL,
  `presente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `saggio`
--

CREATE TABLE `saggio` (
  `id_saggio` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `data` date DEFAULT NULL,
  `luogo` varchar(100) DEFAULT NULL,
  `id_amministratore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id_utente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `allievo`
--
ALTER TABLE `allievo`
  ADD PRIMARY KEY (`id_utente`);

--
-- Indici per le tabelle `amministratore`
--
ALTER TABLE `amministratore`
  ADD PRIMARY KEY (`id_utente`);

--
-- Indici per le tabelle `corso`
--
ALTER TABLE `corso`
  ADD PRIMARY KEY (`id_corso`),
  ADD KEY `id_insegnante` (`id_insegnante`);

--
-- Indici per le tabelle `genitore`
--
ALTER TABLE `genitore`
  ADD PRIMARY KEY (`id_utente`);

--
-- Indici per le tabelle `ha_figlio`
--
ALTER TABLE `ha_figlio`
  ADD PRIMARY KEY (`id_genitore`,`id_allievo`),
  ADD KEY `id_allievo` (`id_allievo`);

--
-- Indici per le tabelle `insegnante`
--
ALTER TABLE `insegnante`
  ADD PRIMARY KEY (`id_utente`);

--
-- Indici per le tabelle `iscrizione`
--
ALTER TABLE `iscrizione`
  ADD PRIMARY KEY (`id_allievo`,`id_corso`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indici per le tabelle `lezione`
--
ALTER TABLE `lezione`
  ADD PRIMARY KEY (`id_lezione`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indici per le tabelle `partecipa_saggio`
--
ALTER TABLE `partecipa_saggio`
  ADD PRIMARY KEY (`id_allievo`,`id_saggio`),
  ADD KEY `id_saggio` (`id_saggio`);

--
-- Indici per le tabelle `presenza`
--
ALTER TABLE `presenza`
  ADD PRIMARY KEY (`id_allievo`,`id_lezione`),
  ADD KEY `id_lezione` (`id_lezione`);

--
-- Indici per le tabelle `saggio`
--
ALTER TABLE `saggio`
  ADD PRIMARY KEY (`id_saggio`),
  ADD KEY `id_amministratore` (`id_amministratore`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corso`
--
ALTER TABLE `corso`
  MODIFY `id_corso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `lezione`
--
ALTER TABLE `lezione`
  MODIFY `id_lezione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `saggio`
--
ALTER TABLE `saggio`
  MODIFY `id_saggio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `allievo`
--
ALTER TABLE `allievo`
  ADD CONSTRAINT `allievo_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `amministratore`
--
ALTER TABLE `amministratore`
  ADD CONSTRAINT `amministratore_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `corso`
--
ALTER TABLE `corso`
  ADD CONSTRAINT `corso_ibfk_1` FOREIGN KEY (`id_insegnante`) REFERENCES `insegnante` (`id_utente`);

--
-- Limiti per la tabella `genitore`
--
ALTER TABLE `genitore`
  ADD CONSTRAINT `genitore_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `ha_figlio`
--
ALTER TABLE `ha_figlio`
  ADD CONSTRAINT `ha_figlio_ibfk_1` FOREIGN KEY (`id_genitore`) REFERENCES `genitore` (`id_utente`),
  ADD CONSTRAINT `ha_figlio_ibfk_2` FOREIGN KEY (`id_allievo`) REFERENCES `allievo` (`id_utente`);

--
-- Limiti per la tabella `insegnante`
--
ALTER TABLE `insegnante`
  ADD CONSTRAINT `insegnante_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id_utente`);

--
-- Limiti per la tabella `iscrizione`
--
ALTER TABLE `iscrizione`
  ADD CONSTRAINT `iscrizione_ibfk_1` FOREIGN KEY (`id_allievo`) REFERENCES `allievo` (`id_utente`),
  ADD CONSTRAINT `iscrizione_ibfk_2` FOREIGN KEY (`id_corso`) REFERENCES `corso` (`id_corso`);

--
-- Limiti per la tabella `lezione`
--
ALTER TABLE `lezione`
  ADD CONSTRAINT `lezione_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `corso` (`id_corso`);

--
-- Limiti per la tabella `partecipa_saggio`
--
ALTER TABLE `partecipa_saggio`
  ADD CONSTRAINT `partecipa_saggio_ibfk_1` FOREIGN KEY (`id_allievo`) REFERENCES `allievo` (`id_utente`),
  ADD CONSTRAINT `partecipa_saggio_ibfk_2` FOREIGN KEY (`id_saggio`) REFERENCES `saggio` (`id_saggio`);

--
-- Limiti per la tabella `presenza`
--
ALTER TABLE `presenza`
  ADD CONSTRAINT `presenza_ibfk_1` FOREIGN KEY (`id_allievo`) REFERENCES `allievo` (`id_utente`),
  ADD CONSTRAINT `presenza_ibfk_2` FOREIGN KEY (`id_lezione`) REFERENCES `lezione` (`id_lezione`);

--
-- Limiti per la tabella `saggio`
--
ALTER TABLE `saggio`
  ADD CONSTRAINT `saggio_ibfk_1` FOREIGN KEY (`id_amministratore`) REFERENCES `amministratore` (`id_utente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
