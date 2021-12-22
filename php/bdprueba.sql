-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 04:13:56
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database bd23;
drop database bd23;
use bd23;
use temp    ;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd23`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

CREATE TABLE `cuestionario` (
  `idformulario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `img` varchar(45) NOT NULL,
  `text` varchar(200) NOT NULL,
  `alternativas` varchar(45) NOT NULL,
  `respusta_correct` varchar(45) NOT NULL,
  `tema` varchar(45) NOT NULL,
  `temporizador` time NOT NULL,
  `reforsamiento_idreforsamiento` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `resultados_idresultados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseñanza`
--

CREATE TABLE `enseñanza` (
  `idEnseñanza` int(11) NOT NULL,
  `tema` varchar(45) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `texto` varchar(45) NOT NULL,
  `instrucciones` varchar(45) NOT NULL,
  `categoria_idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseñanza_has_cuestionario`
--

CREATE TABLE `enseñanza_has_cuestionario` (
  `enseñanza_idEnseñanza` int(11) NOT NULL,
  `cuestionario_idformulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reforsamiento`
--

CREATE TABLE `reforsamiento` (
  `idreforsamiento` int(11) NOT NULL,
  `respuesta_corret` varchar(45) NOT NULL,
  `respuesta_incorrt` varchar(45) NOT NULL,
  `explicacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `idresultados` int(11) NOT NULL,
  `result_correct` varchar(45) NOT NULL,
  `resultado_incorrect` varchar(45) NOT NULL,
  `puntuacion_respusta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD PRIMARY KEY (`idformulario`),
  ADD KEY `fk_cuestionario_reforsamiento1_idx` (`reforsamiento_idreforsamiento`),
  ADD KEY `fk_cuestionario_users1_idx` (`users_id`),
  ADD KEY `fk_cuestionario_resultados1_idx` (`resultados_idresultados`);

--
-- Indices de la tabla `enseñanza`
--
ALTER TABLE `enseñanza`
  ADD PRIMARY KEY (`idEnseñanza`);

--
-- Indices de la tabla `enseñanza_has_cuestionario`
--
ALTER TABLE `enseñanza_has_cuestionario`
  ADD PRIMARY KEY (`enseñanza_idEnseñanza`,`cuestionario_idformulario`),
  ADD KEY `fk_enseñanza_has_cuestionario_cuestionario1_idx` (`cuestionario_idformulario`),
  ADD KEY `fk_enseñanza_has_cuestionario_enseñanza1_idx` (`enseñanza_idEnseñanza`);

--
-- Indices de la tabla `reforsamiento`
--
ALTER TABLE `reforsamiento`
  ADD PRIMARY KEY (`idreforsamiento`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`idresultados`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

ALTER TABLE `users` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

--
-- Filtros para la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD CONSTRAINT `fk_cuestionario_reforsamiento1` FOREIGN KEY (`reforsamiento_idreforsamiento`) REFERENCES `reforsamiento` (`idreforsamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuestionario_resultados1` FOREIGN KEY (`resultados_idresultados`) REFERENCES `resultados` (`idresultados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cuestionario_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enseñanza_has_cuestionario`
--
ALTER TABLE `enseñanza_has_cuestionario`
  ADD CONSTRAINT `fk_enseñanza_has_cuestionario_cuestionario1` FOREIGN KEY (`cuestionario_idformulario`) REFERENCES `cuestionario` (`idformulario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enseñanza_has_cuestionario_enseñanza1` FOREIGN KEY (`enseñanza_idEnseñanza`) REFERENCES `enseñanza` (`idEnseñanza`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;