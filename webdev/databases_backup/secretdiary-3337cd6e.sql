-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: shareddb-i.hosting.stackcp.net    Database: secretdiary-3337cd6e
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `verify` text NOT NULL,
  `diary` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (50,'ooo@ac.in','ab8b8014c5beaf29eeff79527801353b','','',0),(51,'aga@ac.in','1920cd312484f97c7c75f1a676d62b98','','',0),(52,'viju@ac.in','1a01c772102f32c7d49eafddbab0a50f','','',0),(53,'qw@ac.in','92509b894fd08124462ca0e6f8d378ce','','',0),(54,'as@ac.in','b0fd8f717ef1c8a7ce7a1f5913e19848','','',0),(55,'df@ac.in','4b0c83077fdacef3fff31da198f50d8d','','',0),(56,'qwerty@ac.in','1f4e38e09d1aaaecf3ab36ea99dcb0fa','','',0),(57,'sss@ac.in','e6614fcf7eb4a9c8bbf71e3d04d779a4','e0275e62817237bcc38ff9f9bdebd2','',0),(59,'you23@gmail.com','you','a2a20bed2043a942dfe10e52b9bfbc','',0),(60,'hello123@gmail.com','3db99a9552c81f3bbb0a4739cab583f8','f2c8115d841b86886d7fe9cdbb8fb9','',0),(62,'xyz@ac.in','496d3c8747cc2c227990727f2dd4113f','c7a62de5ba94e0155859fd59d83021','',0),(63,'test@xyz.com','319d02e5c94add5cc58726de8c27309c','c088fe123e03d968dd12e8b96f1eca','',0),(64,'puduwege@fxprix.com','16970ed7be0037e73fa3b11f6479226f','2ddae93de191d7956d7c3a74f6e854','Hi\nKkh,\nKkk',1),(65,'abc@abc.com','9137b510adac49fe3c9da758ee17aba5','0a036d6aad06dda8b933344a7809b6','',0),(66,'shashanksgowda7@gmail.com','e013c4a6aa2ce48900c23e40f979d852','9844cda43befdf89f44d7c5ddfadf6','',0),(67,'kavyahk001@gmail.com','ba7d040238186b7e6668e8fedd6de762','4a3541306f73083b3d8838ec8eff49','',0),(68,'kavyahk007@gmail.com','56f798960d0148396008b1ae0467d0eb','7c5e7ec24801b3d4328fc210f50895','Loose nanne bakra madbeda..m senior dan u in computer scienceðŸ˜œðŸ˜œðŸ˜œðŸ˜œðŸ˜œ',1),(69,'jithendra.jeetu123@gmail.com','582243ee16d6ce322e05a6bf057086d5','5425789e6f07303c2dc2b9a69f668e','',0),(70,'nihalpradhan10@gmail.com','8a9c394abfe576bd7241c02e0fa7c722','085423da6409b0b8333115c1f99dc8','',0),(71,'vij@gmail.com','501dfa3d3d26d790a75be51a9891aabd','31e04ab63545dafa832bb067bc3ed7','',0),(72,'vijethvk11@gmail.com','b255b3dc4ad0443ad7104c0f0268cd03','fec317e1afd38a658cddf30f377c97','Gsjjwkkdbbdjeidhhdhdgshehgshdvdhejevehdhdhdhdhdhdhdhdvghhvhdhdh',1),(73,'shivshankar.hc@gmail.com','43469e24846301a88ce7a6751859119c','7550f4d4e931a27c0d5698225de4e1','Shhshahahbss\nAnnange\nShhshahahbss\n',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'secretdiary-3337cd6e'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 17:10:48
