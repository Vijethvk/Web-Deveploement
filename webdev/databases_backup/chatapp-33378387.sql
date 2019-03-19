-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: shareddb-i.hosting.stackcp.net    Database: chatapp-33378387
-- ------------------------------------------------------
-- Server version	10.1.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`chat_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (6,4,3,'hello boss','2018-08-11 15:25:17',1),(7,10,10,'check','2018-08-12 04:58:26',1),(8,11,11,'checkout','2018-08-12 05:00:04',1),(9,3,1,'how r you?','2018-08-12 05:05:13',1),(10,3,1,'','2018-08-12 05:05:45',1),(11,1,3,'Hello Vijeth','2018-08-12 09:40:04',1),(12,3,1,'hello','2018-08-12 09:41:39',1),(13,2,1,'hello shivu1','2018-08-12 09:42:10',0),(14,1,2,'hello\n','2018-08-12 09:42:19',0),(15,2,1,'hey','2018-08-12 09:42:52',0),(16,1,2,'hello vijeth\n','2018-08-12 09:43:12',0),(17,3,2,'hello','2018-08-12 09:43:25',1),(18,3,1,'hey','2018-08-12 09:59:56',1),(19,1,3,'Hello Vijeth','2018-08-12 10:00:15',1),(20,2,1,'yess!','2018-08-12 10:28:57',0),(21,1,2,'hi','2018-08-12 10:29:09',0),(22,2,1,'virat','2018-08-12 10:29:43',0),(23,1,2,'hello vijeth\n','2018-08-12 10:30:42',0),(24,2,1,'hello shivu','2018-08-12 10:31:07',0),(25,162122,162123,'Hello steve','2018-08-12 18:18:49',0),(26,162123,162122,'hello elon','2018-08-12 18:19:00',0),(27,162020,162122,'Hi jack\n','2018-08-12 18:24:25',0),(28,162122,162020,'Hi steve','2018-08-12 18:24:40',0),(29,162020,162122,'BVC you suck , ha ha :):):)','2018-08-12 18:25:05',0),(30,162122,162020,'NIN ajji ','2018-08-12 18:25:15',0),(31,162020,162122,'hey I am back','2018-08-12 18:31:17',0),(32,162122,162123,'Hshshhs','2018-08-12 18:35:24',0),(33,162020,162020,'Hi','2018-08-12 19:59:20',1),(34,162020,162020,'Hi','2018-08-12 20:05:13',1),(35,162020,162122,'hi jack','2018-08-12 20:06:18',0),(36,2,1,'Hey Jeetu','2018-08-12 20:08:59',0),(37,1,2,'Hi','2018-08-12 20:09:18',0),(38,2,1,'Wassup','2018-08-12 20:09:27',0),(39,1,2,'Nothing','2018-08-12 20:09:46',0),(40,2,1,'','2018-08-12 20:10:00',0),(41,1,2,'Ffghh','2018-08-12 20:10:49',0),(42,162020,162020,'Hi','2018-08-12 20:12:26',1),(43,162020,162122,'hi suvhash\n','2018-08-12 20:12:35',0),(44,162020,162122,'subhash','2018-08-12 20:12:45',0),(45,162020,162020,'Oyee ','2018-08-12 20:14:08',1),(46,0,0,'','2018-08-12 20:14:08',0),(47,162122,162123,'enla vade','2018-08-12 20:31:11',0),(48,162123,162122,'hi shashank\n','2018-08-12 20:31:23',0),(49,162123,162122,'kjfhkkg','2018-08-12 20:31:51',0),(50,162123,162122,'vvvv','2018-08-12 20:31:56',0),(51,162122,162123,'','2018-08-12 20:32:23',0),(52,162122,162123,'hello maga','2018-08-12 20:32:35',0),(53,162123,162122,'online idya','2018-08-12 20:33:35',0),(54,162122,162123,'hu\n','2018-08-12 20:34:30',0),(55,162123,162122,'okk','2018-08-12 20:34:53',0),(56,162123,162122,'logout agu','2018-08-12 20:35:03',0),(57,162020,162020,'Hi','2018-08-12 20:37:50',1),(58,162122,162123,'Hi','2018-08-12 20:38:49',0),(59,162123,162122,'hello subhash v angadi','2018-08-12 20:39:09',0),(60,162123,162122,'bantu kanla','2018-08-12 20:39:19',0),(61,162123,162122,'banta','2018-08-12 20:39:25',0),(62,162122,162123,'Yooo','2018-08-12 20:39:33',0),(63,162123,162122,'helo goobe','2018-08-12 20:39:36',0),(64,162122,162123,'Lkb helide alla','2018-08-12 20:39:46',0),(65,162123,162122,'hegide','2018-08-12 20:39:51',0),(66,162122,162123,'Aitu aadre incase Sr no Bere adre avru portal barbardu.. Hage madu ','2018-08-12 20:40:21',0),(67,162123,162122,'hu madtini','2018-08-12 20:40:39',0),(68,162123,162122,'in prototype','2018-08-12 20:40:47',0),(69,162122,162123,'Okay Maga ','2018-08-12 20:40:53',0),(70,162123,162122,'bye tolgu','2018-08-12 20:41:17',0),(71,162122,162123,'And chat astu compatible illa... Latest msgs kelage baro haage madoke aglava? ','2018-08-12 20:41:28',0),(72,162123,162122,'hu kano , idu innu prototype','2018-08-12 20:41:47',0),(73,162122,162123,'Bye kano kare bevarsi','2018-08-12 20:41:59',0),(74,162123,162122,'otnalli hegide, innu notification kalsad madbeku','2018-08-12 20:42:13',0),(75,162123,162020,'hi jack, I am elon','2018-08-12 21:41:50',1),(76,162020,162123,'Hello jack , how are you???','2018-08-12 21:42:07',1),(77,162020,162123,'I am fine','2018-08-12 21:42:35',1),(78,162123,162020,'You are funny\n','2018-08-12 21:42:56',1),(79,162020,162123,'Thanks','2018-08-12 21:43:08',1),(80,162123,162020,'How much do you offer for the product','2018-08-12 21:43:40',1),(81,162020,162123,'10000000000000000000000000000','2018-08-12 21:43:48',1),(82,162123,162020,'OK deal','2018-08-12 21:44:02',1),(83,162020,162123,'Where shall we meet.????','2018-08-12 21:44:20',1),(84,162020,162123,'To strike a deal','2018-08-12 21:44:36',1),(85,162020,162123,'Ok see ','2018-08-12 21:46:13',1),(86,162020,162123,'Tommorow 8 in the morning. Near admin block','2018-08-12 21:47:31',1),(87,162123,162020,'Ok let us meet tomorrow.','2018-08-12 21:48:07',1),(88,162020,162123,'Ok then bye','2018-08-12 21:48:18',1),(89,162123,162020,'Bye.....','2018-08-12 21:48:27',1),(90,162020,1,'h','2018-08-13 20:56:19',1),(91,4,1,'i\n','2018-08-13 21:05:54',1),(92,1,2,'Hello Vijeth','2018-08-13 21:22:34',0),(93,1,2,'Wassup','2018-08-13 21:22:54',0),(94,0,0,'','2018-08-13 21:22:54',0),(95,2,1,'hey','2018-08-13 21:23:44',0),(96,1,2,'Reply dude','2018-08-13 21:28:58',0),(97,1,2,'Common','2018-08-13 21:29:24',0),(98,2,1,'hey','2018-08-13 21:33:32',0),(99,1,2,'Hey','2018-08-13 21:36:20',0),(100,1,2,'Ry','2018-08-13 21:36:29',0),(101,1,2,'Fghhvvccvbbhhbvvv','2018-08-13 22:26:34',0),(102,1,2,'Reply mado bvc','2018-08-13 22:46:06',0),(103,1,2,'Mado','2018-08-13 22:46:25',0),(104,162122,162123,'hi nice to meet you again','2018-08-14 16:43:31',0),(105,162123,162122,'bye','2018-08-14 16:43:45',0),(106,2,1,'bvc','2018-08-15 21:53:29',1),(107,2,1,'bega reply mado','2018-08-15 21:53:48',1),(108,162122,162123,'Hi steve','2018-08-23 11:50:25',0),(109,162123,162122,'hi elon','2018-08-23 11:50:52',0),(110,162122,162123,'16','2018-08-23 12:14:31',0),(111,2,1,'Hey','2018-08-23 12:36:23',1),(112,2,1,'Wassup','2018-08-23 12:37:04',1),(113,1,2,'Ducks','2018-08-23 12:40:02',1),(114,162123,162122,'hello steeve\n','2018-08-23 15:59:05',0),(115,162122,162123,'hello steve\n','2018-08-23 15:59:29',0),(116,162123,162122,'Hello steve','2018-08-23 16:10:34',0),(117,162123,162122,'Hello steve','2018-08-23 16:10:58',0),(118,162123,162122,'Hello','2018-08-23 16:11:37',0),(119,162122,162123,'good evening\n','2018-08-24 17:17:37',0),(120,162122,162123,'Uxmal','2018-08-24 17:18:25',0),(121,162122,162123,'Cup','2018-08-24 17:18:55',0),(122,162122,162020,'Good evening','2018-08-24 17:23:58',0),(123,162124,162122,'hello jack','2018-08-26 15:13:57',0),(124,162124,162122,'','2018-08-26 15:13:58',0),(125,162122,162124,'hello steve','2018-08-26 15:14:39',0),(126,162123,162122,'hi elon.','2018-08-27 22:54:52',0),(127,162123,162122,'yhyyh','2018-08-31 09:35:32',0),(128,162123,162122,'hello elon','2018-08-31 09:36:45',0),(129,162122,162123,'hello elon','2018-08-31 09:37:05',0),(130,162123,162122,'hbcjhcjh','2018-08-31 09:40:34',0),(131,162123,162122,'hello\n','2018-08-31 09:44:38',0),(132,162123,162122,'h','2018-08-31 09:45:57',0),(133,162123,162122,'ghjgh','2018-08-31 09:46:16',0),(134,162123,162122,'huuh','2018-08-31 09:49:25',0),(135,162123,162122,'ggg','2018-08-31 09:49:52',0),(136,162123,162122,'gsgs','2018-08-31 09:56:42',0),(137,162122,162123,'hello','2018-08-31 09:58:03',0),(138,162123,162122,'jkfjkg','2018-08-31 10:02:35',0),(139,162123,162122,'g','2018-08-31 10:07:12',0),(140,162122,162123,'hello','2018-08-31 10:08:13',0),(141,162123,162122,'dd','2018-08-31 10:18:04',0),(142,162123,162122,'hj','2018-08-31 10:20:09',0),(143,162123,162122,'dff','2018-08-31 10:22:49',0),(144,162123,162122,'hjjhj','2018-08-31 10:27:54',0),(145,162123,162122,'jkkj','2018-08-31 10:28:42',0),(146,162123,162122,'jkjkj','2018-08-31 10:34:00',0),(147,162123,162122,'hello','2018-08-31 10:36:01',0),(148,162123,162122,'ggjhjh','2018-08-31 10:37:50',0),(149,162123,162122,'ghgh','2018-08-31 10:39:19',0),(150,162123,162122,'hello elon','2018-09-06 00:42:02',0),(151,162122,162123,'hello steve\n','2018-09-06 00:42:21',0),(152,162123,162122,'I will sell the product to you','2018-09-06 00:43:01',0),(153,162122,162123,'cool, bye','2018-09-06 00:43:10',0),(154,162123,162122,'bye','2018-09-06 00:43:14',0),(155,162122,162123,'hey','2018-09-09 12:04:17',0),(156,162123,162122,'hey','2018-09-09 17:05:12',1),(157,162122,162124,'hello steve','2018-09-09 17:39:55',0),(158,162122,162124,'hey jack','2018-09-09 17:42:44',1);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummy`
--

DROP TABLE IF EXISTS `dummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dummy` (
  `user_id` text NOT NULL,
  `custid` int(11) NOT NULL,
  `hash1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummy`
--

LOCK TABLES `dummy` WRITE;
/*!40000 ALTER TABLE `dummy` DISABLE KEYS */;
INSERT INTO `dummy` VALUES ('1234',123,''),('142',566,''),('162122',162124,''),('162122',162124,''),('0',0,''),('0',0,''),('$2b$10$yGJPHSMbwP49Jz07UUtbduuUdyNhqARsb2QikoN0MEmtTK9H5Qbmu',0,''),('$2b$10$wcHQFulnUqDlufGiUyiffugPllgOdURNNEawmDy3eWYvsN25ztnzy',162122,''),('$2b$10$XftJj6mVbc4NfKQ4ZtGyvO55LX.unF6jHyHuXEeL8ngBEBk1e.nB2',162122,''),('$2b$10$XftJj6mVbc4NfKQ4ZtGyvO55LX.unF6jHyHuXEeL8ngBEBk1e.nB2',162122,''),('$2b$10$XftJj6mVbc4NfKQ4ZtGyvO55LX.unF6jHyHuXEeL8ngBEBk1e.nB2',162122,''),('$2b$10$dMNKijjLSWq9v/h3VSGU6ua6s3Q6RW.p7dPuTLH2oxncOEpQVp/Km',162122,''),('$2b$10$dMNKijjLSWq9v/h3VSGU6ua6s3Q6RW.p7dPuTLH2oxncOEpQVp/Km',162122,''),('$2b$10$aRp9LxTLmLAUuFsShxvr7OwUseulbxa3u5h.OL.TYW.ybdwHnjWQq',162122,''),('$2b$10$ahpHFGJsl7TlrM3NKZVJduXl0srvMxMtkqxTYySwi2pi9mcH.cak.',162122,''),('$2b$10$PpMQ.E6C3iuksW5JkqG5uOcRsNObl3U9iSjN6SbfHCFeJ7FCr.UaS',162122,''),('$2b$10$PpMQ.E6C3iuksW5JkqG5uOcRsNObl3U9iSjN6SbfHCFeJ7FCr.UaS',162122,''),('$2b$10$7lk0INzsGK6fTsMr5SSAfuobcWZ6O52DobtWxLZv7m7R0/vjDEg/C',162123,''),('$2b$10$k7jFs8oZkoduSawz61DAAeCoRkt0aQMTC0sD8apJ7l0pma4GgwOk6',162123,'');
/*!40000 ALTER TABLE `dummy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'vijethvk11@','vijethvk11@','',0),(2,'shivu','shivu','',0),(4,'xyz','xyz','',0),(123,'njj','1234','vh@gmail.com',0),(1233,'jkdjgkjgk','klklklk','fff@ggg.com',0),(1234,'ghghg','jkjdf','vi@gmi.com',0),(162097,'jeetu','jeetu','',0),(162112,'jack','162112','jack@g.com',162122),(162122,'steve','162122','steve@de.com',162124),(162123,'elon','162123','',162122),(162124,'jack','162124','shivshankar.hc@gmail.com',162122),(162125,'ghghg','kjkjkjjk','jhj@g.com',162122),(162129,'efwefef','wfwefwfw','vijethv@gmail.comm',0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_type` enum('no','yes') NOT NULL,
  PRIMARY KEY (`login_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,162122,'2018-09-09 15:02:58','no'),(2,162122,'2018-09-09 10:55:16','no'),(3,162122,'2018-09-09 10:55:50','no'),(4,162122,'2018-09-09 15:31:51','no'),(5,162122,'2018-09-09 11:02:34','no'),(6,162122,'2018-09-09 15:34:28','no'),(7,162122,'2018-09-09 15:35:07','no'),(8,162122,'2018-09-09 16:37:03','no'),(9,162122,'2018-09-09 16:43:41','no'),(10,162122,'2018-09-09 16:59:16','no'),(11,162122,'2018-09-09 17:03:01','no'),(12,162123,'2018-09-09 17:02:21','no'),(13,162122,'2018-09-09 17:11:21','no'),(14,162123,'2018-09-09 17:05:20','no'),(15,162122,'2018-09-09 17:23:32','no'),(16,162122,'2018-09-09 17:12:27','no'),(17,162112,'2018-09-09 17:13:51','no'),(18,162112,'2018-09-09 17:14:54','no'),(19,162112,'2018-09-09 17:15:05','no'),(20,162122,'2018-09-09 17:16:48','no'),(21,0,'2018-09-09 12:57:34','no'),(22,162112,'2018-09-09 17:30:30','no'),(23,0,'2018-09-09 17:31:55','no'),(24,162112,'2018-09-09 17:32:28','no'),(25,0,'2018-09-09 17:40:46','no'),(26,162122,'2018-09-09 17:39:12','no'),(27,162122,'2018-09-09 17:41:55','no'),(28,162124,'2018-09-09 18:56:21','no'),(29,162122,'2018-09-09 17:45:53','no'),(30,162123,'2018-09-09 17:54:19','no'),(31,162122,'2018-09-10 00:15:39','no'),(32,162122,'2018-09-10 00:19:33','no'),(33,162123,'2018-09-10 00:20:15','no'),(34,162123,'2018-09-10 00:21:40','no'),(35,162124,'2018-09-10 00:30:35','no'),(36,0,'2018-09-10 01:16:24','no'),(37,0,'2018-09-10 01:18:04','no'),(38,162125,'2018-09-10 01:19:27','no'),(39,162122,'2018-09-10 12:07:18','no'),(40,162123,'2018-09-10 12:08:04','no'),(41,162122,'2018-09-10 12:09:20','no'),(42,162124,'2018-09-10 12:10:34','no'),(43,162123,'2018-09-10 12:13:34','no'),(44,162123,'2018-09-10 12:13:29','no'),(45,162122,'2018-09-10 12:14:55','no'),(46,162122,'2018-09-10 12:18:32','no'),(47,162122,'2018-09-10 12:29:04','no'),(48,162123,'2018-09-11 16:16:18','no'),(49,162123,'2018-09-12 14:23:42','no'),(50,162122,'2018-09-12 13:59:25','no'),(51,162122,'2018-09-12 14:08:29','no'),(52,162123,'2018-09-12 14:25:16','no'),(53,162122,'2018-09-12 14:53:22','no'),(54,162122,'2018-09-12 14:53:31','no'),(55,162122,'2018-09-12 14:54:11','no'),(56,162123,'2018-09-12 14:54:50','no'),(57,162122,'2018-09-12 15:06:46','no'),(58,162122,'2018-09-12 15:16:45','no'),(59,162125,'2018-09-12 15:24:05','no'),(60,162123,'2018-09-12 15:38:47','no'),(61,162122,'2018-09-20 22:04:12','no'),(62,162122,'2018-09-20 22:11:25','no'),(63,162123,'2018-09-20 22:07:17','no'),(64,162123,'2018-09-20 22:08:21','no'),(65,162122,'2018-09-20 22:14:14','no'),(66,162122,'2018-09-20 22:51:39','no'),(67,162122,'2018-10-09 13:28:58','no'),(68,162122,'2018-10-09 16:05:52','no'),(69,162123,'2018-10-09 16:08:23','no'),(70,162123,'2018-11-01 17:06:08','no');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'chatapp-33378387'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 17:10:49
