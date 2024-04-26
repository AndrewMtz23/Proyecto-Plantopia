-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: server
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tinventario`
--

DROP TABLE IF EXISTS `tinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estatus` int NOT NULL,
  `sucursal` int NOT NULL,
  `proveedor` int NOT NULL,
  `producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_idx` (`sucursal`),
  KEY `proveedor_idx` (`proveedor`),
  KEY `producto_idx` (`producto`),
  CONSTRAINT `producto` FOREIGN KEY (`producto`) REFERENCES `tproductos` (`id`),
  CONSTRAINT `proveedor` FOREIGN KEY (`proveedor`) REFERENCES `tproveedores` (`id`),
  CONSTRAINT `sucursal` FOREIGN KEY (`sucursal`) REFERENCES `tsucursales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinventario`
--

LOCK TABLES `tinventario` WRITE;
/*!40000 ALTER TABLE `tinventario` DISABLE KEYS */;
INSERT INTO `tinventario` VALUES (1,1,1,1,1,98),(2,1,2,2,2,996),(3,1,3,3,3,978),(4,1,1,1,4,1000),(5,1,2,3,5,1000),(6,1,3,2,6,998),(7,1,1,1,7,1000),(9,1,2,3,11,1000),(10,1,3,2,10,1000);
/*!40000 ALTER TABLE `tinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlista`
--

DROP TABLE IF EXISTS `tlista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlista` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventario` int NOT NULL,
  `usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario_idx` (`usuario`),
  KEY `idInventario_idx` (`inventario`),
  CONSTRAINT `idInventario` FOREIGN KEY (`inventario`) REFERENCES `tinventario` (`id`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlista`
--

LOCK TABLES `tlista` WRITE;
/*!40000 ALTER TABLE `tlista` DISABLE KEYS */;
INSERT INTO `tlista` VALUES (22,3,6),(23,4,6),(24,1,7),(25,6,7);
/*!40000 ALTER TABLE `tlista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpedido`
--

DROP TABLE IF EXISTS `tpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventario` int NOT NULL,
  `usuario` int NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_idx` (`inventario`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `inventario` FOREIGN KEY (`inventario`) REFERENCES `tinventario` (`id`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpedido`
--

LOCK TABLES `tpedido` WRITE;
/*!40000 ALTER TABLE `tpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tproductos`
--

DROP TABLE IF EXISTS `tproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tproductos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estatus` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `detalles` varchar(450) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `precioCompra` double NOT NULL,
  `precioVenta` double NOT NULL,
  `imagen` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tproductos`
--

LOCK TABLES `tproductos` WRITE;
/*!40000 ALTER TABLE `tproductos` DISABLE KEYS */;
INSERT INTO `tproductos` VALUES (1,1,'Mueble para Plantas','Mueble de Madera para 10 Plantas.','Productos especializados',100,150,'/images/003.jpg'),(2,1,'Pack 4 Macetas','Paquete de 4 Macetas para Plantas','Productos especializados',250,400,'/images/002.jpg'),(3,1,'Pack Macetas Telefono','Paquete de 2 Macetas Telefono','Productos especializados',100,140,'/images/005.jpg'),(4,1,'Plantas Decorativas','Plantas decorativas para Interior','Plantas de Interior',70,120,'/images/004.jpg'),(5,1,'Macetero Metalico','Macetero Metalico para Plantas','Productos Jardineria',1400,1700,'/images/001.jpg'),(6,1,'Red de Plantas','Decoración de Plantas','Productos especializados',250,300,'/images/006.jpg'),(7,1,'Plantas Teléfono Interior','Tres Lindas Plantas Teléfono para Cuarto o Habitación.','Plantas de Interior',200,300,'/images/008.jpg'),(10,1,'Poster','Poster de Plantas','Productos especializados',100,120,'/images/planta.png'),(11,1,'Macetas','Macetas Bonitas para Plantas','Plantas de Exterior',250,300,'/images/009.jpg');
/*!40000 ALTER TABLE `tproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tproveedores`
--

DROP TABLE IF EXISTS `tproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tproveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estatus` int NOT NULL,
  `marca` varchar(45) NOT NULL,
  `representante` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(450) NOT NULL,
  `fechaContrato` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tproveedores`
--

LOCK TABLES `tproveedores` WRITE;
/*!40000 ALTER TABLE `tproveedores` DISABLE KEYS */;
INSERT INTO `tproveedores` VALUES (1,1,'PlantasQro','Oscar Jimenez','4421342819','plantasqro@gmail.com','Roma Nª203','24-08-2015'),(2,1,'VerdeGuanajuato','Omar Chaparro','4421427454','plantasgto@gmail.com','Roma Nª204','14-05-2017'),(3,1,'BolillosNaturalesCdmx','Rodrigo Mata','1234567890','plantascdmx@gmail.com','Roma Nª205','12-03-2019');
/*!40000 ALTER TABLE `tproveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsucursales`
--

DROP TABLE IF EXISTS `tsucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsucursales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estatus` int NOT NULL,
  `gerente` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsucursales`
--

LOCK TABLES `tsucursales` WRITE;
/*!40000 ALTER TABLE `tsucursales` DISABLE KEYS */;
INSERT INTO `tsucursales` VALUES (1,1,2,'PlantopiaQRO','4421781565','Av de la Luz 508'),(2,1,2,'PlantopiaCDMX','4421781565','Ciudad de Mexico'),(3,1,2,'PlantopiaGTO','4421781565','Guanajuato');
/*!40000 ALTER TABLE `tsucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tusuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estatus` int NOT NULL,
  `tipo` int NOT NULL,
  `clave` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fechaNacimiento` varchar(10) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `domicilio` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,1,1,'1234','victor','10/10/1980','MASCULINO','4421781565','admin@gmail.com','UTEQ'),(2,1,1,'1234','andres','23-06-2003','MASCULINO','4421781565','andrew@gmail.com','Biombo'),(3,1,2,'1234','lilith','18-12-2004','FEMENINO','4421427454','lilith@gmail.com','Biombo'),(4,1,2,'1234','Flor','20-06-2003','FEMENINO','1234567890','flortalavera@gmail.com','Granjenos'),(5,1,2,'1234','Flor Andrade','23-07-2003','FEMENINO','4421302208','florecitaanda@gmail.com','Lomas de Casa Blanca'),(6,1,2,'123','pepe','23-06-2003','MASCULINO','1234567890','pepe@gmail.com','uteq'),(7,1,2,'1234','montse3','12-12-2000','MUJER','1234567890','montse3@gmail.com','uteq');
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tventas`
--

DROP TABLE IF EXISTS `tventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NOT NULL,
  `producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `total` double NOT NULL,
  `fechaRegistro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario_idx` (`usuario`),
  KEY `idProducto` (`producto`),
  CONSTRAINT `idCliente` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`id`),
  CONSTRAINT `idProducto` FOREIGN KEY (`producto`) REFERENCES `tproductos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tventas`
--

LOCK TABLES `tventas` WRITE;
/*!40000 ALTER TABLE `tventas` DISABLE KEYS */;
INSERT INTO `tventas` VALUES (1,3,1,1,150,'2024-03-30 17:01:16'),(2,3,2,2,800,'2024-03-31 17:11:29'),(3,3,3,4,560,'2024-03-31 17:11:29'),(4,3,6,1,300,'2024-04-01 17:40:05'),(5,3,3,1,140,'2024-04-01 17:40:05'),(6,3,3,1,140,'2024-04-01 17:50:19'),(7,3,3,1,140,'2024-04-01 17:53:50'),(8,3,3,1,140,'2024-04-01 17:55:14'),(9,3,3,12,1680,'2024-04-02 17:23:22'),(10,3,2,1,400,'2024-04-09 18:18:47'),(11,3,3,1,140,'2024-04-09 18:18:47'),(12,3,2,1,400,'2024-04-09 18:37:44'),(13,3,3,1,140,'2024-04-09 18:37:44'),(14,7,6,1,300,'2024-04-16 17:43:33'),(15,7,1,1,150,'2024-04-16 17:43:33');
/*!40000 ALTER TABLE `tventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22  2:55:44
