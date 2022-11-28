CREATE DATABASE  IF NOT EXISTS `bd_iluminadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_iluminadas`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_iluminadas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (1,'Vela','2022-05-12 20:15:00','2022-05-12 20:15:00'),(2,'Caneca','2022-05-12 20:15:00','2022-05-12 20:15:00'),(3,'Sabonete','2022-05-12 20:15:00','2022-05-12 20:15:00'),(4,'Aromatizador','2022-05-12 20:15:00','2022-05-12 20:15:00');
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_images`
--

DROP TABLE IF EXISTS `tbl_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `tblProdutoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblProdutoId` (`tblProdutoId`),
  CONSTRAINT `tbl_images_ibfk_1` FOREIGN KEY (`tblProdutoId`) REFERENCES `tbl_produtos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_images`
--

LOCK TABLES `tbl_images` WRITE;
/*!40000 ALTER TABLE `tbl_images` DISABLE KEYS */;
INSERT INTO `tbl_images` VALUES (1,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252000772_aromatizador.jpg?alt=media&token=9ef8c0e3-9712-4c54-bbde-247904b0cbf2','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252190267_aromatizadormini.jpg?alt=media&token=6221b1f8-7852-4b7a-bd8d-74dfeba636fa','0000-00-00 00:00:00','0000-00-00 00:00:00',2),(3,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252254013_aguasdelencois.jpg?alt=media&token=7a862799-d7ae-4676-9067-bd8814959d32','0000-00-00 00:00:00','0000-00-00 00:00:00',3),(4,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252352970_EscaldaPe.jpg?alt=media&token=9718f2b9-88ca-4b0b-b3e4-d195536a2b0d','0000-00-00 00:00:00','0000-00-00 00:00:00',4),(5,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252403697_KitM%C3%83E.jpg?alt=media&token=3122aabb-f4f1-4790-b4d3-4b8a908baeff','0000-00-00 00:00:00','0000-00-00 00:00:00',5),(6,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252500676_sabonetedeaveia.jpg?alt=media&token=659c3a37-a2c3-48cb-81cc-a644636582c8','0000-00-00 00:00:00','0000-00-00 00:00:00',6),(7,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252560532_sabonetedeargila.jpg?alt=media&token=b33ad489-94ef-4f33-b1fa-ac3cf4550898','0000-00-00 00:00:00','0000-00-00 00:00:00',7),(8,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252656476_sabonetedebarbatimao.jpg?alt=media&token=64533978-6d00-4b6d-8c08-e17e5049c9ed','0000-00-00 00:00:00','0000-00-00 00:00:00',8),(9,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252737969_sabonetedecalendula.jpg?alt=media&token=5b792486-fb66-4d3d-88e2-c00e2aaa30ce','0000-00-00 00:00:00','0000-00-00 00:00:00',9),(10,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252794695_saboneteliquidoP.jpg?alt=media&token=435941f1-32b7-4bfc-8c52-3f3b3514de70','0000-00-00 00:00:00','0000-00-00 00:00:00',10),(11,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252849735_saboneteliquidoG.jpg?alt=media&token=e659e719-07b5-41e8-ad8c-cd21e0b24fd6','0000-00-00 00:00:00','0000-00-00 00:00:00',11),(12,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655252940973_saboneterosas.jpg?alt=media&token=5c75f997-4c9e-4b47-927e-9a028388be76','0000-00-00 00:00:00','0000-00-00 00:00:00',12),(13,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655253003961_sabonetemae.jpg?alt=media&token=bf0e1646-821f-4dd5-b3fd-59d8174f149b','0000-00-00 00:00:00','0000-00-00 00:00:00',13),(14,'https://firebasestorage.googleapis.com/v0/b/tcc-iluminadas.appspot.com/o/1655253064682_sabonetemaracuja.jpg?alt=media&token=3dc0b905-345e-4f3c-93ec-be8769d68693','0000-00-00 00:00:00','0000-00-00 00:00:00',14);
/*!40000 ALTER TABLE `tbl_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produtos`
--

DROP TABLE IF EXISTS `tbl_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_product` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `price_product` decimal(10,0) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `tblCategoriumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblCategoriumId` (`tblCategoriumId`),
  CONSTRAINT `tbl_produtos_ibfk_1` FOREIGN KEY (`tblCategoriumId`) REFERENCES `tbl_categoria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produtos`
--

LOCK TABLES `tbl_produtos` WRITE;
/*!40000 ALTER TABLE `tbl_produtos` DISABLE KEYS */;
INSERT INTO `tbl_produtos` VALUES (1,'Aromatizador','Aromatizador de ambientes-250ml',10,25,'2022-05-12 20:15:00','2022-05-12 20:15:00',4),(2,'Aromatizador Pequeno','Aromatizador de ambientes-30ml',10,12,'2022-05-12 20:15:00','2022-05-12 20:15:00',4),(3,'Água de Lençóis','Aromatizador para o quarto-30ml',10,8,'2022-05-12 20:15:00','2022-05-12 20:15:00',4),(4,'Escalda Pé','Escalda pé relaxante- 70g',10,10,'2022-05-12 20:15:00','2022-05-12 20:15:00',4),(5,'Kit Mãe','Kit com 3 sabonetes nome mãe, sabonete líquido e mini sabonetes',10,45,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(6,'Sabonete de Aveia','Sabonete Artesanal Hidratante de Aveia - 60g',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(7,'Sabonete de Argila','Sabonete Artesanal Hidratante de Argila - 60g',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(8,'Sabonete de Barbatimão','Sabonete Artesanal Hidratante de Barbatimão- 60g',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(9,'Sabonete de Calêndula','Sabonete Artesanal Hidratante de Calêndula - 60g',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(10,'Sabonete Líquido','Sabonete líquido em frasco de vidro 250ml',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(11,'Sabonete Líquido','Sabonete líquido pequeno-40ml',10,7,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(12,'Sabonete Flor','Sabonete Artesanal Hidratante formato flor- 40g',10,10,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(13,'Sabonete Rosas','Sabonete Artesanal Hidratante formato rosas- 90g',10,12,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(14,'Sabonete Mãe coração','Sabonete Artesanal com nome mãe e caixa para presente - 60g',10,15,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(15,'Sabonete Mãe Quadrado','Sabonete Artesanal com nome mãe - 100g',10,15,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(16,'Sabonete Maracujá','Sabonete Artesanal Hidratante de Maracujá - 60g',10,13,'2022-05-12 20:15:00','2022-05-12 20:15:00',3),(17,'Vela 3 Pinos','Vela Aromática com três pavios',10,65,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(18,'Vela Cilíndrica','Vela Aromática cilíndrica pequena',10,30,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(19,'Vela Cilíndrica','Vela Aromática cilíndrica média',10,45,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(20,'Vela Decoupage','Vela Aromática técnica de decoupage',10,35,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(21,'Vela Especiarias','Vela Aromática com especiarias cravo e canela',10,35,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(22,'Vela Flutuante','Vela Aromática flutuante, ideal para piscinas',10,40,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(23,'Vela Pirâmide com nuvem','Vela Aromática pirâmide com detalhe branco',10,50,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(24,'Vela Quadrada com nuvem','Vela Aromática quadrada com detalhe branco',10,50,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(25,'Vela Quadrada','Vela Aromática quadrada',10,50,'2022-05-12 20:15:00','2022-05-12 20:15:00',1),(26,'Caneca Personalizada','Caneca de porcelana personalizada por sublimação - 325 ml',10,30,'2022-05-12 20:15:00','2022-05-12 20:15:00',2),(27,'Caneca Chopp Personalizada','Caneca de chopp jateada personalizada por sublimação - 325 ml',10,55,'2022-05-12 20:15:00','2022-05-12 20:15:00',2),(28,'Caneca Espelhada Personalizada','Caneca espelhada personalizada por sublimação - 325 ml',10,45,'2022-05-12 20:15:00','2022-05-12 20:15:00',2),(29,'Caneca Mágica Personalizada','Caneca termossensível personalizada por sublimação - 325 ml',10,50,'2022-05-12 20:15:00','2022-05-12 20:15:00',2),(30,'Caneca Pinte e lave','Caneca de porcelana personalizada por sublimação - 325 ml',10,30,'2022-05-12 20:15:00','2022-05-12 20:15:00',2);
/*!40000 ALTER TABLE `tbl_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_iluminadas'
--

--
-- Dumping routines for database 'bd_iluminadas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 21:50:48
