-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 13, 2026 alle 10:37
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

--
-- Dump dei dati per la tabella `allievo`
--

INSERT INTO `allievo` (`id_utente`, `livello_danza`, `data_iscrizione_scuola`) VALUES
(1, 'Intermedio', '2022-09-01'),
(4, 'Base', '2023-09-01'),
(7, 'Avanzato', '2024-09-01');

-- --------------------------------------------------------

--
-- Struttura della tabella `amministratore`
--

CREATE TABLE `amministratore` (
  `id_utente` int(11) NOT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `amministratore`
--

INSERT INTO `amministratore` (`id_utente`, `biografia`) VALUES
(3, 'Paola Terracciano vanta una solida formazione in Danza Classica, coltivata per oltre un decennio come insegnante prima di assumere il ruolo di Direttrice Artistica della scuola. Oggi coordina la programmazione didattica ed organizzativa, garantendo standard qualitativi elevati in ogni corso e evento.');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
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

--
-- Dump dei dati per la tabella `corso`
--

INSERT INTO `corso` (`id_corso`, `nome`, `stile`, `livello`, `prezzo`, `id_insegnante`) VALUES
(1, 'Modern Base', 'Modern', 'Base', 45.00, 2),
(2, 'Modern Intermedio', 'Modern', 'Intermedio', 50.00, 2),
(3, 'Classico Avanzato', 'Classico', 'Avanzato', 50.00, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-09-13 08:07:53.726503'),
(2, 'auth', '0001_initial', '2026-09-13 08:07:54.186188'),
(3, 'admin', '0001_initial', '2026-09-13 08:07:54.299590'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-09-13 08:07:54.299590'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-09-13 08:07:54.312909'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-09-13 08:07:54.360481'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-09-13 08:07:54.424271'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-09-13 08:07:54.440140'),
(9, 'auth', '0004_alter_user_username_opts', '2026-09-13 08:07:54.453364'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-09-13 08:07:54.499975'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-09-13 08:07:54.502784'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-09-13 08:07:54.508390'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-09-13 08:07:54.520462'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-09-13 08:07:54.526476'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-09-13 08:07:54.534307'),
(16, 'auth', '0011_update_proxy_permissions', '2026-09-13 08:07:54.552190'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-09-13 08:07:54.566084'),
(18, 'sessions', '0001_initial', '2026-09-13 08:07:54.592206');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('iggjvusxdlhtazk139epaxurcot357st', '.eJyrVspMiS8tSc0rSVWyMtVRysvPTYXzlXzyi1JTEvMSFYJK09MzU4vylXSUikrzc_KBcumpeZklQHmlWgA7iBgE:1x5fXh:6fvXeHdbaMT3w4JyxalC_z2MuiCH50DslgdgMQV4gJk', '2026-09-27 08:26:29.743910');

-- --------------------------------------------------------

--
-- Struttura della tabella `genitore`
--

CREATE TABLE `genitore` (
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `genitore`
--

INSERT INTO `genitore` (`id_utente`) VALUES
(5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ha_figlio`
--

CREATE TABLE `ha_figlio` (
  `id_genitore` int(11) NOT NULL,
  `id_allievo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ha_figlio`
--

INSERT INTO `ha_figlio` (`id_genitore`, `id_allievo`) VALUES
(5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `insegnante`
--

CREATE TABLE `insegnante` (
  `id_utente` int(11) NOT NULL,
  `specializzazione` varchar(50) DEFAULT NULL,
  `anni_esperienza` int(11) DEFAULT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `insegnante`
--

INSERT INTO `insegnante` (`id_utente`, `specializzazione`, `anni_esperienza`, `biografia`) VALUES
(2, 'Modern', 15, 'Diplomato in Modern Dance e formatosi tra Italia e Francia, Andrea Arionte porta in aula oltre 15 anni di esperienza artistica e didattica. Il suo metodo unisce rigore tecnico e libertà espressiva, con l\'obiettivo di accompagnare ogni allievo verso una piena consapevolezza del movimento.'),
(6, 'Danza Classica', 12, 'Giovanna Iovino ha studiato Danza Classica presso rinomate accademie italiane, portando in aula rigore tecnico e amore per la tradizione, oltre a un metodo capace di valorizzare la crescita di ogni allievo.');

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

--
-- Dump dei dati per la tabella `iscrizione`
--

INSERT INTO `iscrizione` (`id_allievo`, `id_corso`, `data_iscrizione`, `quota_pagata`, `stato`) VALUES
(1, 2, '2024-09-05', 50.00, 'attiva'),
(4, 1, '2024-09-10', 45.00, 'attiva'),
(7, 3, '2024-09-01', 50.00, 'attiva');

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

--
-- Dump dei dati per la tabella `lezione`
--

INSERT INTO `lezione` (`id_lezione`, `data`, `ora_inizio`, `ora_fine`, `id_corso`) VALUES
(1, '2024-09-16', '16:00:00', '17:00:00', 1),
(2, '2024-09-18', '16:00:00', '17:00:00', 1),
(3, '2024-09-20', '16:00:00', '17:00:00', 1),
(4, '2024-09-16', '17:30:00', '19:00:00', 2),
(5, '2024-09-18', '17:30:00', '19:00:00', 2),
(6, '2024-09-20', '17:30:00', '19:00:00', 2),
(7, '2024-09-17', '18:00:00', '19:30:00', 3),
(8, '2024-09-19', '18:00:00', '19:30:00', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipa_saggio`
--

CREATE TABLE `partecipa_saggio` (
  `id_allievo` int(11) NOT NULL,
  `id_saggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partecipa_saggio`
--

INSERT INTO `partecipa_saggio` (`id_allievo`, `id_saggio`) VALUES
(1, 1),
(1, 2),
(4, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `presenza`
--

CREATE TABLE `presenza` (
  `id_allievo` int(11) NOT NULL,
  `id_lezione` int(11) NOT NULL,
  `presente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `presenza`
--

INSERT INTO `presenza` (`id_allievo`, `id_lezione`, `presente`) VALUES
(4, 1, 1);

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

--
-- Dump dei dati per la tabella `saggio`
--

INSERT INTO `saggio` (`id_saggio`, `titolo`, `data`, `luogo`, `id_amministratore`) VALUES
(1, 'Saggio di Fine Anno', '2027-06-14', 'Teatro Comunale', 3),
(2, 'Saggio di Natale', '2026-12-21', 'Auditorium Comunale', 3);

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
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`id_utente`, `nome`, `cognome`, `email`, `password`, `data_nascita`, `telefono`) VALUES
(1, 'Riccardo', 'De Riggi', 'riccardo.deriggi@email.com', 'pass123', '2001-06-10', '3331234567'),
(2, 'Andrea', 'Arionte', 'andrea.arionte@email.com', 'pass456', '1988-04-15', '3339876543'),
(3, 'Paola', 'Terracciano', 'paola.terracciano@email.com', 'pass789', '1982-09-23', '3335551234'),
(4, 'Claudia', 'Vaia', 'claudia.vaia@email.com', 'passabc', '2011-02-28', '3337778899'),
(5, 'Loredana', 'Ruggiero', 'loredana.ruggiero@email.com', 'passxyz', '1978-12-05', '3332223344'),
(6, 'Giovanna', 'Iovino', 'giovanna.iovino@email.com', 'pass111', '1980-03-12', '3334445566'),
(7, 'Rebecca', 'Cappelluccio', 'rebecca.cappelluccio@email.com', 'pass333', '2003-11-08', '3336667788');

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
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `corso`
--
ALTER TABLE `corso`
  ADD PRIMARY KEY (`id_corso`),
  ADD KEY `id_insegnante` (`id_insegnante`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

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
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corso`
--
ALTER TABLE `corso`
  MODIFY `id_corso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `lezione`
--
ALTER TABLE `lezione`
  MODIFY `id_lezione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `saggio`
--
ALTER TABLE `saggio`
  MODIFY `id_saggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `corso`
--
ALTER TABLE `corso`
  ADD CONSTRAINT `corso_ibfk_1` FOREIGN KEY (`id_insegnante`) REFERENCES `insegnante` (`id_utente`);

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
