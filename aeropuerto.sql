-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 11:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Table structure for table `aeropuertos`
--

CREATE TABLE `aeropuertos` (
  `Id_Aeropuerto` int(11) NOT NULL,
  `Nombre_Aeropuerto` varchar(255) NOT NULL,
  `Ciudad_Aeropuerto` varchar(255) NOT NULL,
  `Pais_Aeropuerto` varchar(255) NOT NULL,
  `Tel_Aeropuerto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aviones`
--

CREATE TABLE `aviones` (
  `Id_Avion` int(11) NOT NULL,
  `Modelo_Avion` varchar(255) NOT NULL,
  `Aerolinea_Avion` varchar(255) NOT NULL,
  `Capacidad_Avion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compañia`
--

CREATE TABLE `compañia` (
  `Id_Compañia` int(11) NOT NULL,
  `Nombre_Compañia` varchar(255) NOT NULL,
  `Sede_Copañia` varchar(255) NOT NULL,
  `Tel_Compañia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasajeros`
--

CREATE TABLE `pasajeros` (
  `Id_Pasajero` int(11) NOT NULL,
  `Nombre_Pasajero` varchar(255) NOT NULL,
  `Apellido_Pasajero` varchar(255) NOT NULL,
  `Edad_Pasajero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vuelo`
--

CREATE TABLE `vuelo` (
  `Id_Vuelo` int(11) NOT NULL,
  `Id_Avion` int(11) NOT NULL,
  `Id_Compañia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vuelos_llegada`
--

CREATE TABLE `vuelos_llegada` (
  `Id_Vuelo_Llegada` int(11) NOT NULL,
  `Id_Vuelo` int(11) NOT NULL,
  `Id_Aeropuerto_Origen` int(11) NOT NULL,
  `Puerta_Salida_Vuelo_Llegada` int(11) NOT NULL,
  `HoraAprox_Vuelo_Llegada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vuelos_salida`
--

CREATE TABLE `vuelos_salida` (
  `Id_Vuelo_Salida` int(11) NOT NULL,
  `Id_Vuelo` int(11) NOT NULL,
  `Id_Aeropuerto_Destino` int(11) NOT NULL,
  `Puerta_Embarque_Vuelo_Salida` int(11) NOT NULL,
  `Hora_Vuelo_Salida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vuelo_tomado_persona`
--

CREATE TABLE `vuelo_tomado_persona` (
  `Id_Pasajero` int(11) NOT NULL,
  `Id_Vuelo` int(11) NOT NULL,
  `NumAsiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  ADD PRIMARY KEY (`Id_Aeropuerto`),
  ADD UNIQUE KEY `Id_Aeropuerto` (`Id_Aeropuerto`);

--
-- Indexes for table `aviones`
--
ALTER TABLE `aviones`
  ADD PRIMARY KEY (`Id_Avion`),
  ADD UNIQUE KEY `Id_Avion` (`Id_Avion`);

--
-- Indexes for table `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`Id_Compañia`),
  ADD UNIQUE KEY `Id_Compañia` (`Id_Compañia`);

--
-- Indexes for table `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`Id_Pasajero`),
  ADD UNIQUE KEY `Id_Pasajero` (`Id_Pasajero`);

--
-- Indexes for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`Id_Vuelo`),
  ADD UNIQUE KEY `Id_Vuelo` (`Id_Vuelo`),
  ADD KEY `Vuelo_fk1` (`Id_Avion`),
  ADD KEY `Vuelo_fk2` (`Id_Compañia`);

--
-- Indexes for table `vuelos_llegada`
--
ALTER TABLE `vuelos_llegada`
  ADD PRIMARY KEY (`Id_Vuelo_Llegada`),
  ADD UNIQUE KEY `Id_Vuelo_Llegada` (`Id_Vuelo_Llegada`),
  ADD KEY `Vuelos_Llegada_fk1` (`Id_Vuelo`),
  ADD KEY `Vuelos_Llegada_fk2` (`Id_Aeropuerto_Origen`);

--
-- Indexes for table `vuelos_salida`
--
ALTER TABLE `vuelos_salida`
  ADD PRIMARY KEY (`Id_Vuelo_Salida`),
  ADD UNIQUE KEY `Id_Vuelo_Salida` (`Id_Vuelo_Salida`),
  ADD KEY `Vuelos_Salida_fk1` (`Id_Vuelo`),
  ADD KEY `Vuelos_Salida_fk2` (`Id_Aeropuerto_Destino`);

--
-- Indexes for table `vuelo_tomado_persona`
--
ALTER TABLE `vuelo_tomado_persona`
  ADD PRIMARY KEY (`Id_Pasajero`),
  ADD UNIQUE KEY `Id_Pasajero` (`Id_Pasajero`),
  ADD KEY `Vuelo_Tomado_Persona_fk1` (`Id_Vuelo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aeropuertos`
--
ALTER TABLE `aeropuertos`
  MODIFY `Id_Aeropuerto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aviones`
--
ALTER TABLE `aviones`
  MODIFY `Id_Avion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compañia`
--
ALTER TABLE `compañia`
  MODIFY `Id_Compañia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `Id_Pasajero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `Id_Vuelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vuelos_llegada`
--
ALTER TABLE `vuelos_llegada`
  MODIFY `Id_Vuelo_Llegada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vuelos_salida`
--
ALTER TABLE `vuelos_salida`
  MODIFY `Id_Vuelo_Salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vuelo_tomado_persona`
--
ALTER TABLE `vuelo_tomado_persona`
  MODIFY `Id_Pasajero` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `Vuelo_fk1` FOREIGN KEY (`Id_Avion`) REFERENCES `aviones` (`Id_Avion`),
  ADD CONSTRAINT `Vuelo_fk2` FOREIGN KEY (`Id_Compañia`) REFERENCES `compañia` (`Id_Compañia`);

--
-- Constraints for table `vuelos_llegada`
--
ALTER TABLE `vuelos_llegada`
  ADD CONSTRAINT `Vuelos_Llegada_fk1` FOREIGN KEY (`Id_Vuelo`) REFERENCES `vuelo` (`Id_Vuelo`),
  ADD CONSTRAINT `Vuelos_Llegada_fk2` FOREIGN KEY (`Id_Aeropuerto_Origen`) REFERENCES `aeropuertos` (`Id_Aeropuerto`);

--
-- Constraints for table `vuelos_salida`
--
ALTER TABLE `vuelos_salida`
  ADD CONSTRAINT `Vuelos_Salida_fk1` FOREIGN KEY (`Id_Vuelo`) REFERENCES `vuelo` (`Id_Vuelo`),
  ADD CONSTRAINT `Vuelos_Salida_fk2` FOREIGN KEY (`Id_Aeropuerto_Destino`) REFERENCES `aeropuertos` (`Id_Aeropuerto`);

--
-- Constraints for table `vuelo_tomado_persona`
--
ALTER TABLE `vuelo_tomado_persona`
  ADD CONSTRAINT `Vuelo_Tomado_Persona_fk0` FOREIGN KEY (`Id_Pasajero`) REFERENCES `pasajeros` (`Id_Pasajero`),
  ADD CONSTRAINT `Vuelo_Tomado_Persona_fk1` FOREIGN KEY (`Id_Vuelo`) REFERENCES `vuelo` (`Id_Vuelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
