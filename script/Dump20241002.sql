CREATE DATABASE  IF NOT EXISTS `musicas` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `musicas`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musicas
-- ------------------------------------------------------
-- Server version	5.5.5-10.10.2-MariaDB

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `artista_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc8favfkg1kcjawobntfun0ndy` (`artista_id`),
  CONSTRAINT `FKc8favfkg1kcjawobntfun0ndy` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genero_musical` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartilhamento`
--

DROP TABLE IF EXISTS `compartilhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compartilhamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `compartilhado_por_id` bigint(20) DEFAULT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `recebido_por_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbx4s5jsd1rf7l922xswdfarst` (`compartilhado_por_id`),
  KEY `FKgxin3c3smw7pqajes6xmdon4q` (`playlist_id`),
  KEY `FK2h4eimevpf8y43dnbi542tw5n` (`recebido_por_id`),
  CONSTRAINT `FK2h4eimevpf8y43dnbi542tw5n` FOREIGN KEY (`recebido_por_id`) REFERENCES `conta` (`id`),
  CONSTRAINT `FKbx4s5jsd1rf7l922xswdfarst` FOREIGN KEY (`compartilhado_por_id`) REFERENCES `conta` (`id`),
  CONSTRAINT `FKgxin3c3smw7pqajes6xmdon4q` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartilhamento`
--

LOCK TABLES `compartilhamento` WRITE;
/*!40000 ALTER TABLE `compartilhamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `compartilhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKtgtgthemxloxpudkwxy14qnbw` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duracao` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `artista_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqc7nayr65xaoxxcxw5nliassj` (`album_id`),
  KEY `FKitfydyjqd7t94nuy82xi3hfi0` (`artista_id`),
  CONSTRAINT `FKitfydyjqd7t94nuy82xi3hfi0` FOREIGN KEY (`artista_id`) REFERENCES `artista` (`id`),
  CONSTRAINT `FKqc7nayr65xaoxxcxw5nliassj` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomemusuario` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `conta_id` bigint(20) DEFAULT NULL,
  `plano_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK47su600vwj56q21xtsc9keic2` (`nomemusuario`),
  KEY `FKmlakvnrgl8p48un68tsjk5d85` (`conta_id`),
  KEY `FK6sge24vgclpgpkjt3hwb1fgws` (`plano_id`),
  CONSTRAINT `FK6sge24vgclpgpkjt3hwb1fgws` FOREIGN KEY (`plano_id`) REFERENCES `plano` (`id`),
  CONSTRAINT `FKmlakvnrgl8p48un68tsjk5d85` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plano` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `perfil_dono_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKvlsf6og61ej1xx8ch4jufvf7` (`perfil_dono_id`),
  CONSTRAINT `FKvlsf6og61ej1xx8ch4jufvf7` FOREIGN KEY (`perfil_dono_id`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_musicas`
--

DROP TABLE IF EXISTS `playlist_musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_musicas` (
  `playlist_id` bigint(20) NOT NULL,
  `musicas_id` bigint(20) NOT NULL,
  KEY `FKlddo8agrasin8b0i57v5q7mst` (`musicas_id`),
  KEY `FKifo9j6gd4p2carxtqsn2ys860` (`playlist_id`),
  CONSTRAINT `FKifo9j6gd4p2carxtqsn2ys860` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  CONSTRAINT `FKlddo8agrasin8b0i57v5q7mst` FOREIGN KEY (`musicas_id`) REFERENCES `musica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_musicas`
--

LOCK TABLES `playlist_musicas` WRITE;
/*!40000 ALTER TABLE `playlist_musicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_perfil_ouvinte`
--

DROP TABLE IF EXISTS `playlist_perfil_ouvinte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_perfil_ouvinte` (
  `playlist_id` bigint(20) NOT NULL,
  `perfil_ouvinte_id` bigint(20) NOT NULL,
  KEY `FKa8g39ifrsorbufgwbw1ojvqg` (`perfil_ouvinte_id`),
  KEY `FK8kxc0l0ta32s9x78s599na6up` (`playlist_id`),
  CONSTRAINT `FK8kxc0l0ta32s9x78s599na6up` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  CONSTRAINT `FKa8g39ifrsorbufgwbw1ojvqg` FOREIGN KEY (`perfil_ouvinte_id`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_perfil_ouvinte`
--

LOCK TABLES `playlist_perfil_ouvinte` WRITE;
/*!40000 ALTER TABLE `playlist_perfil_ouvinte` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_perfil_ouvinte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'musicas'
--

--
-- Dumping routines for database 'musicas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 21:13:06
