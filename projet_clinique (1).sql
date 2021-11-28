-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 28 nov. 2021 à 02:38
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_clinique`
--

-- --------------------------------------------------------

--
-- Structure de la table `dossier_medical`
--

CREATE TABLE `dossier_medical` (
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dossier_medical`
--

INSERT INTO `dossier_medical` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `posologie` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `code`, `nom`, `posologie`) VALUES
(1, 1234, 'Doliprane', 'A prendre trois fois par jour aprés chaque repas');

-- --------------------------------------------------------

--
-- Structure de la table `ordenance`
--

CREATE TABLE `ordenance` (
  `id_ordenance` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_medicament` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ordenance`
--

INSERT INTO `ordenance` (`id_ordenance`, `date`, `libelle`, `id_medicament`) VALUES
(1, '2021-10-05 21:52:12', 'Ord Demba', 1);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id_rendez_vous` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `libelle` varchar(255) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `prenom` varchar(255) NOT NULL,
  `id_consultation` int(11) DEFAULT NULL,
  `id_prestation` int(11) DEFAULT NULL,
  `consultation_demander` varchar(255) DEFAULT NULL,
  `prestation_demander` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`id_rendez_vous`, `date`, `libelle`, `nom`, `prenom`, `id_consultation`, `id_prestation`, `consultation_demander`, `prestation_demander`) VALUES
(1, '2021-10-12', 'Consultation', '2', '', 2, 4, '', ''),
(2, '2021-10-09', 'Prestation', NULL, '', NULL, NULL, '', ''),
(3, '2021-11-05', '', NULL, '', NULL, NULL, '', ''),
(4, '2021-11-22', 'Consultation', 'dot', 'dot', NULL, NULL, 'Radiologie', ''),
(5, '2021-11-22', 'Consultation', 'pape', 'pape', NULL, NULL, 'Pneumologue', ''),
(6, '2021-11-22', 'Consultation', 'bb', 'bb', NULL, NULL, 'Orthopediste', ''),
(7, '2021-11-22', 'Consultation', 'l', 'l', NULL, NULL, 'Radiologie', ''),
(8, '2021-11-22', 'Consultation', 'nnn', 'nnn', NULL, NULL, 'Pneumologue', ''),
(9, '2021-11-22', 'Consultation', 'IJH', '7Y', NULL, NULL, 'Orthopediste', ''),
(10, '2021-11-22', 'Consultation', 'pape', 'papepape', NULL, NULL, 'Pneumologue', ''),
(11, '2021-11-22', 'Consultation', 'qs', 'sq', NULL, NULL, 'Ophtalmologie', ''),
(12, '2021-11-23', 'Consultation', 'nn', 'nbbb', NULL, NULL, 'chiruie', ''),
(13, '2021-11-23', 'Consultation', 'prrrrro', 'proo', NULL, NULL, 'neurolo', ''),
(14, '2021-11-23', 'Consultation', 'nn', 'nnnnnn', NULL, NULL, 'Ophtalmologie', ''),
(15, '2021-11-23', 'Consultation', 'KJ', 'KJ', NULL, NULL, 'Ophtalmologie', ''),
(16, '2021-11-23', '', NULL, '', NULL, NULL, '', ''),
(17, '2021-11-23', 'Consultation', 'jo', 'jo', NULL, NULL, 'Ophtalmologie', NULL),
(18, '2021-11-23', 'Prestation', 'kokok', 'kokok', NULL, NULL, NULL, 'radiologie'),
(19, '2021-11-23', 'Prestation', 'jean', 'jean', NULL, NULL, NULL, 'chirurgie'),
(20, '2021-11-25', 'Prestation', 'momo', 'momoom', NULL, NULL, NULL, 'chirurgie');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `statut` varchar(2552) DEFAULT NULL,
  `antecedentmedicaux` varchar(2552) DEFAULT NULL,
  `id_ordenance` int(11) DEFAULT NULL,
  `id_rendez_vous` int(11) DEFAULT NULL,
  `id_consultation` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `login`, `password`, `role`, `statut`, `antecedentmedicaux`, `id_ordenance`, `id_rendez_vous`, `id_consultation`) VALUES
(1, 'Niang', 'Mouhamed', 'mo@gmail.com', '123', 'ROLE_PATIENT', NULL, 'Diabéte', 1, 1, 2),
(2, 'Ndiaye', 'Demba', 'de@gmail.com', '1234', 'ROLE_MEDECIN', NULL, NULL, NULL, 1, 2),
(3, 'Respo ', 'Presta', 'respo@gmail.com', '12345', 'ROLE_RESPONSABLE_PRESTATION', NULL, NULL, NULL, NULL, NULL),
(4, 'Adaisso', 'komla', 'oubi@gmail.com', '123', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(5, 'Diallo', 'Abdou', 'login', '1233', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(6, 'Sow', 'Demba', 'demba@gmail.com', '122222', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(7, 'p', 'p', 'p', 'ppp', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(8, 'ppoo', 'popopop', 'azpp', 'popoo', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(9, 'papedemba', 'papepapedo', 'pds', 'mmm', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL),
(10, 'malick', 'i', 'op', 'milk', 'ROLE_PATIENT', NULL, NULL, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ordenance`
--
ALTER TABLE `ordenance`
  ADD PRIMARY KEY (`id_ordenance`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id_rendez_vous`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ordenance`
--
ALTER TABLE `ordenance`
  MODIFY `id_ordenance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id_rendez_vous` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
