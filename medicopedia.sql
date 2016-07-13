-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema medicopedia
--

CREATE DATABASE IF NOT EXISTS medicopedia;
USE medicopedia;

--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dpart_id` int(10) unsigned NOT NULL auto_increment,
  `dpart_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`dpart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dpart_id`,`dpart_name`) VALUES 
 (1,'IT');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `userid` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` bigint(20) unsigned NOT NULL,
  `password` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `experience` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `dpart_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`userid`),
  KEY `FK_doctor_1` (`dpart_id`),
  CONSTRAINT `FK_doctor_1` FOREIGN KEY (`dpart_id`) REFERENCES `department` (`dpart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`userid`,`name`,`email`,`contact`,`password`,`sex`,`address`,`experience`,`qualification`,`dpart_id`) VALUES 
 ('test','test','test@a',123,'test','male','test','test','test',1),
 ('test1','test','test@s',1332,'test1234','male','test','test','test',1);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `userid` varchar(20) NOT NULL,
  `userpass` varchar(45) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`userid`,`userpass`,`usertype`,`status`) VALUES 
 ('satish','satish2212','patient','true'),
 ('shubh','shubh','admin','true'),
 ('test','test','doctor','true'),
 ('test1','test1234','doctor','false');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `userid` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `contact` bigint(20) unsigned NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` (`userid`,`name`,`address`,`sex`,`age`,`contact`,`password`,`email`) VALUES 
 ('satish','satish','lucknow, up','male','21',123456789,'satish2212','satish@gmail.com');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;


--
-- Definition of table `query`
--

DROP TABLE IF EXISTS `query`;
CREATE TABLE `query` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `senderid` varchar(45) NOT NULL,
  `receiverid` varchar(45) NOT NULL,
  `problem` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `sstatus` varchar(45) NOT NULL,
  `solution` varchar(200) default NULL,
  `rcd` varchar(45) default NULL,
  `snd` varchar(45) default NULL,
  PRIMARY KEY  (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `query`
--

/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` (`qid`,`senderid`,`receiverid`,`problem`,`description`,`date`,`sstatus`,`solution`,`rcd`,`snd`) VALUES 
 (1,'satish','test','TEST','TEST','2016-06-21 00:00:00','true','TEST','false','false');
/*!40000 ALTER TABLE `query` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
