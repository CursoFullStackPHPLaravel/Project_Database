-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empresa_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `cuil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cuil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Tomas','Lodola','foto1.jpg'),(2,'Lucio','Lipari','foto1.jpg');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Directivo`
--

DROP TABLE IF EXISTS `Directivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Directivo` (
  `idDirectivo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idDirectivo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Directivo`
--

LOCK TABLES `Directivo` WRITE;
/*!40000 ALTER TABLE `Directivo` DISABLE KEYS */;
INSERT INTO `Directivo` VALUES (1,'Administrador'),(2,'RRHH'),(3,'AreaComercial'),(4,'MesaDeAyuda');
/*!40000 ALTER TABLE `Directivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `cuil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `idDirectivo` int(11) NOT NULL,
  PRIMARY KEY (`cuil`),
  KEY `idDirecitvo_idx` (`idDirectivo`),
  CONSTRAINT `idDirecitvo` FOREIGN KEY (`idDirectivo`) REFERENCES `directivo` (`iddirectivo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,'Martin','Zacarias','Admin/foto1.jpg',1),(2,'Alan','Ledesma','RRHH/foto2.jpg',2),(3,'Agustin','Chinche','AreaComercial/foto3.png',3),(4,'Erik','Diaz','MesaDeAyuda/foto4.jpg',4);
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_has_Directivo`
--

DROP TABLE IF EXISTS `Empleados_has_Directivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_has_Directivo` (
  `Empleados_cuil` int(11) NOT NULL,
  `Directivo_idDirectivo` int(11) NOT NULL,
  PRIMARY KEY (`Empleados_cuil`,`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo_Directivo1_idx` (`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo_Empleados_idx` (`Empleados_cuil`),
  CONSTRAINT `fk_Empleados_has_Directivo_Directivo1` FOREIGN KEY (`Directivo_idDirectivo`) REFERENCES `directivo` (`iddirectivo`),
  CONSTRAINT `fk_Empleados_has_Directivo_Empleados` FOREIGN KEY (`Empleados_cuil`) REFERENCES `empleados` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_has_Directivo`
--

LOCK TABLES `Empleados_has_Directivo` WRITE;
/*!40000 ALTER TABLE `Empleados_has_Directivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_has_Directivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_has_Directivo1`
--

DROP TABLE IF EXISTS `Empleados_has_Directivo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_has_Directivo1` (
  `Empleados_cuil` int(11) NOT NULL,
  `Directivo_idDirectivo` int(11) NOT NULL,
  PRIMARY KEY (`Empleados_cuil`,`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo1_Directivo1_idx` (`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo1_Empleados1_idx` (`Empleados_cuil`),
  CONSTRAINT `fk_Empleados_has_Directivo1_Directivo1` FOREIGN KEY (`Directivo_idDirectivo`) REFERENCES `directivo` (`iddirectivo`),
  CONSTRAINT `fk_Empleados_has_Directivo1_Empleados1` FOREIGN KEY (`Empleados_cuil`) REFERENCES `empleados` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_has_Directivo1`
--

LOCK TABLES `Empleados_has_Directivo1` WRITE;
/*!40000 ALTER TABLE `Empleados_has_Directivo1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_has_Directivo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_has_Directivo2`
--

DROP TABLE IF EXISTS `Empleados_has_Directivo2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_has_Directivo2` (
  `Empleados_cuil` int(11) NOT NULL,
  `Directivo_idDirectivo` int(11) NOT NULL,
  PRIMARY KEY (`Empleados_cuil`,`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo2_Directivo1_idx` (`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo2_Empleados1_idx` (`Empleados_cuil`),
  CONSTRAINT `fk_Empleados_has_Directivo2_Directivo1` FOREIGN KEY (`Directivo_idDirectivo`) REFERENCES `directivo` (`iddirectivo`),
  CONSTRAINT `fk_Empleados_has_Directivo2_Empleados1` FOREIGN KEY (`Empleados_cuil`) REFERENCES `empleados` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_has_Directivo2`
--

LOCK TABLES `Empleados_has_Directivo2` WRITE;
/*!40000 ALTER TABLE `Empleados_has_Directivo2` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_has_Directivo2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_has_Directivo3`
--

DROP TABLE IF EXISTS `Empleados_has_Directivo3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_has_Directivo3` (
  `Empleados_cuil` int(11) NOT NULL,
  `Directivo_idDirectivo` int(11) NOT NULL,
  PRIMARY KEY (`Empleados_cuil`,`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo3_Directivo1_idx` (`Directivo_idDirectivo`),
  KEY `fk_Empleados_has_Directivo3_Empleados1_idx` (`Empleados_cuil`),
  CONSTRAINT `fk_Empleados_has_Directivo3_Directivo1` FOREIGN KEY (`Directivo_idDirectivo`) REFERENCES `directivo` (`iddirectivo`),
  CONSTRAINT `fk_Empleados_has_Directivo3_Empleados1` FOREIGN KEY (`Empleados_cuil`) REFERENCES `empleados` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_has_Directivo3`
--

LOCK TABLES `Empleados_has_Directivo3` WRITE;
/*!40000 ALTER TABLE `Empleados_has_Directivo3` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_has_Directivo3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidades`
--

DROP TABLE IF EXISTS `Especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Especialidades` (
  `idEspecialidades` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEspecialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idEspecialidades`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidades`
--

LOCK TABLES `Especialidades` WRITE;
/*!40000 ALTER TABLE `Especialidades` DISABLE KEYS */;
INSERT INTO `Especialidades` VALUES (1,'Informatica'),(2,'Mecanica'),(3,'Electronica'),(4,'Construccion');
/*!40000 ALTER TABLE `Especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReporteIncidentes`
--

DROP TABLE IF EXISTS `ReporteIncidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReporteIncidentes` (
  `idReporteIncidentes` int(11) NOT NULL,
  `razonSocial` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cuilEmpleado` int(11) NOT NULL,
  `cuilCliente` int(11) NOT NULL,
  `cuilTecnico` int(11) NOT NULL,
  PRIMARY KEY (`idReporteIncidentes`),
  KEY `cuilCliente_idx` (`cuilCliente`),
  KEY `cuilTecnico_idx` (`cuilTecnico`),
  KEY `cuilEmpleado_idx` (`cuilEmpleado`),
  CONSTRAINT `cuilCliente` FOREIGN KEY (`cuilCliente`) REFERENCES `clientes` (`cuil`),
  CONSTRAINT `cuilEmpleado` FOREIGN KEY (`cuilEmpleado`) REFERENCES `empleados` (`cuil`),
  CONSTRAINT `cuilTecnico` FOREIGN KEY (`cuilTecnico`) REFERENCES `tecnicos` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReporteIncidentes`
--

LOCK TABLES `ReporteIncidentes` WRITE;
/*!40000 ALTER TABLE `ReporteIncidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReporteIncidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tecnicos`
--

DROP TABLE IF EXISTS `Tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tecnicos` (
  `cuil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cuil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tecnicos`
--

LOCK TABLES `Tecnicos` WRITE;
/*!40000 ALTER TABLE `Tecnicos` DISABLE KEYS */;
INSERT INTO `Tecnicos` VALUES (1,'Jhonathan','Bertonchelli','Tecnico/foto1.jpg'),(2,'Jose','Araya','Tecnico/foto2.jpg'),(3,'Mario','Morinigo','Tecnico/foto3.jpg');
/*!40000 ALTER TABLE `Tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tecnicos_Especialidades`
--

DROP TABLE IF EXISTS `Tecnicos_Especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tecnicos_Especialidades` (
  `Tecnicos_cuil` int(11) NOT NULL,
  `Especialidades_idEspecialidades` int(11) NOT NULL,
  PRIMARY KEY (`Tecnicos_cuil`,`Especialidades_idEspecialidades`),
  KEY `fk_Tecnicos_has_Especialidades_Especialidades1_idx` (`Especialidades_idEspecialidades`),
  KEY `fk_Tecnicos_has_Especialidades_Tecnicos1_idx` (`Tecnicos_cuil`),
  CONSTRAINT `fk_Tecnicos_has_Especialidades_Especialidades1` FOREIGN KEY (`Especialidades_idEspecialidades`) REFERENCES `especialidades` (`idespecialidades`),
  CONSTRAINT `fk_Tecnicos_has_Especialidades_Tecnicos1` FOREIGN KEY (`Tecnicos_cuil`) REFERENCES `tecnicos` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tecnicos_Especialidades`
--

LOCK TABLES `Tecnicos_Especialidades` WRITE;
/*!40000 ALTER TABLE `Tecnicos_Especialidades` DISABLE KEYS */;
INSERT INTO `Tecnicos_Especialidades` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `Tecnicos_Especialidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 22:20:15
