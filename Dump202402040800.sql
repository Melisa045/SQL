-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: marketplace_db
-- ------------------------------------------------------
-- Server version	8.0.35
/*
   
Tablas incluídas en el backup

select * from usuarios;
select * from historial_compras;
select * from categorias;
select * from productos;
select * from detalle_historial;
select * from proveedores;
select * from promociones;
select * from ordenes;
select * from ordenes_promociones;
select * from envios;
select * from detalle_orden;
select * from carrito;
select * from detalle_carrito;
select * from comentarios;
*/


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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,'2024-06-01 10:15:00',1),(2,'2024-06-02 12:30:00',2),(3,'2024-06-03 14:45:00',3),(4,'2024-06-04 09:00:00',4),(5,'2024-06-05 11:20:00',5),(6,'2024-06-06 16:00:00',6),(7,'2024-06-07 08:45:00',7),(8,'2024-06-08 13:10:00',8),(9,'2024-06-09 15:30:00',9),(10,'2024-06-10 10:00:00',10);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Electrónicos','Productos electrónicos como teléfonos, computadoras y accesorios','2024-01-27 11:44:58'),(2,'Ropa','Ropa de moda para hombres, mujeres y niños','2024-01-27 11:44:58'),(3,'Hogar y Jardín','Artículos para el hogar, muebles y suministros de jardinería.','2024-01-27 11:44:58'),(4,'Deportes','Equipos y accesorios para deportes y actividades al aire libre.','2024-01-27 11:44:58'),(5,'Libros','Libros de diversas categorías','2024-01-27 11:44:58'),(6,'Juguetes','Juguetes para niños de todas las edades','2024-01-27 11:44:58'),(7,'Joyería','Joyas y accesorios','2024-01-27 11:44:58'),(8,'Alimentación','Productos alimenticios y gourmet','2024-01-27 11:44:58'),(9,'Salud y Belleza','Productos para el cuidado personal','2024-01-27 11:44:58'),(10,'Automotriz','Accesorios y productos para automóviles','2024-01-27 11:44:58');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `calificacion` varchar(45) DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `id_producto` (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'¡Excelente producto, estoy muy satisfecho!','2024-06-01 14:30:00','Aprobado','5 estrellas',1,1),(2,'Buen servicio al cliente, rápido y eficiente.','2024-06-02 11:45:00','Aprobado','4 estrellas',2,2),(3,'Producto de calidad, lo recomiendo.','2024-06-03 09:20:00','Pendiente','5 estrellas',3,3),(4,'No recibí mi pedido a tiempo, servicio insatisfactorio.','2024-06-04 16:00:00','Rechazado','2 estrellas',4,4),(5,'¡Me encanta! Compré otro para regalar.','2024-06-05 12:15:00','Aprobado','5 estrellas',5,5),(6,'El producto no cumplió con mis expectativas.','2024-06-06 14:45:00','Aprobado','3 estrellas',6,6),(7,'Servicio de entrega excelente, llegó antes de lo esperado.','2024-06-07 10:30:00','Aprobado','4 estrellas',7,7),(8,'Calidad regular, esperaba más.','2024-06-08 13:00:00','Rechazado','2 estrellas',8,8),(9,'¡Me encanta este producto! Compraría de nuevo.','2024-06-09 15:30:00','Pendiente','5 estrellas',9,9),(10,'Buen servicio, producto conforme a la descripción.','2024-06-10 08:45:00','Aprobado','4 estrellas',10,10);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_carrito` (
  `id_detalle_carrito` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_carrito` int DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_carrito`),
  KEY `id_carrito` (`id_carrito`),
  KEY `id_orden` (`id_orden`),
  KEY `id_producto` (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  CONSTRAINT `detalle_carrito_ibfk_2` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`),
  CONSTRAINT `detalle_carrito_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_carrito_ibfk_4` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `detalle_carrito_ibfk_5` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
INSERT INTO `detalle_carrito` VALUES (1,2,35.99,1,1,1,1,4),(2,1,25.50,2,2,2,2,4),(3,3,45.75,3,3,3,3,4),(4,4,80.00,4,4,4,4,4),(5,2,37.98,5,5,5,5,5),(6,1,44.99,6,6,6,6,6),(7,3,90.00,7,7,7,7,7),(8,2,31.50,8,8,8,8,8),(9,1,28.99,9,9,9,9,9),(11,3,29.95,10,NULL,8,NULL,NULL);
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_historial`
--

DROP TABLE IF EXISTS `detalle_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_historial` (
  `id_detalle_historial` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `id_historial` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_historial`),
  KEY `id_historial` (`id_historial`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_historial_ibfk_1` FOREIGN KEY (`id_historial`) REFERENCES `historial_compras` (`id_historial`),
  CONSTRAINT `detalle_historial_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `detalle_historial_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `detalle_historial_ibfk_4` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_historial`
--

LOCK TABLES `detalle_historial` WRITE;
/*!40000 ALTER TABLE `detalle_historial` DISABLE KEYS */;
INSERT INTO `detalle_historial` VALUES (1,59.99,2,'Buena compra',1,3,1,1),(2,19.99,1,'Talla correcta',1,2,2,2),(3,89.95,1,'Excelente calidad',1,1,3,3),(4,45.78,2,'Buena compra',1,3,1,1),(5,19.99,2,'Excelente calidad',1,2,1,1),(6,68.23,2,'Excelente calidad',2,1,1,1),(7,42.11,2,'Talla correcta',1,2,2,2),(8,29.99,3,'Divertido para jugar en equipo',2,4,4,4),(9,14.50,1,'Interesante trama',2,3,5,5),(10,39.99,1,'Ideal para regalar',3,1,6,6),(11,499.99,1,'Muy elegante',3,2,7,7),(12,29.95,2,'Deliciosos snacks',4,4,8,8),(13,59.99,1,'Noté mejoras en mi piel',4,3,9,9),(14,12.75,1,'Fácil instalación',5,1,10,10);
/*!40000 ALTER TABLE `detalle_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_envio` int DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_producto` (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_envio` (`id_envio`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `detalle_orden_ibfk_3` FOREIGN KEY (`id_envio`) REFERENCES `envios` (`id_envio`),
  CONSTRAINT `detalle_orden_ibfk_4` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
INSERT INTO `detalle_orden` VALUES (1,2,35.99,1,1,1,1,1),(2,1,25.50,2,2,2,2,2),(3,3,45.75,3,3,3,3,3),(4,4,80.00,4,4,4,4,4),(5,2,37.98,5,5,5,5,5),(6,1,44.99,6,6,6,6,6),(7,3,90.00,7,7,7,7,7),(8,2,31.50,8,8,8,8,8),(9,1,28.99,9,9,9,9,9),(10,4,65.00,10,10,10,10,10),(11,2,35.99,1,1,1,1,1),(12,1,25.50,2,2,2,2,2),(13,2,50.00,1,1,1,1,1),(14,1,25.50,2,2,2,2,2);
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `metodo` varchar(255) NOT NULL,
  `courrier` varchar(50) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `tiempo_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,'Calle Principal 123','En Proceso','2024-06-15 14:00:00','Estándar','EnvíoExpress',15.99,NULL),(2,'Avenida Secundaria 456','Enviado','2024-06-16 10:30:00','Express','RápidoEnvíos',25.50,'2024-06-18 14:00:00'),(3,'Plaza Comercial 789','Entregado','2024-06-17 11:45:00','Estándar','MegaLogística',12.75,'2024-06-19 12:30:00'),(4,'Calle Peatonal 101','En Proceso','2024-06-18 09:30:00','Express','EntregaVeloz',20.00,NULL),(5,'Calle de los Libros 202','Enviado','2024-06-19 12:15:00','Estándar','LibrosExpress',18.99,'2024-06-21 15:00:00'),(6,'Esquina de los Juguetes 303','Entregado','2024-06-20 15:30:00','Express','JugueteRápido',22.50,'2024-06-22 10:45:00'),(7,'Avenida de las Joyas 404','Enviado','2024-06-21 14:45:00','Estándar','JoyasEnvíos',30.00,'2024-06-23 13:00:00'),(8,'Calle de los Alimentos 505','En Proceso','2024-06-22 10:00:00','Express','RicoEnvío',15.75,NULL),(9,'Paseo de la Salud 606','Entregado','2024-06-23 12:30:00','Estándar','SaludableExpress',28.99,'2024-06-25 09:15:00'),(10,'Bulevar Automotriz 707','En Proceso','2024-06-24 09:45:00','Express','AutoRápido',19.50,NULL);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_compras`
--

DROP TABLE IF EXISTS `historial_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_compras` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `historial_compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_compras`
--

LOCK TABLES `historial_compras` WRITE;
/*!40000 ALTER TABLE `historial_compras` DISABLE KEYS */;
INSERT INTO `historial_compras` VALUES (1,'2024-06-01 10:15:00','Completado',1),(2,'2024-06-02 12:30:00','Pendiente',2),(3,'2024-06-03 14:45:00','Cancelado',3),(4,'2024-06-04 09:00:00','Completado',4),(5,'2024-06-05 11:20:00','Pendiente',5),(6,'2024-06-06 16:00:00','Completado',6),(7,'2024-06-07 08:45:00','Cancelado',7),(8,'2024-06-08 13:10:00','Completado',8),(9,'2024-06-09 15:30:00','Pendiente',9),(10,'2024-06-10 10:00:00','Completado',10),(11,'2024-06-08 13:10:00','Cancelado',1),(12,'2024-06-09 15:30:00','Completado',2),(13,'2024-06-10 10:00:00','Pendiente',3);
/*!40000 ALTER TABLE `historial_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_productos`
--

DROP TABLE IF EXISTS `log_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_productos` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `fecha_modificacion` date NOT NULL,
  `hora_modificacion` time NOT NULL,
  `accion_realizada` varchar(255) NOT NULL,
  `columna_modificada` varchar(255) DEFAULT NULL,
  `valor_anterior` varchar(255) DEFAULT NULL,
  `valor_actual` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_productos`
--

LOCK TABLES `log_productos` WRITE;
/*!40000 ALTER TABLE `log_productos` DISABLE KEYS */;
INSERT INTO `log_productos` VALUES (1,2,'nombre_de_usuario','2024-01-27','13:29:25','before update',NULL,'Camiseta de Algodón','Camiseta de Algodón'),(2,2,'nombre_de_usuario','2024-01-27','13:29:51','before update',NULL,'Camiseta de Algodón','Camiseta de Algodón'),(3,2,'root@localhost','2024-01-27','13:29:51','After update','price','23.51','23.55');
/*!40000 ALTER TABLE `log_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_usuarios`
--

DROP TABLE IF EXISTS `log_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_usuarios` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `campo_modificado` varchar(50) NOT NULL,
  `valor_anterior` varchar(255) DEFAULT NULL,
  `valor_actual` varchar(255) DEFAULT NULL,
  `fecha_modificacion` date NOT NULL,
  `hora_modificacion` time NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuarios`
--

LOCK TABLES `log_usuarios` WRITE;
/*!40000 ALTER TABLE `log_usuarios` DISABLE KEYS */;
INSERT INTO `log_usuarios` VALUES (1,1,'nroDoc','123456789','123456333','2024-01-27','13:56:37'),(2,11,'nuevo_usuario_insertado',NULL,NULL,'2024-01-27','13:57:58');
/*!40000 ALTER TABLE `log_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,'2024-06-01 10:15:00','En Proceso'),(2,'2024-06-02 12:30:00','Enviado'),(3,'2024-06-03 14:45:00','Entregado'),(4,'2024-06-04 09:00:00','En Proceso'),(5,'2024-06-05 11:20:00','Enviado'),(6,'2024-06-06 16:00:00','Entregado'),(7,'2024-06-07 08:45:00','En Proceso'),(8,'2024-06-08 13:10:00','Enviado'),(9,'2024-06-09 15:30:00','Entregado'),(10,'2024-06-10 10:00:00','Enviado');
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_promociones`
--

DROP TABLE IF EXISTS `ordenes_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_promociones` (
  `id_orden` int NOT NULL,
  `id_promocion` int NOT NULL,
  PRIMARY KEY (`id_orden`,`id_promocion`),
  KEY `id_promocion` (`id_promocion`),
  CONSTRAINT `ordenes_promociones_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`),
  CONSTRAINT `ordenes_promociones_ibfk_2` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_promociones`
--

LOCK TABLES `ordenes_promociones` WRITE;
/*!40000 ALTER TABLE `ordenes_promociones` DISABLE KEYS */;
INSERT INTO `ordenes_promociones` VALUES (1,1),(2,1),(1,2),(1,3),(2,7);
/*!40000 ALTER TABLE `ordenes_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Smartphone X','Potente smartphone con cámara dual',599.99,50,1),(2,'Camiseta de Algodón','Camiseta cómoda y de alta calidad',23.55,100,2),(3,'Juego de Sartenes','Set de sartenes antiadherentes',89.95,30,3),(4,'Balón de Fútbol','Balón oficial para partidos',29.99,20,4),(5,'Libro \"Aventuras en el Espacio\"','Novela de ciencia ficción',14.50,80,5),(6,'Muñeca Interactiva','Muñeca que habla y realiza acciones',39.99,15,6),(7,'Collar de Diamantes','Collar elegante con diamantes',499.99,10,7),(8,'Pack de Snacks Saludables','Variado pack de snacks saludables',29.95,50,8),(9,'Kit de Cuidado Facial','Productos para el cuidado facial',59.99,25,9),(10,'Limpiaparabrisas Universal','Limpiaparabrisas de calidad para automóviles',12.75,40,10),(11,'Smartwatch','clásico y prémium',309.99,50,1),(12,'laptops','LAPTOP ACER ASPIRE 5 CORE I5',1997.99,100,2),(13,'Tablets','Tablet lenovo m10 plus (3ra gen)',589.95,30,3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_producto` (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `promociones_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `promociones_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Oferta Verano',0.15,'2024-01-01 00:00:00','2024-06-30 23:59:59',1,1,4),(2,'Oferta Verano DivertiKids',0.35,'2024-01-01 00:00:00','2024-06-30 23:59:59',2,2,4),(3,'Oferta Verano EnjoyFamily',0.55,'2024-01-01 00:00:00','2024-06-30 23:59:59',5,5,4),(4,'Descuento Ropa',0.20,'2024-01-01 00:00:00','2024-07-15 23:59:59',2,2,6),(5,'Liquidación Hogar',0.30,'2024-04-01 00:00:00','2024-08-31 23:59:59',3,3,6),(6,'Especial Deportes',0.25,'2024-04-01 00:00:00','2024-09-15 23:59:59',4,4,4),(7,'Promo Libros',0.18,'2024-05-01 00:00:00','2024-10-31 23:59:59',5,5,5),(8,'Juguetes Rebajados',0.22,'2024-07-01 00:00:00','2024-11-15 23:59:59',6,6,6),(9,'Descuento Joyería',0.15,'2024-08-01 00:00:00','2024-12-31 23:59:59',7,7,7),(10,'Oferta Alimentación',0.25,'2025-08-01 00:00:00','2025-01-15 23:59:59',8,8,8),(11,'Cuidado Facial en Oferta',0.20,'2025-09-01 00:00:00','2025-02-28 23:59:59',9,9,9),(12,'Accesorios Automotrices',0.15,'2025-09-01 00:00:00','2025-03-15 23:59:59',10,10,10);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `contacto` varchar(20) NOT NULL,
  `direccion` varchar(90) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `info_financiera` varchar(255) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (2,'Proveedor B','888777666','Avenida Secundaria 456','Activo','Cuenta Bancaria: YYYY-YYYY-YYYY-YYYY','Ropa'),(3,'Proveedor C','777666555','Plaza Comercial 789','Inactivo','Cuenta Bancaria: ZZZZ-ZZZZ-ZZZZ-ZZZZ','Hogar'),(4,'Proveedor D','666555444','Calle Peatonal 101','Activo','Cuenta Bancaria: WWWW-WWWW-WWWW-WWWW','Deportes'),(5,'Proveedor E','555444333','Calle de los Libros 202','Inactivo','Cuenta Bancaria: VVVV-VVVV-VVVV-VVVV','Libros'),(6,'Proveedor F','444333222','Esquina de los Juguetes 303','Activo','Cuenta Bancaria: UUUU-UUUU-UUUU-UUUU','Juguetes'),(7,'Proveedor G','333222111','Avenida de las Joyas 404','Activo','Cuenta Bancaria: TTTT-TTTT-TTTT-TTTT','Joyería'),(8,'Proveedor H','222111000','Calle de los Alimentos 505','Inactivo','Cuenta Bancaria: SSSS-SSSS-SSSS-SSSS','Alimentación'),(9,'Proveedor I','111000999','Paseo de la Salud 606','Activo','Cuenta Bancaria: RRRR-RRRR-RRRR-RRRR','Salud y Belleza'),(10,'Proveedor J','999000888','Bulevar Automotriz 707','Activo','Cuenta Bancaria: QQQQ-QQQQ-QQQQ-QQQQ','Automotriz');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(50) NOT NULL,
  `nroDoc` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'DNI','123456333','Juan','Pérez','juan.perez@email.com','contraseña123','987654321','1990-05-15 00:00:00'),(2,'Pasaporte','987654321','Ana','Gómez','ana.gomez@email.com','clave_segura','654321987','1985-08-22 00:00:00'),(3,'DNI','567890123','Pedro','Martínez','pedro.martinez@email.com','password123','789012345','1992-02-10 00:00:00'),(4,'Carné de Identidad','456789012','Laura','García','laura.garcia@email.com','seguridad456','012345678','1988-11-30 00:00:00'),(5,'DNI','345678901','Miguel','López','miguel.lopez@email.com','contraseña456','345678901','1995-07-05 00:00:00'),(6,'Pasaporte','234567890','Carolina','Sánchez','carolina.sanchez@email.com','clave_segura789','567890123','1998-04-18 00:00:00'),(7,'DNI','876543210','Daniel','Fernández','daniel.fernandez@email.com','secure_pass','678901234','1983-09-12 00:00:00'),(8,'Carné de Identidad','765432109','Isabel','Díaz','isabel.diaz@email.com','password789','890123456','1991-12-25 00:00:00'),(9,'DNI','654321098','Lucas','Hernández','lucas.hernandez@email.com','contraseña789','901234567','1980-06-08 00:00:00'),(10,'Pasaporte','543210987','María','Jiménez','maria.jimenez@email.com','seguro_pass','234567890','1987-03-03 00:00:00'),(11,'DNI','123456111','José','Pérez','jose.perez@email.com','contraseña123','987654321','1990-05-15 00:00:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_carrito_detalles`
--

DROP TABLE IF EXISTS `view_carrito_detalles`;
/*!50001 DROP VIEW IF EXISTS `view_carrito_detalles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_carrito_detalles` AS SELECT 
 1 AS `id_detalle_carrito`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `id_carrito`,
 1 AS `fecha_creacion`,
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `description`,
 1 AS `id_proveedor`,
 1 AS `nombre_proveedor`,
 1 AS `total_detalles`,
 1 AS `total_precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_historial_usuario`
--

DROP TABLE IF EXISTS `view_historial_usuario`;
/*!50001 DROP VIEW IF EXISTS `view_historial_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_historial_usuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `tipo_documento`,
 1 AS `nroDoc`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `correo`,
 1 AS `telefono`,
 1 AS `fecha_nacimiento`,
 1 AS `id_historial`,
 1 AS `fecha`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_total_venta_por_categoria`
--

DROP TABLE IF EXISTS `vista_total_venta_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `vista_total_venta_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_total_venta_por_categoria` AS SELECT 
 1 AS `id_categoria`,
 1 AS `nombre_categoria`,
 1 AS `total_ventas`,
 1 AS `ingreso_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_carrito_detalles`
--

/*!50001 DROP VIEW IF EXISTS `view_carrito_detalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_carrito_detalles` AS select `dc`.`id_detalle_carrito` AS `id_detalle_carrito`,`dc`.`cantidad` AS `cantidad`,`dc`.`precio_unitario` AS `precio_unitario`,`c`.`id_carrito` AS `id_carrito`,`c`.`fecha_creacion` AS `fecha_creacion`,`p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre_producto`,`p`.`description` AS `description`,`pr`.`id_proveedor` AS `id_proveedor`,`pr`.`nombre` AS `nombre_proveedor`,count(0) AS `total_detalles`,sum((`dc`.`precio_unitario` * `dc`.`cantidad`)) AS `total_precio` from (((`detalle_carrito` `dc` join `carrito` `c` on((`dc`.`id_carrito` = `c`.`id_carrito`))) join `productos` `p` on((`dc`.`id_producto` = `p`.`id_producto`))) join `proveedores` `pr` on((`dc`.`id_proveedor` = `pr`.`id_proveedor`))) group by `dc`.`id_detalle_carrito`,`c`.`id_carrito`,`p`.`id_producto` order by `c`.`fecha_creacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_historial_usuario`
--

/*!50001 DROP VIEW IF EXISTS `view_historial_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_historial_usuario` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`tipo_documento` AS `tipo_documento`,`u`.`nroDoc` AS `nroDoc`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`u`.`correo` AS `correo`,`u`.`telefono` AS `telefono`,`u`.`fecha_nacimiento` AS `fecha_nacimiento`,`h`.`id_historial` AS `id_historial`,`h`.`fecha` AS `fecha`,`h`.`estado` AS `estado` from (`usuarios` `u` join `historial_compras` `h` on((`u`.`id_usuario` = `h`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_total_venta_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vista_total_venta_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_total_venta_por_categoria` AS select `c`.`id_categoria` AS `id_categoria`,`c`.`nombre` AS `nombre_categoria`,count(`dh`.`id_detalle_historial`) AS `total_ventas`,sum((`dh`.`price` * `dh`.`cantidad`)) AS `ingreso_total` from ((`categorias` `c` left join `productos` `p` on((`c`.`id_categoria` = `p`.`id_categoria`))) left join `detalle_historial` `dh` on((`p`.`id_producto` = `dh`.`id_producto`))) group by `c`.`id_categoria`,`c`.`nombre` order by `ingreso_total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-04  7:47:10
