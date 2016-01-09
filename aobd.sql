-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 09 Janvier 2016 à 19:24
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aobd`
--

-- --------------------------------------------------------

--
-- Structure de la table `ao`
--

CREATE TABLE `ao` (
  `refAO` varchar(254) NOT NULL,
  `matU` int(11) NOT NULL,
  `objetAO` varchar(254) DEFAULT NULL,
  `estimation` decimal(8,0) DEFAULT NULL,
  `lieuExecution` varchar(254) DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `etatAO` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `aopublic`
--

CREATE TABLE `aopublic` (
  `refAO` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `aorestreint`
--

CREATE TABLE `aorestreint` (
  `refAO` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `critere`
--

CREATE TABLE `critere` (
  `refAO` varchar(254) NOT NULL,
  `critere` varchar(254) DEFAULT NULL,
  `coefficient` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `matU` int(11) NOT NULL,
  `numP` int(11) DEFAULT NULL,
  `societeF` varchar(254) DEFAULT NULL,
  `numCompteF` int(11) DEFAULT NULL,
  `siteF` varchar(254) DEFAULT NULL,
  `descriptionF` varchar(254) DEFAULT NULL,
  `statutF` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseuraopublic`
--

CREATE TABLE `fournisseuraopublic` (
  `matU` int(11) NOT NULL,
  `refAO` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseuraorestreint`
--

CREATE TABLE `fournisseuraorestreint` (
  `matU` int(11) NOT NULL,
  `refAO` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `profilutilisateur`
--

CREATE TABLE `profilutilisateur` (
  `matU` int(11) NOT NULL,
  `loginU` varchar(254) DEFAULT NULL,
  `mdpU` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `proposiition`
--

CREATE TABLE `proposiition` (
  `numP` int(11) NOT NULL,
  `refAO` varchar(254) NOT NULL,
  `matU` int(11) NOT NULL,
  `descriptionP` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `propositionfinanciere`
--

CREATE TABLE `propositionfinanciere` (
  `numP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `propositiontechnique`
--

CREATE TABLE `propositiontechnique` (
  `numP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsableachat`
--

CREATE TABLE `responsableachat` (
  `matU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `matU` int(11) NOT NULL,
  `nomU` varchar(254) DEFAULT NULL,
  `prenomU` varchar(254) DEFAULT NULL,
  `adresseU` varchar(254) DEFAULT NULL,
  `emailU` varchar(254) DEFAULT NULL,
  `telU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ao`
--
ALTER TABLE `ao`
  ADD PRIMARY KEY (`refAO`),
  ADD KEY `FK_association3` (`matU`);

--
-- Index pour la table `aopublic`
--
ALTER TABLE `aopublic`
  ADD PRIMARY KEY (`refAO`);

--
-- Index pour la table `aorestreint`
--
ALTER TABLE `aorestreint`
  ADD PRIMARY KEY (`refAO`);

--
-- Index pour la table `critere`
--
ALTER TABLE `critere`
  ADD PRIMARY KEY (`refAO`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`matU`),
  ADD KEY `FK_association7` (`numP`);

--
-- Index pour la table `fournisseuraopublic`
--
ALTER TABLE `fournisseuraopublic`
  ADD PRIMARY KEY (`matU`,`refAO`),
  ADD KEY `FK_fournisseurAOPublic` (`refAO`);

--
-- Index pour la table `fournisseuraorestreint`
--
ALTER TABLE `fournisseuraorestreint`
  ADD PRIMARY KEY (`matU`,`refAO`),
  ADD KEY `FK_fournisseurAORestreint` (`refAO`);

--
-- Index pour la table `profilutilisateur`
--
ALTER TABLE `profilutilisateur`
  ADD PRIMARY KEY (`matU`);

--
-- Index pour la table `proposiition`
--
ALTER TABLE `proposiition`
  ADD PRIMARY KEY (`numP`),
  ADD KEY `FK_association8` (`refAO`);

--
-- Index pour la table `propositionfinanciere`
--
ALTER TABLE `propositionfinanciere`
  ADD PRIMARY KEY (`numP`);

--
-- Index pour la table `propositiontechnique`
--
ALTER TABLE `propositiontechnique`
  ADD PRIMARY KEY (`numP`);

--
-- Index pour la table `responsableachat`
--
ALTER TABLE `responsableachat`
  ADD PRIMARY KEY (`matU`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`matU`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ao`
--
ALTER TABLE `ao`
  ADD CONSTRAINT `FK_association3` FOREIGN KEY (`matU`) REFERENCES `responsableachat` (`matU`);

--
-- Contraintes pour la table `aopublic`
--
ALTER TABLE `aopublic`
  ADD CONSTRAINT `FK_Generalization_5` FOREIGN KEY (`refAO`) REFERENCES `ao` (`refAO`);

--
-- Contraintes pour la table `aorestreint`
--
ALTER TABLE `aorestreint`
  ADD CONSTRAINT `FK_Generalization_4` FOREIGN KEY (`refAO`) REFERENCES `ao` (`refAO`);

--
-- Contraintes pour la table `critere`
--
ALTER TABLE `critere`
  ADD CONSTRAINT `FK_association2` FOREIGN KEY (`refAO`) REFERENCES `ao` (`refAO`);

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `FK_Generalization_3` FOREIGN KEY (`matU`) REFERENCES `utilisateur` (`matU`),
  ADD CONSTRAINT `FK_association7` FOREIGN KEY (`numP`) REFERENCES `proposiition` (`numP`);

--
-- Contraintes pour la table `fournisseuraopublic`
--
ALTER TABLE `fournisseuraopublic`
  ADD CONSTRAINT `FK_fournisseurAOPublic` FOREIGN KEY (`refAO`) REFERENCES `aopublic` (`refAO`);

--
-- Contraintes pour la table `fournisseuraorestreint`
--
ALTER TABLE `fournisseuraorestreint`
  ADD CONSTRAINT `FK_fournisseurAORestreint` FOREIGN KEY (`refAO`) REFERENCES `aorestreint` (`refAO`);

--
-- Contraintes pour la table `profilutilisateur`
--
ALTER TABLE `profilutilisateur`
  ADD CONSTRAINT `FK_association6` FOREIGN KEY (`matU`) REFERENCES `utilisateur` (`matU`);

--
-- Contraintes pour la table `proposiition`
--
ALTER TABLE `proposiition`
  ADD CONSTRAINT `FK_association8` FOREIGN KEY (`refAO`) REFERENCES `ao` (`refAO`);

--
-- Contraintes pour la table `propositionfinanciere`
--
ALTER TABLE `propositionfinanciere`
  ADD CONSTRAINT `FK_association10` FOREIGN KEY (`numP`) REFERENCES `proposiition` (`numP`);

--
-- Contraintes pour la table `propositiontechnique`
--
ALTER TABLE `propositiontechnique`
  ADD CONSTRAINT `FK_association11` FOREIGN KEY (`numP`) REFERENCES `proposiition` (`numP`);

--
-- Contraintes pour la table `responsableachat`
--
ALTER TABLE `responsableachat`
  ADD CONSTRAINT `FK_Generalization_2` FOREIGN KEY (`matU`) REFERENCES `utilisateur` (`matU`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
