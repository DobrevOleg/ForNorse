-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: norse
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculty` (
  `idfaculty` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `dateCreate` date NOT NULL,
  PRIMARY KEY (`idfaculty`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'ИКС',NULL,'2018-12-02'),(2,'ИБЭИТ',NULL,'2018-12-02');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formstuding`
--

DROP TABLE IF EXISTS `formstuding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `formstuding` (
  `idformstuding` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`idformstuding`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formstuding`
--

LOCK TABLES `formstuding` WRITE;
/*!40000 ALTER TABLE `formstuding` DISABLE KEYS */;
INSERT INTO `formstuding` VALUES (1,'Бюджет'),(2,'Контракт');
/*!40000 ALTER TABLE `formstuding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group` (
  `idgroup` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `idheadman` int(10) unsigned NOT NULL,
  `idfaculty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idgroup`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `idhead_idx` (`idheadman`),
  KEY `idfac_idx` (`idfaculty`),
  CONSTRAINT `idfac` FOREIGN KEY (`idfaculty`) REFERENCES `faculty` (`idfaculty`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idhead` FOREIGN KEY (`idheadman`) REFERENCES `student` (`idstudent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='группа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'АС-161',1,1),(2,'АМ-163',3,1),(3,'АИ-163',4,2);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sciencedegree`
--

DROP TABLE IF EXISTS `sciencedegree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sciencedegree` (
  `idscienceDegree` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`idscienceDegree`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sciencedegree`
--

LOCK TABLES `sciencedegree` WRITE;
/*!40000 ALTER TABLE `sciencedegree` DISABLE KEYS */;
INSERT INTO `sciencedegree` VALUES (1,'доктор наук'),(2,'кандидат наук');
/*!40000 ALTER TABLE `sciencedegree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `speciality` (
  `idspeciality` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`idspeciality`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (1,'Математик'),(2,'Физик'),(3,'Химик');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `idstudent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `avrMark` float unsigned NOT NULL,
  `idFormStuding` int(10) unsigned NOT NULL,
  `idGroup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idstudent`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idFS_idx` (`idFormStuding`),
  KEY `idG_idx` (`idGroup`),
  CONSTRAINT `idFS` FOREIGN KEY (`idFormStuding`) REFERENCES `formstuding` (`idformstuding`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idG` FOREIGN KEY (`idGroup`) REFERENCES `group` (`idgroup`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Ученик';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Олег','Добрев','Юрьевич',19,'g@gmail.com','1999-01-04',11,1,1),(2,'Филипп','Тито','Юрьевич',20,'gі@gmail.com','1998-08-30',8,2,2),(3,'Андрей','Кострубенко','Юрьевич',19,'gврі@gmail.com','1999-03-15',10,1,2),(4,'Константин','Дудковский','Юрьевич',21,'gаврі@gmail.com','1998-04-19',10,1,3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `idteacher` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `idspecialty` int(10) unsigned NOT NULL,
  `idscienceDegree` int(10) unsigned NOT NULL,
  `idfaculty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idteacher`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idF_idx` (`idfaculty`),
  KEY `idSP_idx` (`idspecialty`),
  KEY `idSD_idx` (`idscienceDegree`),
  CONSTRAINT `idF` FOREIGN KEY (`idfaculty`) REFERENCES `faculty` (`idfaculty`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idSD` FOREIGN KEY (`idscienceDegree`) REFERENCES `sciencedegree` (`idsciencedegree`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idSP` FOREIGN KEY (`idspecialty`) REFERENCES `speciality` (`idspeciality`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Преподаватель';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Александр','Пригожев','Сергеевич',37,'prig@gmail.com','1981-07-16',1,1,1),(2,'Евгений','Полин','Леонидович',80,'prаig@gmail.com','1938-04-26',1,1,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachergroup`
--

DROP TABLE IF EXISTS `teachergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachergroup` (
  `idteachergroup` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idgroup` int(10) unsigned NOT NULL,
  `idteacher` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idteachergroup`),
  KEY `idgroup_idx` (`idgroup`),
  KEY `idteacher_idx` (`idteacher`),
  CONSTRAINT `idgroup` FOREIGN KEY (`idgroup`) REFERENCES `group` (`idgroup`),
  CONSTRAINT `idteacher` FOREIGN KEY (`idteacher`) REFERENCES `teacher` (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachergroup`
--

LOCK TABLES `teachergroup` WRITE;
/*!40000 ALTER TABLE `teachergroup` DISABLE KEYS */;
INSERT INTO `teachergroup` VALUES (1,1,1),(2,1,2),(3,2,2);
/*!40000 ALTER TABLE `teachergroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-03  4:27:02
