-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le :  lun. 15 jan. 2018 à 17:27
-- Version du serveur :  10.2.8-MariaDB
-- Version de PHP :  7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sitecv`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `article` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user`, `article`, `content`, `date`) VALUES
(6, 2, 37, 'ceci est un commentaire', '2018-01-13'),
(7, 5, 38, 'ceci est un commentaire test', '2018-01-13'),
(10, 2, 38, 'Ceci est un commentaire test', '2018-01-13'),
(11, 2, 40, 'J\'avoue les bitcoin c\'est la vie', '2018-01-14'),
(13, 5, 40, 'Moi j\'y comprend pas grand choses au bitcoin...', '2018-01-14'),
(15, 2, 42, 'C\'est vrai que le bit coin c\'est la vie bordel', '2018-01-14'),
(16, 5, 42, 'Moi personnellement j\'y comprend pas encore grand chose au bitcoin...', '2018-01-14'),
(17, 5, 48, 'On verra ce que ça donne, et si t\'a la fois de le maintenir a jour surtout', '2018-01-14');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(2, 'Root', 'root', 'jesuisadmin@root.fr', 'jesuisadmin@root.fr', 1, NULL, '$2y$13$yOS8zhK8Znbrqjlr/hBlMOiES6DzbR00KPpWOvhBCQdUAhBmWBW/.', '2018-01-14 23:24:24', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}'),
(3, 'test', 'test', 'test@test.fr', 'test@test.fr', 1, NULL, '$2y$13$Rh4u8Qe3y9/YyVEE105LfucQj3ZJhpvy821x9fGCiY3lO2gIUjnFG', '2018-01-06 23:09:44', NULL, NULL, 'a:0:{}'),
(4, 'pichel', 'pichel', 'pichel@pichel.fr', 'pichel@pichel.fr', 1, NULL, '$2y$13$PpaulhiT9uVDUvdU.XRPZOG3w0LYQMZ8FxMOZ75WKqfNLGA1y.Vma', '2018-01-09 14:15:04', NULL, NULL, 'a:0:{}'),
(5, 'em', 'em', 'em@em.fr', 'em@em.fr', 1, NULL, '$2y$13$4wFITdPQnifYyLJ1DyGqQunW3c16eePujRo7FIAPqyznuRR7Kvnay', '2018-01-15 13:13:36', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `collection`, `title`, `user`, `code`, `description`) VALUES
(42, 'cryptomonnaie', 'Le bon bitcoin', NULL, '1', 'La monnaie virtuelle a fait ses premiers pas au Chicago board options exchange (Cboe) dimanche soir. Le contrat à terme est monté jusqu’à 18.850 dollars.\r\nLe bitcoin franchit une nouvelle étape. La monnaie virtuelle a fait dimanche un démarrage en fanfare sur le Chicago board options exchange (Cboe), une des deux plateformes boursières américaines de contrats à terme. Les échanges, qui se déroulent sur une large plage horaire, ont débuté à 17 heures à Chicago (minuit heure française). L’un des premiers produits financiers permettant de parier sur l’évolution et l’avenir du bitcoin était proposé sous le symbole boursier «XBT» au prix de 15.000 dollars. S’en est suivie une forte volatilité et un fort trafic ayant rendu inaccessible le site internet du Cboe dans les vingt premières minutes. Puis, vers 04h10 (11h10 en France), le bitcoin s’envolait à 17.600 dollars l’unité pour le contrat à terme devant expirer le 17 janvier. Il est même monté lundi matin jusqu’à 18.850 dollars. Environ 2725 contrats avaient changé de mains à 04h10, selon le Cboe, qui a indiqué que «les échanges se sont déroulés comme prévu». À la clôture des échanges, ce lundi à 15h15 (22h15 heure française), le bitcoin valait 17.110,41 dollars.\r\n\r\nLa valeur du contrat à terme dépassait celle du bitcoin au jour le jour, établie par l’agence Bloomberg, qui compile des données en provenance de plusieurs plateformes alternatives sur internet non régulées. Selon Bloomberg, cette valeur immédiate du bitcoin - distincte du contrat à terme - s’échangeait à 16.728,71 dollars vers 11h10, heure française, à quelques centaines de dollars du record établi le 8 décembre (17.027,39 dollars).\r\n\r\n» LIRE AUSSI - Les sept notions de base nécessaires pour comprendre le bitcoin\r\n\r\nLes instruments financiers proposés par la Bourse de Chicago sont la première opportunité officielle pour les investisseurs professionnels d’investir dans le bitcoin, lancé en 2009. Jusqu’ici, les investisseurs se méfiaient de cette monnaie en raison de son absence de régulation et de son manque de transparence. Désormais, le Cboe donne au bitcoin «de la légitimité car il reconnaît que le bitcoin est un actif comme un autre qu’on peut échanger», explique Nick Colas, expert chez Data Trek Research.\r\n\r\nLa reconnaissance par Wall Street est une première étape dans l’ambition affichée du bitcoin de devenir un actif aussi populaire que l’or auprès du grand public. Ses défenseurs envisagent de passer à la vitesse supérieure en demandant à la SEC, le gendarme de la Bourse américain, d’autoriser la création d’un ETF en bitcoin, une sorte de placement financier ou d’épargne financière dans lequel tout le monde pourra placer ses économies. La valeur de ce type d’épargne financière dépendra de la performance du bitcoin. La SEC s’est refusée jusqu’ici à accéder à une telle demande, expliquant qu’il y a un manque de transparence dans la fixation du prix du bitcoin et que ce dernier peut être facilement manipulé.\r\n\r\nMais les premiers échanges sur un marché financier ayant pignon sur rue devraient apaiser les craintes de bulle et apporter à terme une certaine stabilité à la monnaie virtuelle, selon les traders professionnels. Le Cboe indique d’ailleurs avoir mis des garde-fous pour éviter des fluctuations folles: il suspendra par exemple les échanges pendant deux minutes si les prix des produits augmentent ou chutent soudain de 10%. L’arrêt sera de cinq minutes si les mouvements à la hausse ou à la baisse atteignent 20%.\r\n\r\nLe scepticisme des banques\r\n\r\nMalgré ces assurances, nombreux sont les experts qui mettent en garde sur une possible manipulation des échanges. «Nous demeurons inquiets sur l’absence de transparence et de régulation» du bitcoin et «nous nous demandons si les échanges vont être contrôlés de façon appropriée afin de s’assurer que le (bitcoin) n’est pas objet de manipulation et de fraude», écrit la FIA, association regroupant les grandes banques faisant l’interface entre investisseurs sur le marché des contrats à terme. Cette prise de position est importante. En effet, le marché des contrats à terme n’est accessible que via de grandes banques et maisons de courtage agréées, qui s’engagent à régler en dollars aux investisseurs l’argent qui leur est dû. Elles s’exposent à des risques importants si leurs clients ne peuvent payer.\r\n\r\n» LIRE AUSSI - Des hackers dérobent 64 millions de dollars en bitcoins\r\n\r\nCe dimanche, JPMorgan, Bank of America Merrill Lynch, Citigroup et Barclays ont donc refusé de jouer les intermédiaires pour leurs clients voulant investir dans les produits bitcoin. Seules Goldman Sachs et ABN Amro ont accepté de jouer les interfaces pour un nombre de clients triés sur le volet afin de minimiser les risques attachés à la volatilité du bitcoin. Pour éviter de mauvaises surprises, il était d’ailleurs demandé aux participants dimanche de disposer d’au moins 44% de la somme misée en dollars, selon le Cboe. D’ordinaire, les traders doivent disposer de 10% des sommes misées.\r\n\r\nMalgré ce scepticisme des banques, le bitcoin va poursuivre sa quête de légitimité avec le CME (Chicago Mercantile Exchange), autre opérateur boursier mondial, qui compte lancer des échanges de produits en bitcoins le 18 décembre. Il devrait être suivi en 2018 par le Nasdaq, la plateforme des géants de la Silicon Valley tels Google et Facebook.\r\n\r\nCrédits Le figaro'),
(48, 'site', 'Développement du site', NULL, '2', 'Le développement du site m\'aura pris quelques temps, en effet après avoir mis un moment a comprendre le framework il aura fallu s\'atteler a la tâche ardus de choisir si oui ou non j\'allais utilisé ce que l\'on appelle des bundles. Après documentation sur le net je me suis rendu compte que la plupart des bundle était obsolète ou non mis a jour.\r\nJ\'ai donc décider d\'en utiliser le moins possible. \r\n\r\nUne fois cette recherche réaliser, le seul est unique bundle sélectionner fût FOSUserBundle, un bundle permettant de gérer l\'aspect utilisateur du site. Simple d\'utilisation et compatible avec symfony 3 mal grès le fait qu\'il ne soit pas mis a jour, le bundle fût simple a installer aussi bien qu\'a mettre en place et utiliser.\r\n\r\nLa partie la plus complexe pris ensuite vie dans le projet, la gestion des articles, des commentaires et du CV, a cela c\'est ajouter la mise en page du site qui aussi fastidieuse soit-elle n\'est pas encore a son rendu final. J’espère que le site vous plairas, je tenterais de le faire évoluer tout au long de mes études.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
