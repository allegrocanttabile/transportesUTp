-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2021 a las 02:37:50
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_transporte`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_agencia`
--

CREATE TABLE `tb_agencia` (
  `idAgencia` int(11) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `nroRuc` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` int(9) NOT NULL,
  `fechaIngreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `idCliente` int(6) NOT NULL,
  `ruc_dni` varchar(12) NOT NULL,
  `razonSocial` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleado`
--

CREATE TABLE `tb_empleado` (
  `idEmpleado` int(11) NOT NULL,
  `id_TipoEmpleado` int(11) NOT NULL,
  `id_Agencia` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `docIdentidad` int(10) NOT NULL,
  `nacionalidad` varchar(20) NOT NULL,
  `nroContacto` int(9) DEFAULT NULL,
  `nroLicencia` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_login`
--

CREATE TABLE `tb_login` (
  `idLogin` int(6) NOT NULL,
  `dni` int(10) NOT NULL,
  `nomUsuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `habil` int(1) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_marca`
--

CREATE TABLE `tb_marca` (
  `idMarca` int(6) NOT NULL,
  `nomMarca` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_modelo`
--

CREATE TABLE `tb_modelo` (
  `idModelo` int(6) NOT NULL,
  `idMarca` int(6) NOT NULL,
  `nomModelo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `idProveedor` int(6) NOT NULL,
  `ruc` varchar(12) NOT NULL,
  `razonSocial` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipoempleado`
--

CREATE TABLE `tb_tipoempleado` (
  `idTipoEmpleado` int(11) NOT NULL,
  `cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipovehiculo`
--

CREATE TABLE `tb_tipovehiculo` (
  `idTipoVehiculo` int(6) NOT NULL,
  `nomTipoVehiculo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_vehiculo`
--

CREATE TABLE `tb_vehiculo` (
  `idVehiculo` int(6) NOT NULL,
  `numPlaca` varchar(12) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `idTipo` int(6) NOT NULL,
  `idMarca` int(6) NOT NULL,
  `kilometraje` double NOT NULL,
  `anioFabrica` int(6) NOT NULL,
  `cargaMaxima` double NOT NULL,
  `combustibleGalon` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_agencia`
--
ALTER TABLE `tb_agencia`
  ADD PRIMARY KEY (`idAgencia`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `id_TipoEmpleado` (`id_TipoEmpleado`),
  ADD UNIQUE KEY `docIdentidad` (`docIdentidad`);

--
-- Indices de la tabla `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`idLogin`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `dni_2` (`dni`);

--
-- Indices de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `tb_modelo`
--
ALTER TABLE `tb_modelo`
  ADD PRIMARY KEY (`idModelo`),
  ADD UNIQUE KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `tb_tipoempleado`
--
ALTER TABLE `tb_tipoempleado`
  ADD PRIMARY KEY (`idTipoEmpleado`);

--
-- Indices de la tabla `tb_tipovehiculo`
--
ALTER TABLE `tb_tipovehiculo`
  ADD PRIMARY KEY (`idTipoVehiculo`),
  ADD UNIQUE KEY `idTipoVehiculo` (`idTipoVehiculo`);

--
-- Indices de la tabla `tb_vehiculo`
--
ALTER TABLE `tb_vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD UNIQUE KEY `idTipo` (`idTipo`),
  ADD UNIQUE KEY `idMarca` (`idMarca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_agencia`
--
ALTER TABLE `tb_agencia`
  MODIFY `idAgencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `idCliente` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `idLogin` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  MODIFY `idMarca` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_modelo`
--
ALTER TABLE `tb_modelo`
  MODIFY `idModelo` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `idProveedor` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_tipoempleado`
--
ALTER TABLE `tb_tipoempleado`
  MODIFY `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_tipovehiculo`
--
ALTER TABLE `tb_tipovehiculo`
  MODIFY `idTipoVehiculo` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_vehiculo`
--
ALTER TABLE `tb_vehiculo`
  MODIFY `idVehiculo` int(6) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  ADD CONSTRAINT `tb_empleado_ibfk_1` FOREIGN KEY (`id_TipoEmpleado`) REFERENCES `tb_tipoempleado` (`idTipoEmpleado`);

--
-- Filtros para la tabla `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `tb_empleado` (`docIdentidad`);

--
-- Filtros para la tabla `tb_modelo`
--
ALTER TABLE `tb_modelo`
  ADD CONSTRAINT `tb_modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `tb_marca` (`idMarca`);

--
-- Filtros para la tabla `tb_vehiculo`
--
ALTER TABLE `tb_vehiculo`
  ADD CONSTRAINT `tb_vehiculo_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tb_tipovehiculo` (`idTipoVehiculo`),
  ADD CONSTRAINT `tb_vehiculo_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `tb_marca` (`idMarca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
