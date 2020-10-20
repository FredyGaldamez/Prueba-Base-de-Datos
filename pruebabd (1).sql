-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2020 a las 01:28:55
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebabd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'ropa', 'prendas de vestir'),
(2, 'deportiva', 'accesorios  y prendas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `RUT` varchar(15) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `DIRECCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID`, `RUT`, `NOMBRE`, `DIRECCION`) VALUES
(1, '12423242-2', 'francisco gomez', 'los diamantes 54'),
(2, '15434354-9', 'jose diaz', 'nueva san martin 22'),
(3, '23676578-6', 'maria salgado', 'av carmen 33'),
(4, '34975875-7', 'claudia bahamondez', 'la fortuna 99'),
(5, '65242524-4', 'manuel perez', 'olimpo 45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `ID` int(11) NOT NULL,
  `PRECIO` double NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `VALOR_TOTAL` double NOT NULL,
  `ID_FACTURA` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`ID`, `PRECIO`, `CANTIDAD`, `VALOR_TOTAL`, `ID_FACTURA`, `ID_PRODUCTO`) VALUES
(10, 15600, 2, 31200, 2521, 10),
(11, 22400, 3, 67200, 2521, 11),
(12, 79000, 5, 39500, 2521, 17),
(20, 18000, 1, 18000, 2522, 14),
(21, 25000, 2, 50000, 2522, 15),
(22, 37800, 2, 75600, 2522, 16),
(30, 15600, 2, 31200, 2523, 10),
(31, 22400, 1, 22400, 2523, 11),
(32, 14900, 2, 29800, 2523, 12),
(40, 32700, 1, 32700, 2524, 13),
(41, 18000, 3, 54000, 2524, 14),
(50, 25000, 2, 50000, 2525, 15),
(51, 22400, 3, 67200, 2525, 11),
(52, 7900, 2, 15800, 2525, 17),
(60, 7900, 1, 7900, 2526, 17),
(70, 15600, 1, 15600, 2527, 10),
(71, 22400, 2, 44800, 2527, 10),
(80, 14900, 2, 29800, 2528, 12),
(81, 32700, 1, 32700, 2528, 13),
(83, 18000, 3, 54000, 2528, 14),
(90, 25000, 2, 50000, 2529, 15),
(91, 37800, 1, 37800, 2529, 16),
(92, 7900, 1, 7900, 2529, 17),
(93, 15600, 1, 15600, 2529, 10),
(100, 22400, 2, 44800, 2530, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `SUB_TOTAL` double NOT NULL,
  `IVA` double NOT NULL,
  `TOTAL` double NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`ID`, `FECHA`, `SUB_TOTAL`, `IVA`, `TOTAL`, `ID_CLIENTE`) VALUES
(2521, '2020-06-01', 137900, 26201, 164101, 1),
(2522, '2020-06-02', 143600, 27284, 170884, 1),
(2523, '2020-06-03', 83400, 15846, 992464, 2),
(2524, '2020-06-04', 86700, 16473, 103173, 2),
(2525, '2020-06-05', 133000, 25270, 158270, 2),
(2526, '2020-06-06', 7900, 1501, 9401, 3),
(2527, '2020-06-07', 60400, 11476, 71876, 4),
(2528, '2020-06-08', 116500, 22135, 138635, 4),
(2529, '2020-06-09', 111300, 21147, 132447, 4),
(2530, '2020-06-10', 44800, 8512, 53312, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(35) NOT NULL,
  `DESCRIPCION` varchar(35) NOT NULL,
  `VALOR_UNITARIO` double DEFAULT NULL,
  `ID_CATEGORIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `NOMBRE`, `DESCRIPCION`, `VALOR_UNITARIO`, `ID_CATEGORIA`) VALUES
(10, 'pantalon', 'ropa', 15600, 1),
(11, 'camisa', 'ropa', 22400, 1),
(12, 'polera', 'ropa', 14900, 1),
(13, 'jeans', 'ropa', 32700, 1),
(14, 'raqueta', 'deportiva', 1800, 2),
(15, 'pelota', 'deportiva', 25000, 2),
(16, 'bate', 'deportiva', 37800, 2),
(17, 'jeans', 'deportiva', 7900, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  ADD KEY `ID_FACTURA` (`ID_FACTURA`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CATEGORIA` (`ID_CATEGORIA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
