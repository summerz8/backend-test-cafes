CREATE DATABASE  IF NOT EXISTS `cafes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cafes`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: cafes
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cafes`
--

DROP TABLE IF EXISTS `cafes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafes` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafes`
--

LOCK TABLES `cafes` WRITE;
/*!40000 ALTER TABLE `cafes` DISABLE KEYS */;
INSERT INTO `cafes` VALUES ('Baristas','This cafeteria is your favourite corners of heaven.','https://esquilo.io/png/thumb/pkZzuFU7oj8WJMu-Coffee-Logo-PNG-Transparent-Image.png','Bugis',1,'30ca54ca-626d-11ec-9ad5-21f980956b5a'),('Impresso Espresso','The cafe tables in their rich deep browns, the aroma with its dark aromatic perfume, call me in from the wintry day.','https://www.freepnglogos.com/uploads/coffee-logo-png/estella-revenge-stuff-week-coffee-confections-1.png','Downtown',2,'30ca5952-626d-11ec-9ad5-21f980956b5a'),('The Coffee Club','Cafe tables adorn the sun-kissed grey as if placed there at the tip of an artists brush.','https://www.freepnglogos.com/uploads/coffee-logo-png/coffee-logo-design-creative-idea-logo-elements-2.png','Orchard',3,'30ca5ab0-626d-11ec-9ad5-21f980956b5a'),('Lava Java','The cafeteria released its heavenly aroma with the grace of new spring flower.','https://www.freepnglogos.com/uploads/coffee-logo-png/coffee-food-drink-vector-logo-download-16.png','Orchard',4,'30ca5b82-626d-11ec-9ad5-21f980956b5a'),('Wide Awake Cafe','A coffee house for everyone.','https://www.freepnglogos.com/uploads/coffee-logo-png/coffee-house-creative-logo-vector-download-17.png','East Coast',5,'30ca5c90-626d-11ec-9ad5-21f980956b5a');
/*!40000 ALTER TABLE `cafes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `name` varchar(255) NOT NULL,
  `e_id` int NOT NULL AUTO_INCREMENT,
  `e_uid` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('Tobye',1,'UI75EB044'),('Ben',2,'UI75EB087'),('Heddie',3,'UI75EB097'),('Verney',4,'UI75EB0A2'),('Karia',5,'UI75EB0AC'),('Derrick',6,'UI75EB0B6'),('Theodor',7,'UI75EB0C0'),('Joyann',8,'UI75EB0CF');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `c_id` int NOT NULL,
  `e_id` int NOT NULL,
  `days_worked` smallint NOT NULL,
  PRIMARY KEY (`c_id`,`e_id`),
  UNIQUE KEY `e_id` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (1,1,10),(1,2,1),(2,3,8),(3,4,6),(3,5,1),(4,6,3),(4,7,10),(5,8,5);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-22  1:25:25
