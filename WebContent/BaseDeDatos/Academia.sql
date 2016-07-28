-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.13-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para academia
CREATE DATABASE IF NOT EXISTS `academia` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `academia`;


-- Volcando estructura para tabla academia.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fecha_inicio` text,
  `fecha_fin` text,
  `numero_horas` varchar(1000) DEFAULT NULL,
  `objetivos` varchar(5000) DEFAULT NULL,
  `requisitos` varchar(5000) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla academia.cursos: ~3 rows (aproximadamente)
DELETE FROM `cursos`;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`id`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_fin`, `numero_horas`, `objetivos`, `requisitos`) VALUES
	(1, 'Java', 'Curso de Java', 'null', 'null', '1000', 'Aprender Java', 'ESO'),
	(3, 'Hibernate', 'Aprender el Framework a fondo', 'null', 'null', '500', 'Acceder al mercado laboral.', 'Conocimientos JavaSE.'),
	(5, 'Office Avanzado', '- Word \r\n- Excel\r\n- Access\r\n- PowerPoint', 'null', 'null', '100', 'Obtener conocimientos avanzados en las herramientas Office', 'Conocimientos Office Basicos');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;


-- Volcando estructura para tabla academia.ficha_alumnos
CREATE TABLE IF NOT EXISTS `ficha_alumnos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla academia.ficha_alumnos: ~3 rows (aproximadamente)
DELETE FROM `ficha_alumnos`;
/*!40000 ALTER TABLE `ficha_alumnos` DISABLE KEYS */;
INSERT INTO `ficha_alumnos` (`id`, `user`, `nombre`, `apellidos`, `correo_electronico`, `pass`, `rol`) VALUES
	(4, 'admin', 'admin', 'admin', 'admin', 'admin', 'Administrador'),
	(13, 'user', 'user', 'user', 'user@user.com', '123456', 'Alumno');
/*!40000 ALTER TABLE `ficha_alumnos` ENABLE KEYS */;


-- Volcando estructura para tabla academia.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla_de_usuarios_login_y_password';

-- Volcando datos para la tabla academia.usuarios: ~0 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
