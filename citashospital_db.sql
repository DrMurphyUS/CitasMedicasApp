-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2025 a las 08:19:22
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citashospital_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` enum('generada','cancelada','vencida') NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paciente_id`, `medico_id`, `especialidad_id`, `fecha`, `hora`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 2, 2, 8, '2025-06-18', '13:00:00', 'generada', '2025-06-17 01:11:30', '2025-06-17 01:11:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `activo`) VALUES
(1, 'CARDIOLOGIA', 1),
(2, 'CIRUGIA GENERAL', 1),
(3, 'DERMATOLOGIA', 1),
(4, 'GASTROENTEROLOGIA', 1),
(5, 'GASTROENTEROLOGIA PEDIATRICA', 1),
(6, 'GERIATRIA', 1),
(7, 'GINECO-OBSTETRICIA', 1),
(8, 'MEDICINA GENERAL', 1),
(9, 'NEUMOLOGIA', 1),
(10, 'NEUROLOGIA', 1),
(11, 'NUTRICIÓN', 1),
(12, 'OFTALMOLOGIA', 1),
(13, 'OTORRINO LARINGOLOGIA', 1),
(14, 'PEDIATRIA Y NEONATOLOGIA', 1),
(15, 'RADIOLOGIA', 1),
(16, 'REUMATOLOGIA', 1),
(17, 'TRAUMATOLOGIA', 1),
(18, 'TRAUMATOLOGIA PEDIATRICA', 1),
(19, 'UROLOGIA', 1),
(20, 'UROLOGIA PEDIATRICA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_medicos`
--

CREATE TABLE `horarios_medicos` (
  `id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `duracion_cita` tinyint(2) NOT NULL COMMENT 'Duración en minutos',
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `horarios_medicos`
--

INSERT INTO `horarios_medicos` (`id`, `medico_id`, `especialidad_id`, `dia_semana`, `hora_inicio`, `hora_fin`, `duracion_cita`, `activo`) VALUES
(1, 1, 8, 'Lunes', '08:00:00', '14:00:00', 20, 1),
(2, 1, 8, 'Martes', '08:00:00', '14:00:00', 20, 1),
(3, 1, 8, 'Miércoles', '12:00:00', '18:00:00', 20, 1),
(4, 1, 8, 'Jueves', '12:00:00', '18:00:00', 20, 1),
(5, 1, 8, 'Viernes', '08:00:00', '12:00:00', 20, 1),
(6, 1, 8, 'Sábado', '08:00:00', '12:00:00', 20, 1),
(7, 2, 8, 'Lunes', '12:00:00', '18:00:00', 20, 1),
(8, 2, 8, 'Martes', '12:00:00', '18:00:00', 20, 1),
(9, 2, 8, 'Miércoles', '08:00:00', '14:00:00', 20, 1),
(10, 2, 8, 'Jueves', '08:00:00', '14:00:00', 20, 1),
(11, 2, 8, 'Viernes', '13:00:00', '17:00:00', 20, 1),
(12, 2, 8, 'Sábado', '13:00:00', '17:00:00', 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cmp_digital` mediumint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `usuario_id`, `cmp_digital`) VALUES
(1, 2, 234543),
(2, 3, 875964);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos_especialidades`
--

CREATE TABLE `medicos_especialidades` (
  `especialidad_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `medicos_especialidades`
--

INSERT INTO `medicos_especialidades` (`especialidad_id`, `medico_id`) VALUES
(8, 1),
(8, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `alergias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `usuario_id`, `grupo_sanguineo`, `alergias`) VALUES
(1, 1, 'O-', 'Corticoides como dexametasona.'),
(2, 4, 'O-', 'No registra.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `celular` int(9) NOT NULL,
  `tipo_documento` enum('DNI','CE','PAS') NOT NULL,
  `nro_documento` int(20) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `rol` enum('admin','medico','paciente') NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `correo`, `celular`, `tipo_documento`, `nro_documento`, `contrasenia`, `rol`, `activo`, `fecha_creacion`) VALUES
(1, 'Luis Alberto Minaya García', 'lminaya.developer@gmail.com', 987654321, 'DNI', 12345678, '$2a$12$LTiscpPIO3zJU/CmJ1cH5.Xrwl3kSXLWtA3bKx.vFoa20c4yWeKwe', 'paciente', 1, '2025-06-04 20:15:16'),
(2, 'Murphy Steward Sequeiros Nuñez', 'dr.msequeirosn@gmail.com', 997654321, 'DNI', 12345679, '$2a$12$LTiscpPIO3zJU/CmJ1cH5.Xrwl3kSXLWtA3bKx.vFoa20c4yWeKwe', 'medico', 1, '2025-06-16 20:15:16'),
(3, 'Rocio Olenka Mahua Ramirez', 'rocio.mahuaramirez@gmail.com', 999654321, 'DNI', 12345677, '$2a$12$LTiscpPIO3zJU/CmJ1cH5.Xrwl3kSXLWtA3bKx.vFoa20c4yWeKwe', 'medico', 1, '2025-06-16 22:15:16'),
(4, 'Irwins Warrens Chahua Huamani', 'irwins.chahuah@gmail.com', 998654321, 'DNI', 12345676, '$2a$12$LTiscpPIO3zJU/CmJ1cH5.Xrwl3kSXLWtA3bKx.vFoa20c4yWeKwe', 'paciente', 1, '2025-06-16 22:45:23'),
(5, 'Alfredo Castillo Farfán', 'alfredo.castillof@gmail.com', 998754321, 'DNI', 12345675, '$2a$12$LTiscpPIO3zJU/CmJ1cH5.Xrwl3kSXLWtA3bKx.vFoa20c4yWeKwe', 'admin', 1, '2025-06-16 23:00:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`),
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medico_id` (`medico_id`),
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key` (`usuario_id`);

--
-- Indices de la tabla `medicos_especialidades`
--
ALTER TABLE `medicos_especialidades`
  ADD PRIMARY KEY (`medico_id`,`especialidad_id`) USING BTREE,
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_uk` (`correo`),
  ADD UNIQUE KEY `nro_documento` (`nro_documento`),
  ADD UNIQUE KEY `celular` (`celular`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD CONSTRAINT `horarios_medicos_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horarios_medicos_ibfk_2` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicos_especialidades`
--
ALTER TABLE `medicos_especialidades`
  ADD CONSTRAINT `medicos_especialidades_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicos_especialidades_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `foreign_key` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
