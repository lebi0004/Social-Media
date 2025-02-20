-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cst8257project
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessibility`
--

DROP TABLE IF EXISTS `accessibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibility` (
  `Accessibility_Code` varchar(16) NOT NULL,
  `Description` varchar(128) NOT NULL,
  PRIMARY KEY (`Accessibility_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessibility`
--

LOCK TABLES `accessibility` WRITE;
/*!40000 ALTER TABLE `accessibility` DISABLE KEYS */;
INSERT INTO `accessibility` VALUES ('private','Accessible only by the owner '),('shared','Accessible by the owner and friends');
/*!40000 ALTER TABLE `accessibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `Album_Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `Owner_Id` varchar(16) NOT NULL,
  `Accessibility_Code` varchar(16) NOT NULL,
  PRIMARY KEY (`Album_Id`),
  KEY `Owner` (`Owner_Id`),
  KEY `Accessibility` (`Accessibility_Code`),
  CONSTRAINT `Album_Accessibility_FK` FOREIGN KEY (`Accessibility_Code`) REFERENCES `accessibility` (`Accessibility_Code`),
  CONSTRAINT `Album_User_FK` FOREIGN KEY (`Owner_Id`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (12,'Test Album','This is a test description','1','private'),(14,'Toronto','Great city!','1','private'),(15,'Vancouver','WOW!','1','shared'),(16,'Mexico','Fantastic!','1','shared'),(17,'New York','Great!','1','private'),(24,'Trip to Toronto','comment 2','2','shared'),(25,'New Year','comment 3','2','shared'),(26,'Hello','comment 4','2','private'),(27,'Ho-ho-ho','comment 5','2','private'),(29,'Montreal','comment 7','1','private'),(30,'new album','comment1','3','shared');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `Comment_Id` int NOT NULL AUTO_INCREMENT,
  `Author_Id` varchar(16) NOT NULL,
  `Picture_Id` int NOT NULL,
  `Comment_Text` varchar(3000) NOT NULL,
  PRIMARY KEY (`Comment_Id`),
  KEY `Author_Index` (`Author_Id`),
  KEY `Comment_Picture_Index` (`Picture_Id`),
  CONSTRAINT `Comment_Picture_FK` FOREIGN KEY (`Picture_Id`) REFERENCES `picture` (`Picture_Id`),
  CONSTRAINT `Comment_User_FK` FOREIGN KEY (`Author_Id`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `Friend_RequesterId` varchar(16) NOT NULL,
  `Friend_RequesteeId` varchar(16) NOT NULL,
  `Status` varchar(16) NOT NULL,
  PRIMARY KEY (`Friend_RequesterId`,`Friend_RequesteeId`),
  KEY `FriendShip_Student_FK2` (`Friend_RequesteeId`),
  KEY `Status` (`Status`),
  CONSTRAINT `Friendship_Status_FK` FOREIGN KEY (`Status`) REFERENCES `friendshipstatus` (`Status_Code`),
  CONSTRAINT `FriendShip_User_FK1` FOREIGN KEY (`Friend_RequesterId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `FriendShip_User_FK2` FOREIGN KEY (`Friend_RequesteeId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendshipstatus`
--

DROP TABLE IF EXISTS `friendshipstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendshipstatus` (
  `Status_Code` varchar(16) NOT NULL,
  `Description` varchar(120) NOT NULL,
  PRIMARY KEY (`Status_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendshipstatus`
--

LOCK TABLES `friendshipstatus` WRITE;
/*!40000 ALTER TABLE `friendshipstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendshipstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picture` (
  `Picture_Id` int NOT NULL AUTO_INCREMENT,
  `Album_Id` int NOT NULL,
  `File_Name` varchar(256) NOT NULL,
  `Title` varchar(256) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`Picture_Id`),
  KEY `Album_Id_Index` (`Album_Id`),
  CONSTRAINT `Picture_Album_FK` FOREIGN KEY (`Album_Id`) REFERENCES `album` (`Album_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserId` varchar(16) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Phone` varchar(16) NOT NULL,
  `Password` varchar(256) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','Wei1','613-613-6133','$2y$10$8XLAGd3sUey5pJsq3aNRa.yaF9prcdCXnkwps0uecHZphVxEZZDsS'),('2','Wei2','613-613-6133','$2y$10$3q17Zgx2acYUhbGDEg44nuxP3.n/wEuvAp7IBtU9eaupp9AiuObyu'),('3','Wei3','613-613-6133','$2y$10$JIcO/l2NkrxYXp.v28UMPuGa.E9ujtajRzkbq6pA//k84mqY8HusW');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 19:05:34
