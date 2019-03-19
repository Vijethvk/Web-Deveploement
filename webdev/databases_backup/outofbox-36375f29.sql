-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: shareddb1e.hosting.stackcp.net    Database: outofbox-36375f29
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
-- Table structure for table `Correct_answer`
--

DROP TABLE IF EXISTS `Correct_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Correct_answer` (
  `qid` int(11) NOT NULL,
  `correct_option` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qid`,`correct_option`),
  CONSTRAINT `q2key` FOREIGN KEY (`qid`) REFERENCES `Questions` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Correct_answer`
--

LOCK TABLES `Correct_answer` WRITE;
/*!40000 ALTER TABLE `Correct_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Correct_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dept_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Computer Science'),('Electrical Engineering'),('Electronics & Communication'),('Info. Science '),('Mechanical Engineering');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`qid`),
  UNIQUE KEY `qid` (`qid`),
  KEY `tckey` (`teacher_id`),
  CONSTRAINT `tckey` FOREIGN KEY (`teacher_id`) REFERENCES `Teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Semester`
--

DROP TABLE IF EXISTS `Semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Semester` (
  `sem` int(11) NOT NULL,
  PRIMARY KEY (`sem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Semester`
--

LOCK TABLES `Semester` WRITE;
/*!40000 ALTER TABLE `Semester` DISABLE KEYS */;
INSERT INTO `Semester` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `Semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sem` int(11) NOT NULL,
  `Password` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `activate` int(11) NOT NULL DEFAULT '0',
  `dept_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `verify` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'aaa',
  PRIMARY KEY (`Student_id`),
  KEY `ddkey` (`dept_name`),
  KEY `skey` (`sem`),
  CONSTRAINT `ddkey` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skey` FOREIGN KEY (`sem`) REFERENCES `Semester` (`sem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('JST1004','Danaerys',1,'dan123','mod@gmail.com',0,0,'Computer Science','aaa'),('JST1005','Jennifer Aniston',7,'jenny123','jenny@gmail.com',1,0,'Computer Science','aaa'),('JST1006','Tony Stark',7,'tony123','tony@gmail.com',1,0,'Computer Science','aaa'),('JST1007','Vin diesel',5,'vin123','vindiesel@gmail.com',1,0,'Computer Science','aaa'),('JST1008','Osama bin laden',1,'osama123','osamabin@gmail.com',1,0,'Computer Science','aaa'),('JST1009','Cardi B',5,'cardi123','cardib@gmail.com',1,0,'Computer Science','aaa');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_answer`
--

DROP TABLE IF EXISTS `Student_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_answer` (
  `Test_id` int(11) NOT NULL,
  `Qid` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  `choice` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  KEY `fkey` (`Student_id`),
  KEY `q1key` (`Qid`),
  KEY `tkey` (`Test_id`),
  CONSTRAINT `q1key` FOREIGN KEY (`Qid`) REFERENCES `Questions` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tkey` FOREIGN KEY (`Test_id`) REFERENCES `Test_details` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_answer`
--

LOCK TABLES `Student_answer` WRITE;
/*!40000 ALTER TABLE `Student_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_result`
--

DROP TABLE IF EXISTS `Student_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_result` (
  `sid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `test_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `total_q_ansd` int(11) NOT NULL,
  `total_qs` int(11) NOT NULL,
  `marks_obt` int(11) NOT NULL,
  `max_marks` int(11) NOT NULL,
  KEY `ssskey` (`sid`),
  KEY `tttkey` (`test_id`),
  CONSTRAINT `ssskey` FOREIGN KEY (`sid`) REFERENCES `Student` (`Student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tttkey` FOREIGN KEY (`test_id`) REFERENCES `Test_details` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_result`
--

LOCK TABLES `Student_result` WRITE;
/*!40000 ALTER TABLE `Student_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subjects` (
  `Sub_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Sub_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sem` int(11) NOT NULL,
  `dept_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Sub_code`),
  UNIQUE KEY `Sub_code` (`Sub_code`),
  KEY `dkey` (`dept_name`),
  KEY `sskey` (`sem`),
  CONSTRAINT `dkey` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sskey` FOREIGN KEY (`sem`) REFERENCES `Semester` (`sem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES ('CS110','Discrete Maths',1,'Computer Science'),('CS120','ANSI C',1,'Computer Science'),('CS130','Prog. in C++',1,'Computer Science'),('CS210','Data Structures',2,'Computer Science'),('CS220','Maths 2',2,'Computer Science'),('CS230','Intro to python',2,'Computer Science'),('CS310','Operating systems',3,'Computer Science'),('CS320','Maths 3',3,'Computer Science'),('CS330','Computer Org',3,'Computer Science'),('CS410','Algorithms',4,'Computer Science'),('CS420','Maths 4',4,'Computer Science'),('CS430','Microprocessors',4,'Computer Science'),('CS510','DBMS',5,'Computer Science'),('CS520','Linear algebra',5,'Computer Science'),('CS530','Unix sys. prog.',5,'Computer Science'),('CS610','Data mining',6,'Computer Science'),('CS620','Computer networks',6,'Computer Science'),('CS630','Neural nets',6,'Computer Science'),('CS710','Computer Arch.',7,'Computer Science'),('CS720','Hadoop',7,'Computer Science'),('CS730','Probability',7,'Computer Science'),('CS810','Cloud computing',8,'Computer Science'),('CS820','IOT',8,'Computer Science'),('CS830','NLP',8,'Computer Science');
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3008 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES (3002,'anil123','Anil Kumar','anil@gmail.com',0),(3003,'ashrihta123','Ashritha R Murthy','ashritha@gmail.com',1),(3004,'sheela123','Sheela','sheela@gmail.com',1),(3005,'vani123','Vani Ashok','vani@gmail.com',1);
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test_details`
--

DROP TABLE IF EXISTS `Test_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test_details` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `Sub_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `test_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `tag` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `total_marks` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tid` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '1',
  `total_questions` int(11) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `Sub_code` (`Sub_code`),
  CONSTRAINT `Test_details_ibfk_1` FOREIGN KEY (`Sub_code`) REFERENCES `Subjects` (`Sub_code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test_details`
--

LOCK TABLES `Test_details` WRITE;
/*!40000 ALTER TABLE `Test_details` DISABLE KEYS */;
INSERT INTO `Test_details` VALUES (25,'CS510','data structures',5,'UI',6,'OPO',3001,0,1,1);
/*!40000 ALTER TABLE `Test_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `userid` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin2468','369admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handles`
--

DROP TABLE IF EXISTS `handles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handles` (
  `tid` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `sub_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tid`,`sem`,`sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handles`
--

LOCK TABLES `handles` WRITE;
/*!40000 ALTER TABLE `handles` DISABLE KEYS */;
/*!40000 ALTER TABLE `handles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_table`
--

DROP TABLE IF EXISTS `option_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_table` (
  `qid` int(11) NOT NULL,
  `option_value` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `option_number` int(11) NOT NULL,
  PRIMARY KEY (`qid`,`option_value`),
  CONSTRAINT `okey` FOREIGN KEY (`qid`) REFERENCES `Questions` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_table`
--

LOCK TABLES `option_table` WRITE;
/*!40000 ALTER TABLE `option_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'outofbox-36375f29'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-18 17:10:52
