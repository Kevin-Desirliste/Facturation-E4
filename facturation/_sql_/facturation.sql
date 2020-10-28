-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 28 oct. 2020 à 23:10
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `facturation`
--

-- --------------------------------------------------------

--
-- Structure de la table `brasserie`
--

DROP TABLE IF EXISTS `brasserie`;
CREATE TABLE IF NOT EXISTS `brasserie` (
  `id_plat_brasserie` int(11) NOT NULL,
  `libelle_plat` varchar(80) DEFAULT NULL,
  `prix_plat` int(11) NOT NULL,
  `cat_brasserie` varchar(10) NOT NULL,
  PRIMARY KEY (`id_plat_brasserie`),
  KEY `brasserie_fk1` (`cat_brasserie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `brasserie`
--

INSERT INTO `brasserie` (`id_plat_brasserie`, `libelle_plat`, `prix_plat`, `cat_brasserie`) VALUES
(1, 'Salade Tahitienne', 2050, 'entsal'),
(2, 'Assiette d\'os à moelle au sel de Guérande', 1500, 'entsal'),
(3, 'Salade tiède au jarret', 2050, 'entsal'),
(4, 'Tartine au chèvre chaud sur lit de salade ', 1750, 'entsal'),
(5, 'Salade Jean-Pierre', 2050, 'entsal'),
(6, 'La salade verte avec un filet d\'huile d\'olive ou vinaigrette', 800, 'entsal'),
(7, 'La salade verte au Roquefort et noix', 950, 'entsal'),
(8, 'Crevettes décortiquées poêlées et flambées ', 2950, 'crevpays'),
(9, 'Crevettes décortiquées poêlées au curry et ses amendes grillées', 2950, 'crevpays'),
(10, 'Tartare de thon préparé à  la moutarde à l\'ancienne et sa garniture ', 2450, 'prodmer'),
(11, 'Steak de thon mi-cuit vierge aux fruits frais et son riz coco', 2850, 'prodmer'),
(12, 'Noix d\'entrecôte (200g, 1er choix origine Nouvelle Zélande)', 2850, 'viandgrill'),
(13, 'La pièce du boucher', 3750, 'viandgrill'),
(14, 'La Churascaia', 5100, 'viandgrill'),
(15, 'Travers de porc sauce barbecue', 3150, 'viandgrill'),
(16, 'Escalope de veau normande', 2650, 'viandgrill'),
(17, 'Os à la moelle pour accompagnement', 500, 'viandgrill'),
(18, 'Tartare de boeuf aux condiments préparé à la demande', 2650, 'viandcrus'),
(19, 'Les sauces ', 300, 'sauces'),
(20, 'Hamburger pur Boeuf, frites à volonté', 2050, 'hamburg'),
(21, 'La tagliatelle carbonara', 1700, 'pates'),
(22, 'La tagliatelle au saumon', 2800, 'pates'),
(23, 'La tagliatelle aux crevettes décortiquées', 2800, 'pates'),
(24, 'Formule Flammekueche à volonté', 3250, 'flamme'),
(25, 'La Classique ', 1200, 'flammsale'),
(26, 'La Forestière', 1350, 'flammsale'),
(27, 'La Gratinée', 1350, 'flammsale'),
(28, 'La Spéciale Brasseurs', 1500, 'flammsale'),
(29, 'La Chèvre Chaud', 1600, 'flammsale'),
(30, 'La Choucroute', 1750, 'flammsale'),
(31, 'La Napolitaine ', 1450, 'flammsale'),
(32, 'La Saumon', 1800, 'flammsale'),
(33, 'La Végétarienne', 1500, 'flammsale'),
(34, 'La Crevette', 1950, 'flammsale'),
(35, 'Les Trois Fromages ', 1700, 'flammsale'),
(36, 'La Charcutière ', 1800, 'flammsale'),
(37, 'La Pomme', 950, 'flammsucre'),
(38, 'La Pomme Glacée', 1050, 'flammsucre'),
(39, 'La Belle Hélène ', 1150, 'flammsucre'),
(40, 'La Ch\'ti', 1200, 'flammsucre'),
(41, 'La Normande ', 1200, 'flammsucre'),
(42, 'La Coco', 1100, 'flammsucre'),
(43, 'La Spéciale \"3B\"', 1100, 'flammsucre'),
(44, 'La Tout Chocolat', 1100, 'flammsucre'),
(45, 'La Martiniquaise', 1200, 'flammsucre');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_bar`
--

DROP TABLE IF EXISTS `categorie_bar`;
CREATE TABLE IF NOT EXISTS `categorie_bar` (
  `id_cat_consommation` varchar(20) NOT NULL,
  `libelle_cat_consommation` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cat_consommation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_bar`
--

INSERT INTO `categorie_bar` (`id_cat_consommation`, `libelle_cat_consommation`) VALUES
('aperitif_biere', 'Les apéritifs à la bière'),
('aperitif_cocktail', 'Les cocktails à la bière'),
('bi_ambree', 'Bière à la pression - Ambrée'),
('bi_blanche', 'Bière à la pression - Blanche'),
('bi_blonde', 'Bière à la pression - Blonde'),
('bi_laspeciale', 'Bière à la pression - La Spéciale'),
('bi_palette', 'La palette de bières'),
('bi_scotch', 'Bière à la pression - Scotch'),
('boissons_alcool', 'Boissons - Alcool'),
('boissons_cocktails', 'Boissons - Cocktails'),
('boisson_aperitif', 'Boissons - Apéritifs'),
('boisson_cavewhiskey', 'La cave à Whiskey'),
('cave', 'La cave'),
('eau', 'Les eaux minérales'),
('jus', 'Jus de fruits'),
('nectars', 'Les nectars '),
('soda', 'Les sodas');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_brasserie`
--

DROP TABLE IF EXISTS `categorie_brasserie`;
CREATE TABLE IF NOT EXISTS `categorie_brasserie` (
  `id_cat_brasserie` varchar(10) CHARACTER SET utf8 NOT NULL,
  `libelle_cat_brasserie` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cat_brasserie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_brasserie`
--

INSERT INTO `categorie_brasserie` (`id_cat_brasserie`, `libelle_cat_brasserie`) VALUES
('crevpays', 'Les crevettes du pays'),
('entsal', 'Entrées et salades'),
('flamme', 'Formule Flammekueche à volonté'),
('flammsale', 'Flammekueches salées'),
('flammsucre', 'Flammekueches sucrées'),
('hamburg', 'Hamburger'),
('pates', 'Les pâtes'),
('prodmer', 'Produits de la mer'),
('sauces', 'Sauces '),
('viandcrus', 'Les viandes crus'),
('viandgrill', 'Les viandes grillées');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_chambre`
--

DROP TABLE IF EXISTS `categorie_chambre`;
CREATE TABLE IF NOT EXISTS `categorie_chambre` (
  `id_cat_chambre` varchar(20) NOT NULL,
  `libelle_chambre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cat_chambre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_chambre`
--

INSERT INTO `categorie_chambre` (`id_cat_chambre`, `libelle_chambre`) VALUES
('bungalow_jardin', 'BUNGALOW JARDIN'),
('bungalow_lagon', 'BUNGALOW SUR LE LAGON'),
('chambre_classique', 'CHAMBRE CLASSIQUE'),
('suite_classique', 'SUITE CLASSIQUE ');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_spa`
--

DROP TABLE IF EXISTS `categorie_spa`;
CREATE TABLE IF NOT EXISTS `categorie_spa` (
  `id_catspa` varchar(20) CHARACTER SET utf8 NOT NULL,
  `libelle_catspa` varchar(50) NOT NULL DEFAULT '',
  `durée` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_catspa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie_spa`
--

INSERT INTO `categorie_spa` (`id_catspa`, `libelle_catspa`, `durée`) VALUES
('enveloppement', 'ENVELOPPEMENT', '30min'),
('soin_alacte_creme', 'SOIN AROMA-LACTÉ CRÈME FRAÎCHE', '1h30'),
('soin_aperfection', 'SOIN AROMA-PERFECTION AUX PLANTES', '1h30'),
('soin_biobeaute', 'SOIN BIO-BEAUTÉ', '1h30'),
('soin_bjoueurH', 'SOIN BEAU JOUEUR - Pour Homme ', '1h30'),
('soin_bodyrelax', 'SOIN «BODY RELAXANT» ', '1h'),
('soin_dos', 'SOIN du dos ', '1h30'),
('soin_extraitarbreH', 'SOIN EXPRESS AUX EXTRAITS D’ARBRES - Pour Homme', '30min'),
('soin_fleurs', 'SOIN ÉCLAT IMMÉDIAT AUX FLEURS', '1h'),
('soin_immortelle', 'SOIN PRODIGIEUX À L’IMMORTELLE BLEUE', '1h'),
('soin_merveilexpert', 'SOIN MERVEILLANCE expert', '1h30'),
('soin_nirvanesque', 'SOIN NIRVANESQUE', '1h30'),
('soin_nuxellence', 'SOIN NUXELLENCE', '1h30'),
('soin_prodigieux', 'SOIN PRODIGIEUX', '1h30'),
('soin_puretedos', 'SOIN PURETÉ DU DOS - Pour Homme', '1h30'),
('soin_revelateureclat', 'SOIN RÉVÉLATEUR D’ÉCLAT IMMÉDIAT', '1h'),
('soin_revemiel', 'SOIN RÊVE DE MIEL', '1h30'),
('soin_reveorient', 'SOIN RÊVERIE ORIENTALE', '2h'),
('soin_ureconfort_miel', 'SOIN ULTRA-RÉCONFORTANT AU MIEL', '1h30'),
('soin_yeuxeclat', 'SOIN CONTOUR DES YEUX ÉCLAT', '30min');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `num_chambre` int(11) NOT NULL,
  `prix_chambre` int(11) NOT NULL,
  `capacité` int(3) NOT NULL DEFAULT '0',
  `cat_chambre` varchar(20) NOT NULL,
  PRIMARY KEY (`num_chambre`),
  KEY `chambre_fk1` (`cat_chambre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`num_chambre`, `prix_chambre`, `capacité`, `cat_chambre`) VALUES
(1, 35000, 3, 'bungalow_lagon'),
(2, 17000, 1, 'chambre_classique'),
(3, 26000, 1, 'bungalow_jardin'),
(4, 20000, 2, 'chambre_classique');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `num_client` int(11) NOT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `prenom_client` varchar(50) DEFAULT NULL,
  `datenaiss` date NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `tel` int(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`num_client`, `nom_client`, `prenom_client`, `datenaiss`, `adresse`, `tel`, `mail`) VALUES
(1, 'Desirliste', 'Kevin', '2000-05-09', 'Rue Chitty', 548339, 'kevin.desirliste@gmail.com'),
(2, 'Falematagia', 'Mirenza', '2000-07-04', 'Kolopopo', 8218224, 'falematagia.mirenza@gmail.com'),
(3, 'O\'brien', 'Walter', '1982-09-22', 'Rue des Bergers ', 354221, 'obrien.walter@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `concerne_bar`
--

DROP TABLE IF EXISTS `concerne_bar`;
CREATE TABLE IF NOT EXISTS `concerne_bar` (
  `num_facture_bar` int(5) NOT NULL,
  `id_consommation_bar` int(11) NOT NULL,
  `quantité_bar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_facture_bar`,`id_consommation_bar`),
  KEY `concerne_bar_fk2` (`id_consommation_bar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `concerne_bar`
--

INSERT INTO `concerne_bar` (`num_facture_bar`, `id_consommation_bar`, `quantité_bar`) VALUES
(1, 46, 1),
(2, 102, 2),
(3, 35, 1),
(3, 60, 1);

-- --------------------------------------------------------

--
-- Structure de la table `concerne_brasserie`
--

DROP TABLE IF EXISTS `concerne_brasserie`;
CREATE TABLE IF NOT EXISTS `concerne_brasserie` (
  `num_facture_brasserie` int(5) NOT NULL,
  `id_plat_brasserie` int(11) NOT NULL,
  `quantité_brasserie` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_facture_brasserie`,`id_plat_brasserie`),
  KEY `concerne_brasserie_fk2` (`id_plat_brasserie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `concerne_brasserie`
--

INSERT INTO `concerne_brasserie` (`num_facture_brasserie`, `id_plat_brasserie`, `quantité_brasserie`) VALUES
(1, 8, 2),
(2, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `concerne_chambre`
--

DROP TABLE IF EXISTS `concerne_chambre`;
CREATE TABLE IF NOT EXISTS `concerne_chambre` (
  `num_sej_chambre` int(5) NOT NULL,
  `num_chambre` int(11) NOT NULL,
  PRIMARY KEY (`num_sej_chambre`,`num_chambre`),
  KEY `concerne_chambre_fk2` (`num_chambre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `concerne_chambre`
--

INSERT INTO `concerne_chambre` (`num_sej_chambre`, `num_chambre`) VALUES
(1, 1),
(2, 1),
(3, 2),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `concerne_spa`
--

DROP TABLE IF EXISTS `concerne_spa`;
CREATE TABLE IF NOT EXISTS `concerne_spa` (
  `num_soin` int(11) NOT NULL,
  `num_facture_spa` int(11) NOT NULL,
  `quantite_spa` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_soin`,`num_facture_spa`),
  KEY `concerne_spa_fk2` (`num_facture_spa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `concerne_spa`
--

INSERT INTO `concerne_spa` (`num_soin`, `num_facture_spa`, `quantite_spa`) VALUES
(1, 1, 2),
(17, 3, 1),
(19, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

DROP TABLE IF EXISTS `consommation`;
CREATE TABLE IF NOT EXISTS `consommation` (
  `id_consommation_bar` int(11) NOT NULL,
  `libelle_consommation` varchar(80) DEFAULT NULL,
  `prix_consommation` int(11) NOT NULL,
  `cat_consommation` varchar(20) NOT NULL,
  PRIMARY KEY (`id_consommation_bar`),
  KEY `consommation_fk1` (`cat_consommation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consommation`
--

INSERT INTO `consommation` (`id_consommation_bar`, `libelle_consommation`, `prix_consommation`, `cat_consommation`) VALUES
(1, 'Le demi, 25 cl', 700, 'bi_blanche'),
(2, 'Le demi, 25 cl', 700, 'bi_blonde'),
(3, 'Le demi, 25 cl', 700, 'bi_ambree'),
(4, 'Le demi, 25 cl', 700, 'bi_scotch'),
(5, 'Le demi, 25 cl', 750, 'bi_laspeciale'),
(6, 'Le taverne, 33 cl', 800, 'bi_blanche'),
(7, 'Le taverne, 33 cl', 800, 'bi_blonde'),
(8, 'Le taverne, 33 cl', 800, 'bi_ambree'),
(9, 'Le taverne, 33 cl', 800, 'bi_scotch'),
(10, 'Le taverne, 33 cl', 850, 'bi_laspeciale'),
(11, 'Le brasseur, 50 cl', 1000, 'bi_blanche'),
(12, 'Le brasseur, 50 cl', 1000, 'bi_blonde'),
(13, 'Le brasseur, 50 cl', 1000, 'bi_ambree'),
(14, 'Le brasseur, 50 cl', 1000, 'bi_scotch'),
(15, 'Le brasseur, 50 cl', 1050, 'bi_laspeciale'),
(16, 'Le formidable, 100 cl', 1900, 'bi_blanche'),
(17, 'Le formidable, 100 cl', 1900, 'bi_blonde'),
(18, 'Le formidable, 100 cl', 1900, 'bi_ambree'),
(19, 'Le formidable, 100 cl', 1900, 'bi_scotch'),
(20, 'Le formidable, 100 cl', 1950, 'bi_laspeciale'),
(21, 'Le pitcher, 1.5 l', 3200, 'bi_blanche'),
(22, 'Le pitcher, 1.5 l', 3200, 'bi_blonde'),
(23, 'Le pitcher, 1.5 l', 3200, 'bi_ambree'),
(24, 'Le pitcher, 1.5 l', 3200, 'bi_scotch'),
(25, 'Le pitcher, 1.5 l', 3300, 'bi_laspeciale'),
(26, 'Le mètre, 25cl x 10', 5000, 'bi_blanche'),
(27, 'Le mètre, 25cl x 10', 5000, 'bi_blonde'),
(28, 'Le mètre, 25cl x 10', 5000, 'bi_ambree'),
(29, 'Le mètre, 25cl x 10', 5000, 'bi_scotch'),
(30, 'Le mètre, 25cl x 10', 5200, 'bi_laspeciale'),
(31, 'La palette de bières', 1300, 'bi_palette'),
(32, 'Le Panaché, 25 cl', 650, 'aperitif_biere'),
(33, 'Le Panaché, 33 cl', 700, 'aperitif_biere'),
(34, 'Le Panaché, 50 cl', 900, 'aperitif_biere'),
(35, 'Le Panaché, 1 l', 1500, 'aperitif_biere'),
(36, 'Le Panaché, Pitcher', 3200, 'aperitif_biere'),
(37, 'Le Tango, 25 cl', 700, 'aperitif_biere'),
(38, 'Le Tango, 33 cl', 800, 'aperitif_biere'),
(39, 'Le Tango, 50 cl', 1100, 'aperitif_biere'),
(40, 'Le Tango, 1 l', 1750, 'aperitif_biere'),
(41, 'Le Tango, Pitcher', 3200, 'aperitif_biere'),
(42, 'Le Monaco, 25 cl', 700, 'aperitif_biere'),
(43, 'Le Monaco, 33 cl', 800, 'aperitif_biere'),
(44, 'Le Monaco, 50 cl', 1100, 'aperitif_biere'),
(45, 'Le Monaco, 1 l', 1750, 'aperitif_biere'),
(46, 'Le Monaco, Pitcher', 3200, 'aperitif_biere'),
(47, 'Le Picon-bière, 25 cl', 1100, 'aperitif_cocktail'),
(48, 'Le Picon-bière, 33 cl', 1350, 'aperitif_cocktail'),
(49, 'Le Picon-bière, 50 cl', 1900, 'aperitif_cocktail'),
(50, 'Le Picon-bière, 1 l', 2400, 'aperitif_cocktail'),
(51, 'Le Picon-bière, Pitcher', 4200, 'aperitif_cocktail'),
(52, 'Le Nord Express, 25 cl', 1100, 'aperitif_cocktail'),
(53, 'Le Nord Express, 33 cl', 1350, 'aperitif_cocktail'),
(54, 'Le Nord Express, 50 cl', 1900, 'aperitif_cocktail'),
(55, 'Le Nord Express, 1 l', 2400, 'aperitif_cocktail'),
(56, 'Le Nord Express, Pitcher', 4200, 'aperitif_cocktail'),
(57, 'Le Mexicanos, 25 cl', 1100, 'aperitif_cocktail'),
(58, 'Le Mexicanos, 33 cl', 1350, 'aperitif_cocktail'),
(59, 'Le Mexicanos, 50 cl', 1900, 'aperitif_cocktail'),
(60, 'Le Mexicanos, 1 cl', 2400, 'aperitif_cocktail'),
(61, 'Le Mexicanos, Pitcher', 4200, 'aperitif_cocktail'),
(62, 'Le Habana, 25 cl', 1100, 'aperitif_cocktail'),
(63, 'Le Habana, 33 cl', 1350, 'aperitif_cocktail'),
(64, 'Le Habana, 50 cl', 1900, 'aperitif_cocktail'),
(65, 'Le Habana, 1 l', 2400, 'aperitif_cocktail'),
(66, 'Le Habana, Pitcher', 4200, 'aperitif_cocktail'),
(67, 'L\'Irlandais, 25 cl', 1100, 'aperitif_cocktail'),
(68, 'L\'Irlandais, 33 cl', 1350, 'aperitif_cocktail'),
(69, 'L\'Irlandais, 50 cl', 1900, 'aperitif_cocktail'),
(70, 'L\'Irlandais, 1 l', 2400, 'aperitif_cocktail'),
(71, 'L\'Irlandais, Pitcher', 4200, 'aperitif_cocktail'),
(72, 'Le Boucanier, 25 cl', 1100, 'aperitif_cocktail'),
(73, 'Le Boucanier, 33 cl', 1350, 'aperitif_cocktail'),
(74, 'Le Boucanier, 50 cl', 1900, 'aperitif_cocktail'),
(75, 'Le Boucanier, 1 l', 2400, 'aperitif_cocktail'),
(76, 'Le Boucanier, Pitcher', 4200, 'aperitif_cocktail'),
(77, 'Campari, 2 cl', 1000, 'boisson_aperitif'),
(78, 'Martini, 2 cl', 1000, 'boisson_aperitif'),
(79, 'Ricard, 2 cl', 1000, 'boisson_aperitif'),
(80, 'Coupe de Champagne Taittinger, 12 cl', 2100, 'boisson_aperitif'),
(81, 'Kir Royal Taittinger, 12 cl', 2300, 'boisson_aperitif'),
(82, 'Whisky Classiques : 5 ans d\'âge', 1050, 'boisson_cavewhiskey'),
(83, 'Bourbon : Jim Beam', 1300, 'boisson_cavewhiskey'),
(84, 'Vieux Scotchs : Chivas Regal', 1500, 'boisson_cavewhiskey'),
(85, 'Vieux Scotchs : Johnnie Black Label', 1500, 'boisson_cavewhiskey'),
(86, 'Single Pure Malt : Gleniddich', 1500, 'boisson_cavewhiskey'),
(87, 'Single Pure Malt : Glenlivet', 1500, 'boisson_cavewhiskey'),
(88, 'Gin', 1000, 'boissons_alcool'),
(89, 'Vodka', 1000, 'boissons_alcool'),
(90, 'Tequila', 1000, 'boissons_alcool'),
(91, 'Rhum', 1000, 'boissons_alcool'),
(92, 'Vodkas : Zubrowska', 1300, 'boissons_alcool'),
(93, 'Vodkas : Absolut', 1300, 'boissons_alcool'),
(94, 'Rhum : Damoiseau', 1300, 'boissons_alcool'),
(95, 'Rhum : Bacardi', 1300, 'boissons_alcool'),
(96, 'Gin : Bombay Sapphire', 1300, 'boissons_alcool'),
(97, 'Gin : Gin Gordon\'s', 1300, 'boissons_alcool'),
(98, 'Vodka Red Bull', 1500, 'boissons_alcool'),
(99, 'Pinacolada', 1500, 'boissons_cocktails'),
(100, 'Planteur', 1500, 'boissons_cocktails'),
(101, 'Punch coco', 1500, 'boissons_cocktails'),
(102, 'Jus d\'orange, 25 cl', 850, 'jus'),
(103, 'Jus de citron, 25 cl', 850, 'jus'),
(104, 'Cocktail de fruits', 850, 'jus'),
(105, 'Maxi, 50 cl', 1150, 'jus'),
(106, 'Sancerre Les Montachins Blanc, 37.5cl', 3800, 'cave'),
(107, 'Sancerre Les Montachins Blanc, 75cl', 6200, 'cave'),
(108, 'Riesling Hugel, 37.5cl', 3250, 'cave'),
(109, 'Riesling Hugel, 75cl', 5500, 'cave'),
(110, 'Muscadet sur Lie, 37.5cl ', 2200, 'cave'),
(111, 'Muscadet sur Lie, 75cl ', 3900, 'cave'),
(112, 'Cristal de Provence rosé, 37.5cl', 2300, 'cave'),
(113, 'Cristal de Provence rosé, 75cl', 4200, 'cave'),
(114, 'Côte de Rhône Domaine des Moulins, 37.5cl', 1900, 'cave'),
(115, 'Côte de Rhône Domaine des Moulins, 75cl', 3200, 'cave'),
(116, 'Beaujolais Villages Georges DuBoeuf, 37.5cl', 2200, 'cave'),
(117, 'Beaujolais Villages Georges DuBoeuf, 75cl', 3800, 'cave'),
(118, 'Bordeaux Manoir du Passager (Graves rouge ou blanc), 75 cl', 3900, 'cave'),
(119, 'Clos la Maurasse (Graves rouge ou blanc), 75 cl', 5500, 'cave'),
(120, 'Château Castera Cru Bourgeois - Medoc, 75 cl', 5900, 'cave'),
(121, 'Champagne Taittinger, 75 cl', 12500, 'cave'),
(122, 'Le verre de Bordeaux Manoir du Passager (Graves rouge ou blanc, 33 cl', 950, 'cave'),
(123, 'Le verre de Medoc Château Castera Cru Bourgeois, 75 cl', 1300, 'cave'),
(124, 'Nectar : poire, 25 cl', 700, 'nectars'),
(125, 'Nectar : abricot, 25 cl', 700, 'nectars'),
(126, 'Nectar : tomate, 25 cl', 700, 'nectars'),
(127, 'Coca-Cola, 33 cl', 630, 'soda'),
(128, 'Coca Zero, 33 cl', 630, 'soda'),
(129, 'Orangina, 33 cl', 630, 'soda'),
(130, 'Ice Tea, 33 cl', 630, 'soda'),
(131, '7 Up, 33 cl', 630, 'soda'),
(132, 'Schweppes Tonic, 33 cl', 630, 'soda'),
(133, 'Maxi Soda, 50 cl', 850, 'soda'),
(134, 'Red Bull', 900, 'soda'),
(135, 'Mont Dore, 50 cl', 500, 'eau'),
(136, 'Mont Dore, 1.5 l', 650, 'eau'),
(137, 'San Pellegrino, 50 cl', 650, 'eau'),
(138, 'San Pellegrino, 75 cl', 850, 'eau'),
(139, 'Perrier (boîte), 33 cl', 630, 'eau');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `num_facture` int(11) NOT NULL AUTO_INCREMENT,
  `date_facture` date DEFAULT NULL,
  `paye_ou_non` varchar(4) DEFAULT NULL,
  `num_sej` int(5) NOT NULL,
  PRIMARY KEY (`num_facture`),
  KEY `facture_fk1` (`num_sej`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`num_facture`, `date_facture`, `paye_ou_non`, `num_sej`) VALUES
(1, '2020-06-20', 'oui', 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture_bar`
--

DROP TABLE IF EXISTS `facture_bar`;
CREATE TABLE IF NOT EXISTS `facture_bar` (
  `num_facture_bar` int(11) NOT NULL,
  `date_conso_bar` date DEFAULT NULL,
  `num_sej_bar` int(5) NOT NULL,
  PRIMARY KEY (`num_facture_bar`),
  KEY `facture_bar_fk1` (`num_sej_bar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facture_bar`
--

INSERT INTO `facture_bar` (`num_facture_bar`, `date_conso_bar`, `num_sej_bar`) VALUES
(1, '2020-06-02', 1),
(2, '2020-02-11', 2),
(3, '2020-07-18', 3);

-- --------------------------------------------------------

--
-- Structure de la table `facture_brasserie`
--

DROP TABLE IF EXISTS `facture_brasserie`;
CREATE TABLE IF NOT EXISTS `facture_brasserie` (
  `num_facture_brasserie` int(5) NOT NULL,
  `date_facture_brasserie` date DEFAULT NULL,
  `num_sej_brasserie` int(5) NOT NULL,
  PRIMARY KEY (`num_facture_brasserie`),
  KEY `facture_brasserie_fk1` (`num_sej_brasserie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facture_brasserie`
--

INSERT INTO `facture_brasserie` (`num_facture_brasserie`, `date_facture_brasserie`, `num_sej_brasserie`) VALUES
(1, '2020-06-03', 1),
(2, '2020-07-22', 3);

-- --------------------------------------------------------

--
-- Structure de la table `facture_spa`
--

DROP TABLE IF EXISTS `facture_spa`;
CREATE TABLE IF NOT EXISTS `facture_spa` (
  `num_facture_spa` int(11) NOT NULL,
  `date_facture_spa` date DEFAULT NULL,
  `num_sej_spa` int(5) NOT NULL,
  PRIMARY KEY (`num_facture_spa`),
  KEY `facture_spa_fk1` (`num_sej_spa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture_spa`
--

INSERT INTO `facture_spa` (`num_facture_spa`, `date_facture_spa`, `num_sej_spa`) VALUES
(1, '2020-06-04', 1),
(2, '2020-02-14', 2),
(3, '2020-07-25', 3);

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

DROP TABLE IF EXISTS `sejour`;
CREATE TABLE IF NOT EXISTS `sejour` (
  `num_sejour` int(5) NOT NULL,
  `date_arrivee` date NOT NULL,
  `date_depart` date NOT NULL,
  `nbr_personne` int(11) NOT NULL DEFAULT '0',
  `num_cli` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`num_sejour`),
  KEY `sejour_fk1` (`num_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`num_sejour`, `date_arrivee`, `date_depart`, `nbr_personne`, `num_cli`) VALUES
(1, '2020-05-31', '2020-06-05', 2, 2),
(2, '2020-02-10', '2020-02-15', 1, 1),
(3, '2020-07-12', '2020-07-26', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `spa`
--

DROP TABLE IF EXISTS `spa`;
CREATE TABLE IF NOT EXISTS `spa` (
  `num_soin` int(11) NOT NULL,
  `libelle_soin` varchar(80) DEFAULT NULL,
  `prix_soin` int(11) NOT NULL,
  `cat_spa` varchar(20) NOT NULL,
  PRIMARY KEY (`num_soin`),
  KEY `spa_fk1` (`cat_spa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `spa`
--

INSERT INTO `spa` (`num_soin`, `libelle_soin`, `prix_soin`, `cat_spa`) VALUES
(1, 'SOIN ÉCLAT IMMÉDIAT AUX FLEURS', 9500, 'soin_fleurs'),
(2, 'SOIN CONTOUR DES YEUX ÉCLAT', 6500, 'soin_yeuxeclat'),
(3, 'SOIN PRODIGIEUX À\r\nL’IMMORTELLE BLEUE\r\n', 12500, 'soin_immortelle'),
(4, 'SOIN EXPRESS AUX EXTRAITS\r\nD’ARBRES - Pour Homme', 9500, 'soin_extraitarbreH'),
(5, 'SOIN AROMA-LACTÉ CRÈME FRAÎCHE', 13000, 'soin_alacte_creme'),
(6, 'SOIN AROMA-PERFECTION® AUX PLANTES ', 13000, 'soin_aperfection'),
(7, 'SOIN ULTRA-RÉCONFORTANT AU MIEL', 13000, 'soin_ureconfort_miel'),
(8, 'SOIN BEAU JOUEUR - Pour Homme ', 13000, 'soin_bjoueurH'),
(9, 'SOIN BIO-BEAUTÉ', 13000, 'soin_biobeaute'),
(10, 'SOIN NUXELLENCE', 16000, 'soin_nuxellence'),
(11, 'SOIN NIRVANESQUE', 16000, 'soin_nirvanesque'),
(12, 'SOIN MERVEILLANCE expert', 16000, 'soin_merveilexpert'),
(13, 'ENVELOPPEMENT', 6500, 'enveloppement'),
(14, 'SOIN RÉVÉLATEUR D’ÉCLAT\r\nIMMÉDIAT', 9000, 'soin_revelateureclat'),
(15, 'SOIN «BODY RELAXANT»', 13000, 'soin_bodyrelax'),
(16, 'SOIN du dos', 14000, 'soin_dos'),
(17, 'SOIN PRODIGIEUX', 14000, 'soin_prodigieux'),
(18, 'SOIN RÊVE DE MIEL ', 15000, 'soin_revemiel'),
(19, 'SOIN PURETÉ DU DOS - Pour Homme ', 14000, 'soin_puretedos'),
(20, 'SOIN RÊVERIE ORIENTALE ', 18000, 'soin_reveorient');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `brasserie`
--
ALTER TABLE `brasserie`
  ADD CONSTRAINT `brasserie_fk1` FOREIGN KEY (`cat_brasserie`) REFERENCES `categorie_brasserie` (`id_cat_brasserie`);

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_fk1` FOREIGN KEY (`cat_chambre`) REFERENCES `categorie_chambre` (`id_cat_chambre`);

--
-- Contraintes pour la table `concerne_bar`
--
ALTER TABLE `concerne_bar`
  ADD CONSTRAINT `concerne_bar_fk1` FOREIGN KEY (`num_facture_bar`) REFERENCES `facture_bar` (`num_facture_bar`),
  ADD CONSTRAINT `concerne_bar_fk2` FOREIGN KEY (`id_consommation_bar`) REFERENCES `consommation` (`id_consommation_bar`);

--
-- Contraintes pour la table `concerne_brasserie`
--
ALTER TABLE `concerne_brasserie`
  ADD CONSTRAINT `concerne_brasserie_fk1` FOREIGN KEY (`num_facture_brasserie`) REFERENCES `facture_brasserie` (`num_facture_brasserie`),
  ADD CONSTRAINT `concerne_brasserie_fk2` FOREIGN KEY (`id_plat_brasserie`) REFERENCES `brasserie` (`id_plat_brasserie`);

--
-- Contraintes pour la table `concerne_chambre`
--
ALTER TABLE `concerne_chambre`
  ADD CONSTRAINT `concerne_chambre_fk1` FOREIGN KEY (`num_sej_chambre`) REFERENCES `sejour` (`num_sejour`),
  ADD CONSTRAINT `concerne_chambre_fk2` FOREIGN KEY (`num_chambre`) REFERENCES `chambre` (`num_chambre`);

--
-- Contraintes pour la table `concerne_spa`
--
ALTER TABLE `concerne_spa`
  ADD CONSTRAINT `concerne_spa_fk1` FOREIGN KEY (`num_soin`) REFERENCES `spa` (`num_soin`),
  ADD CONSTRAINT `concerne_spa_fk2` FOREIGN KEY (`num_facture_spa`) REFERENCES `facture_spa` (`num_facture_spa`);

--
-- Contraintes pour la table `consommation`
--
ALTER TABLE `consommation`
  ADD CONSTRAINT `consommation_fk1` FOREIGN KEY (`cat_consommation`) REFERENCES `categorie_bar` (`id_cat_consommation`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_fk1` FOREIGN KEY (`num_sej`) REFERENCES `sejour` (`num_sejour`);

--
-- Contraintes pour la table `facture_bar`
--
ALTER TABLE `facture_bar`
  ADD CONSTRAINT `facture_bar_fk1` FOREIGN KEY (`num_sej_bar`) REFERENCES `sejour` (`num_sejour`);

--
-- Contraintes pour la table `facture_brasserie`
--
ALTER TABLE `facture_brasserie`
  ADD CONSTRAINT `facture_brasserie_fk1` FOREIGN KEY (`num_sej_brasserie`) REFERENCES `sejour` (`num_sejour`);

--
-- Contraintes pour la table `facture_spa`
--
ALTER TABLE `facture_spa`
  ADD CONSTRAINT `facture_spa_fk1` FOREIGN KEY (`num_sej_spa`) REFERENCES `sejour` (`num_sejour`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_fk1` FOREIGN KEY (`num_cli`) REFERENCES `client` (`num_client`);

--
-- Contraintes pour la table `spa`
--
ALTER TABLE `spa`
  ADD CONSTRAINT `spa_fk1` FOREIGN KEY (`cat_spa`) REFERENCES `categorie_spa` (`id_catspa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
