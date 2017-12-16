-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 10 Février 2017 à 23:25
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `banking_system`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `code_client` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `num_cin` bigint(20) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `telephone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`code_client`, `email`, `nom`, `adresse`, `date_naissance`, `num_cin`, `prenom`, `profession`, `telephone`) VALUES
(1, 'safwen@gmail.com', 'Safwen', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ali@yahoo.fr', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'ahmed@gmail.com', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `type_cpte` varchar(2) NOT NULL,
  `code_compte` varchar(255) NOT NULL,
  `date_ceation` datetime DEFAULT NULL,
  `solde` double DEFAULT NULL,
  `decouvert` double DEFAULT NULL,
  `taux` double DEFAULT NULL,
  `code_cli` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`code_compte`),
  KEY `FK_m1cpil8dd89l4ll74htgn9eh1` (`code_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`type_cpte`, `code_compte`, `date_ceation`, `solde`, `decouvert`, `taux`, `code_cli`) VALUES
('CC', 'c1', '2017-02-07 16:31:04', 15000, 1000, NULL, 1),
('CC', 'c2', '2017-02-07 16:31:04', -3000, 3000, NULL, 2),
('CE', 'c3', '2017-02-07 16:31:04', 10000, NULL, 400, 3);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `type_op` varchar(1) NOT NULL,
  `code_operation` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_operation` datetime DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `code_cpte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_operation`),
  KEY `FK_klsmr6cbrg4rx9kfuuxfckfic` (`code_cpte`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`type_op`, `code_operation`, `date_operation`, `montant`, `code_cpte`) VALUES
('V', 1, '2017-02-07 16:31:04', 10000, 'c1'),
('R', 2, '2017-02-07 16:31:04', 10000, 'c2'),
('R', 3, '2017-02-07 16:31:04', 1000, 'c1'),
('V', 4, '2017-02-07 16:31:04', 1000, 'c3'),
('R', 5, '2017-02-07 16:31:04', 1000, 'c1'),
('V', 6, '2017-02-07 16:31:04', 1000, 'c2'),
('V', 7, '2017-02-07 16:33:40', 1000, 'c1'),
('R', 8, '2017-02-07 16:33:40', 1000, 'c2'),
('R', 9, '2017-02-07 16:33:40', 1000, 'c1'),
('V', 10, '2017-02-07 16:33:40', 1000, 'c3'),
('R', 11, '2017-02-07 16:33:40', 2000, 'c1'),
('V', 12, '2017-02-07 16:33:40', 2000, 'c2'),
('V', 13, '2017-02-07 16:34:15', 1000, 'c1'),
('R', 14, '2017-02-07 16:34:15', 1000, 'c2'),
('R', 15, '2017-02-07 16:34:15', 1000, 'c1'),
('V', 16, '2017-02-07 16:34:15', 1000, 'c3'),
('R', 17, '2017-02-07 16:34:15', 2000, 'c1'),
('V', 18, '2017-02-07 16:34:15', 2000, 'c2'),
('V', 19, '2017-02-07 16:35:29', 1000, 'c1'),
('R', 20, '2017-02-07 16:35:29', 1000, 'c2'),
('R', 21, '2017-02-07 16:35:29', 1000, 'c1'),
('V', 22, '2017-02-07 16:35:29', 1000, 'c3'),
('R', 23, '2017-02-07 16:35:29', 2000, 'c1'),
('V', 24, '2017-02-07 16:35:29', 2000, 'c2'),
('V', 25, '2017-02-07 16:35:46', 1000, 'c1'),
('R', 26, '2017-02-07 16:35:46', 1000, 'c2'),
('R', 27, '2017-02-07 16:35:46', 1000, 'c1'),
('V', 28, '2017-02-07 16:35:46', 1000, 'c3'),
('R', 29, '2017-02-07 16:35:46', 2000, 'c1'),
('V', 30, '2017-02-07 16:35:46', 2000, 'c2'),
('V', 31, '2017-02-07 16:36:10', 1000, 'c1'),
('R', 32, '2017-02-07 16:36:10', 1000, 'c2'),
('R', 33, '2017-02-07 16:36:11', 1000, 'c1'),
('V', 34, '2017-02-07 16:36:11', 1000, 'c3'),
('R', 35, '2017-02-07 16:36:11', 2000, 'c1'),
('V', 36, '2017-02-07 16:36:11', 2000, 'c2'),
('V', 37, '2017-02-07 16:36:24', 1000, 'c1'),
('R', 38, '2017-02-07 16:36:24', 1000, 'c2'),
('R', 39, '2017-02-07 16:36:24', 1000, 'c1'),
('V', 40, '2017-02-07 16:36:24', 1000, 'c3'),
('R', 41, '2017-02-07 16:36:24', 2000, 'c1'),
('V', 42, '2017-02-07 16:36:24', 2000, 'c2'),
('V', 43, '2017-02-08 12:00:08', 1000, 'c3'),
('V', 44, '2017-02-08 12:00:19', 1000, 'c3'),
('R', 45, '2017-02-08 12:00:42', 8000, 'c3'),
('R', 46, '2017-02-08 12:01:11', 2000, 'c3'),
('R', 47, '2017-02-08 12:01:39', 1000, 'c1'),
('V', 48, '2017-02-08 12:01:39', 1000, 'c3'),
('V', 49, '2017-02-08 12:02:11', 2000, 'c3'),
('R', 50, '2017-02-08 12:02:42', 3000, 'c3'),
('V', 51, '2017-02-08 12:02:42', 3000, 'c1'),
('V', 52, '2017-02-08 12:10:36', 5000, 'c1'),
('R', 53, '2017-02-08 12:25:13', 1000, 'c3'),
('R', 54, '2017-02-08 12:27:44', 1000, 'c3'),
('V', 55, '2017-02-08 12:37:41', 2000, 'c1'),
('V', 56, '2017-02-08 12:37:49', 5000, 'c1'),
('V', 57, '2017-02-08 12:38:06', 40000, 'c1'),
('R', 58, '2017-02-08 12:43:21', 10000, 'c1'),
('V', 59, '2017-02-08 12:43:28', 100000, 'c1'),
('V', 60, '2017-02-08 12:49:21', 4000, 'c3'),
('R', 61, '2017-02-08 12:49:30', 4000, 'c3'),
('R', 62, '2017-02-08 12:50:07', 1000, 'c3'),
('R', 63, '2017-02-08 12:51:00', 4000, 'c2'),
('V', 64, '2017-02-08 12:51:06', 4000, 'c2'),
('R', 65, '2017-02-08 12:59:19', 1000, 'c2'),
('V', 66, '2017-02-08 12:59:28', 10000, 'c2'),
('V', 67, '2017-02-08 13:01:11', 100000, 'c1'),
('R', 68, '2017-02-08 13:24:03', 10000, 'c1'),
('V', 69, '2017-02-08 13:24:11', 100000, 'c1'),
('V', 70, '2017-02-08 13:24:17', 100000, 'c1'),
('R', 72, '2017-02-08 13:56:48', 10000, 'c1'),
('V', 73, '2017-02-08 13:58:25', 1000, 'c1'),
('R', 74, '2017-02-08 13:58:36', 40000, 'c1'),
('V', 75, '2017-02-08 13:58:41', 400000, 'c1'),
('V', 76, '2017-02-08 14:00:05', 1000, 'c2'),
('R', 77, '2017-02-08 14:09:34', 1000, 'c2'),
('V', 78, '2017-02-08 14:10:15', 1000, 'c2'),
('R', 79, '2017-02-08 14:16:51', 5000, 'c3'),
('V', 80, '2017-02-08 14:16:51', 5000, 'c1'),
('V', 82, '2017-02-08 18:54:19', 6000, 'c2'),
('R', 83, '2017-02-08 18:54:55', 23000, 'c2'),
('V', 84, '2017-02-08 18:54:55', 23000, 'c1'),
('R', 85, '2017-02-08 21:23:46', 5000, 'c1'),
('R', 86, '2017-02-08 22:13:13', 1000, 'c1'),
('V', 87, '2017-02-08 22:13:21', 200000, 'c1'),
('R', 88, '2017-02-08 22:35:08', 1000000, 'c1'),
('R', 89, '2017-02-08 22:59:15', 1000, 'C1'),
('V', 90, '2017-02-08 23:53:51', 4000, 'c1'),
('V', 91, '2017-02-09 21:13:45', 10000, 'c1'),
('R', 92, '2017-02-09 21:14:12', 4000, 'c1'),
('V', 93, '2017-02-09 21:14:12', 4000, 'c3'),
('R', 94, '2017-02-10 15:59:31', 10000, 'c1'),
('V', 95, '2017-02-10 15:59:31', 10000, 'c3'),
('V', 96, '2017-02-10 16:00:01', 5000, 'c1'),
('R', 97, '2017-02-10 22:38:11', 10000, 'c3'),
('R', 98, '2017-02-10 23:08:59', 1000, 'c3'),
('R', 99, '2017-02-10 23:09:33', 7000, 'c1'),
('V', 100, '2017-02-10 23:09:33', 7000, 'c3'),
('R', 101, '2017-02-10 23:59:09', 5000, 'c1'),
('V', 102, '2017-02-10 23:59:24', 10000, 'c1');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`role`) VALUES
('ADMIN'),
('USER');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user`, `password`, `actif`) VALUES
('ali', '81dc9bdb52d04dc20036dbd8313ed055', 1),
('safwen', '81dc9bdb52d04dc20036dbd8313ed055', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_has_role`
--

CREATE TABLE IF NOT EXISTS `user_has_role` (
  `user` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`user`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_has_role`
--

INSERT INTO `user_has_role` (`user`, `role`) VALUES
('ali', 'USER'),
('safwen', 'ADMIN'),
('safwen', 'USER');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK_m1cpil8dd89l4ll74htgn9eh1` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code_client`);

--
-- Contraintes pour la table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `FK_klsmr6cbrg4rx9kfuuxfckfic` FOREIGN KEY (`code_cpte`) REFERENCES `compte` (`code_compte`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
