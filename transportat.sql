SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE transportat;
USE transportat;
CREATE TABLE `conductor` (
  `idconductor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidopat` varchar(45) DEFAULT NULL,
  `apellidomat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conductor`
--

INSERT INTO `conductor` (`idconductor`, `nombre`, `apellidopat`, `apellidomat`) VALUES
(1, 'Juan Jóse', 'Peréz', 'Lopéz'),
(2, 'Ricardo', 'Noriega', 'Rodriguez');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_queja`
--

CREATE TABLE `detalle_queja` (
  `iddetalle_queja` int(11) NOT NULL,
  `detalle_quejacol` varchar(45) NOT NULL,
  `queja_idqueja` int(11) NOT NULL,
  `queja_viaje_idviaje` int(11) NOT NULL,
  `conductor_idconductor` int(11) DEFAULT NULL,
  `unidad_idunidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_queja`
--

INSERT INTO `detalle_queja` (`iddetalle_queja`, `detalle_quejacol`, `queja_idqueja`, `queja_viaje_idviaje`, `conductor_idconductor`, `unidad_idunidad`) VALUES
(1, 'No se detiene en x parada', 3, 1, 1, 3),
(2, 'Al camión le falta un asiento', 4, 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pasajero`
--

CREATE TABLE `pasajero` (
  `idpasajero` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `saldo` decimal(5,2) NOT NULL,
  `pasajero_tipo_idpasajero_tipo` int(11) NOT NULL,
  `tarjeta_idtarjeta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pasajero`
--

INSERT INTO `pasajero` (`idpasajero`, `usuario`, `contraseña`, `saldo`, `pasajero_tipo_idpasajero_tipo`, `tarjeta_idtarjeta`) VALUES
(1, 'marijo@correo.com', 'majo', '20.00', 1, 1596487),
(2, 'jose@correo.com', 'jo', '15.50', 2, 5694258);

-- --------------------------------------------------------

--
-- Table structure for table `pasajero_tipo`
--

CREATE TABLE `pasajero_tipo` (
  `idpasajero_tipo` int(11) NOT NULL,
  `costo_pasaje` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pasajero_tipo`
--

INSERT INTO `pasajero_tipo` (`idpasajero_tipo`, `costo_pasaje`) VALUES
(1, '8.00'),
(2, '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `queja`
--

CREATE TABLE `queja` (
  `idqueja` int(11) NOT NULL,
  `viaje_idviaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `queja`
--

INSERT INTO `queja` (`idqueja`, `viaje_idviaje`) VALUES
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sugerencia`
--

CREATE TABLE `sugerencia` (
  `idsugerencia` int(11) NOT NULL,
  `sugerencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sugerencia`
--

INSERT INTO `sugerencia` (`idsugerencia`, `sugerencia`) VALUES
(1, 'una ruta de colinas al poli'),
(2, 'mas rutas en horas pico');

-- --------------------------------------------------------

--
-- Table structure for table `tarjeta`
--

CREATE TABLE `tarjeta` (
  `idtarjeta` int(11) NOT NULL,
  `saldo` decimal(5,2) NOT NULL,
  `activa` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tarjeta`
--

INSERT INTO `tarjeta` (`idtarjeta`, `saldo`, `activa`) VALUES
(1596487, '20.00', 1),
(5694258, '8.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unidad`
--

CREATE TABLE `unidad` (
  `idunidad` int(11) NOT NULL,
  `ruta` int(11) NOT NULL,
  `eco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad`
--

INSERT INTO `unidad` (`idunidad`, `ruta`, `eco`) VALUES
(1, 14, 7),
(2, 56, 7),
(3, 2, 8),
(4, 8, 8),
(5, 11, 13);

-- --------------------------------------------------------

--
-- Table structure for table `unidad_has_conductor`
--

CREATE TABLE `unidad_has_conductor` (
  `unidad_idunidad` int(11) NOT NULL,
  `conductor_idconductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_has_conductor`
--

INSERT INTO `unidad_has_conductor` (`unidad_idunidad`, `conductor_idconductor`) VALUES
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `viaje`
--

CREATE TABLE `viaje` (
  `idviaje` int(11) NOT NULL,
  `tarjeta_idtarjeta` int(11) NOT NULL,
  `fecha_de_realizacion` datetime NOT NULL,
  `unidad_has_conductor_unidad_idunidad` int(11) NOT NULL,
  `unidad_has_conductor_conductor_idconductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `viaje`
--

INSERT INTO `viaje` (`idviaje`, `tarjeta_idtarjeta`, `fecha_de_realizacion`, `unidad_has_conductor_unidad_idunidad`, `unidad_has_conductor_conductor_idconductor`) VALUES
(1, 1596487, '2018-08-24 08:30:00', 2, 2),
(2, 5694258, '2018-08-18 10:08:45', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`idconductor`);

--
-- Indexes for table `detalle_queja`
--
ALTER TABLE `detalle_queja`
  ADD PRIMARY KEY (`iddetalle_queja`,`queja_idqueja`,`queja_viaje_idviaje`),
  ADD KEY `fk_detalle_queja_queja1_idx` (`queja_idqueja`,`queja_viaje_idviaje`),
  ADD KEY `fk_detalle_queja_conductor1_idx` (`conductor_idconductor`),
  ADD KEY `fk_detalle_queja_unidad1_idx` (`unidad_idunidad`);

--
-- Indexes for table `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`idpasajero`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  ADD KEY `fk_pasajero_pasajero_tipo_idx` (`pasajero_tipo_idpasajero_tipo`),
  ADD KEY `fk_pasajero_tarjeta1_idx` (`tarjeta_idtarjeta`);

--
-- Indexes for table `pasajero_tipo`
--
ALTER TABLE `pasajero_tipo`
  ADD PRIMARY KEY (`idpasajero_tipo`);

--
-- Indexes for table `queja`
--
ALTER TABLE `queja`
  ADD PRIMARY KEY (`idqueja`,`viaje_idviaje`),
  ADD KEY `fk_queja_viaje1_idx` (`viaje_idviaje`);

--
-- Indexes for table `sugerencia`
--
ALTER TABLE `sugerencia`
  ADD PRIMARY KEY (`idsugerencia`);

--
-- Indexes for table `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idtarjeta`);

--
-- Indexes for table `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`idunidad`);

--
-- Indexes for table `unidad_has_conductor`
--
ALTER TABLE `unidad_has_conductor`
  ADD PRIMARY KEY (`unidad_idunidad`,`conductor_idconductor`),
  ADD KEY `fk_unidad_has_conductor_conductor1_idx` (`conductor_idconductor`),
  ADD KEY `fk_unidad_has_conductor_unidad1_idx` (`unidad_idunidad`);

--
-- Indexes for table `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`idviaje`,`unidad_has_conductor_unidad_idunidad`,`unidad_has_conductor_conductor_idconductor`),
  ADD KEY `fk_viaje_tarjeta1_idx` (`tarjeta_idtarjeta`),
  ADD KEY `fk_viaje_unidad_has_conductor1_idx` (`unidad_has_conductor_unidad_idunidad`,`unidad_has_conductor_conductor_idconductor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conductor`
--
ALTER TABLE `conductor`
  MODIFY `idconductor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detalle_queja`
--
ALTER TABLE `detalle_queja`
  MODIFY `iddetalle_queja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `idpasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pasajero_tipo`
--
ALTER TABLE `pasajero_tipo`
  MODIFY `idpasajero_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `queja`
--
ALTER TABLE `queja`
  MODIFY `idqueja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sugerencia`
--
ALTER TABLE `sugerencia`
  MODIFY `idsugerencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unidad`
--
ALTER TABLE `unidad`
  MODIFY `idunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `viaje`
--
ALTER TABLE `viaje`
  MODIFY `idviaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_queja`
--
ALTER TABLE `detalle_queja`
  ADD CONSTRAINT `fk_detalle_queja_conductor1` FOREIGN KEY (`conductor_idconductor`) REFERENCES `conductor` (`idconductor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_queja_queja1` FOREIGN KEY (`queja_idqueja`,`queja_viaje_idviaje`) REFERENCES `queja` (`idqueja`, `viaje_idviaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_queja_unidad1` FOREIGN KEY (`unidad_idunidad`) REFERENCES `unidad` (`idunidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `fk_pasajero_pasajero_tipo` FOREIGN KEY (`pasajero_tipo_idpasajero_tipo`) REFERENCES `pasajero_tipo` (`idpasajero_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pasajero_tarjeta1` FOREIGN KEY (`tarjeta_idtarjeta`) REFERENCES `tarjeta` (`idtarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `queja`
--
ALTER TABLE `queja`
  ADD CONSTRAINT `fk_queja_viaje1` FOREIGN KEY (`viaje_idviaje`) REFERENCES `viaje` (`idviaje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unidad_has_conductor`
--
ALTER TABLE `unidad_has_conductor`
  ADD CONSTRAINT `fk_unidad_has_conductor_conductor1` FOREIGN KEY (`conductor_idconductor`) REFERENCES `conductor` (`idconductor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_has_conductor_unidad1` FOREIGN KEY (`unidad_idunidad`) REFERENCES `unidad` (`idunidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `fk_viaje_tarjeta1` FOREIGN KEY (`tarjeta_idtarjeta`) REFERENCES `tarjeta` (`idtarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_viaje_unidad_has_conductor1` FOREIGN KEY (`unidad_has_conductor_unidad_idunidad`,`unidad_has_conductor_conductor_idconductor`) REFERENCES `unidad_has_conductor` (`unidad_idunidad`, `conductor_idconductor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
