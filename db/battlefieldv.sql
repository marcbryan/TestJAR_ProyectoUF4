-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2019 a las 13:44:11
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `battlefieldv`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_players_id_more3` ()  NO SQL
DELETE FROM bfplayer WHERE class_id > 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar_clase` (IN `clase` VARCHAR(100))  NO SQL
SELECT p.user_id, c.class_name, d.name, w.name, p.kills, p.Deads FROM bfplayer p, class c, device d, weapon w WHERE p.class_id = c.class_id AND p.device1 = d.device_id AND p.primary_weapon = w.weapon_id AND c.class_name = clase$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bfplayer`
--

CREATE TABLE `bfplayer` (
  `user_id` varchar(15) NOT NULL,
  `class_id` int(11) NOT NULL,
  `primary_weapon` int(11) NOT NULL,
  `device1` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `Deads` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bfplayer`
--

INSERT INTO `bfplayer` (`user_id`, `class_id`, `primary_weapon`, `device1`, `kills`, `Deads`) VALUES
('elRubius', 3, 9, 6, 500, 1000),
('ImNoob', 0, 1, 2, 50, 88),
('newplayer', 2, 10, 4, 30, 10),
('NoOnePlay', 2, 6, 4, 300, 299),
('rikimaru', 1, 4, 0, 120, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `class`
--

INSERT INTO `class` (`class_id`, `class_name`) VALUES
(0, 'Assault'),
(1, 'Medic'),
(2, 'Support'),
(3, 'Recon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device`
--

CREATE TABLE `device` (
  `device_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `device`
--

INSERT INTO `device` (`device_id`, `name`) VALUES
(0, 'Medical Bag'),
(1, 'Medkit'),
(2, 'Panzerfaust'),
(3, 'PIAT'),
(4, 'Ammo Pouch'),
(5, 'Ammo Crate'),
(6, 'Spotting Scope'),
(7, 'Flare Gun');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weapon`
--

CREATE TABLE `weapon` (
  `weapon_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` varchar(30) NOT NULL,
  `damage` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `weapon`
--

INSERT INTO `weapon` (`weapon_id`, `name`, `type`, `damage`, `accuracy`) VALUES
(0, 'Sturmgewehr 1-5', 'Assault Rifle', 25, 50),
(1, 'Ribeyrolles 1918', 'Assault Rifle', 25, 75),
(2, 'M1A1 Carabine', 'Semi-Auto Rifles', 35, 80),
(3, 'Gewehr 43', 'Semi-Auto Rifles', 40, 75),
(4, 'MP40', 'Submachine Gun', 20, 80),
(5, 'Sten', 'Submachine Gun', 20, 77),
(6, 'M30 Drilling', 'Shotgun', 95, 10),
(7, 'VGO', 'Medium Machine Gun', 30, 50),
(8, 'ZH-29', 'Self-Loading Rifle', 70, 85),
(9, 'Lee-Enfield No.4', 'Bolt-Action Rifle', 70, 90),
(10, 'KE7', 'Light Machine Gun', 23, 65);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bfplayer`
--
ALTER TABLE `bfplayer`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
