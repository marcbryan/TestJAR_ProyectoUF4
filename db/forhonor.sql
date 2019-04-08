-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2019 a las 13:44:01
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
-- Base de datos: `forhonor`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_personaje` (IN `nombre` TEXT, IN `ataque` INT, IN `defensa` INT, IN `faccion_id` INT)  NO SQL
INSERT INTO personaje VALUES (null, nombre, ataque, defensa, faccion_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar_faccion` (IN `nombre_facc` VARCHAR(100))  NO SQL
SELECT p.personaje_id, p.nombre_personaje, p.ataque, p.defensa, f.nombre_faccion  FROM personaje p, faccion f WHERE p.faccion_id = f.faccion_id and f.nombre_faccion LIKE nombre_facc$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faccion`
--

CREATE TABLE `faccion` (
  `faccion_id` int(11) NOT NULL,
  `nombre_faccion` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `lore` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `faccion`
--

INSERT INTO `faccion` (`faccion_id`, `nombre_faccion`, `lore`) VALUES
(1, 'Caballeros', 'Los caballeros de Ashfeld son paradigmas del poder.'),
(2, 'Vikingos', 'Los vikingos desaparecieron hace siglos, tras escapar de sus moribundas tierras natales'),
(3, 'Samurái', 'La historia no ha sido amable con los samuráis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `personaje_id` int(11) NOT NULL,
  `nombre_personaje` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `ataque` int(11) NOT NULL,
  `defensa` int(11) NOT NULL,
  `faccion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personaje`
--

INSERT INTO `personaje` (`personaje_id`, `nombre_personaje`, `ataque`, `defensa`, `faccion_id`) VALUES
(1, 'DarkKnight', 50, 45, 1),
(2, 'Vikingg', 40, 60, 2),
(3, 'Woo', 70, 20, 3),
(4, 'kniight', 55, 40, 1),
(5, 'wastedd', 45, 45, 1),
(6, 'cmdPj', 70, 30, 3),
(7, 'Sam', 60, 20, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `faccion`
--
ALTER TABLE `faccion`
  ADD PRIMARY KEY (`faccion_id`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`personaje_id`),
  ADD KEY `faccion_id` (`faccion_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `personaje_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
