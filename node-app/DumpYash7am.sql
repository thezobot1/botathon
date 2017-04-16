-- MySQL dump 10.13  Distrib 5.7.13, for osx10.11 (x86_64)
--
-- Host: localhost    Database: chatapp
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `bus_timings`
--

DROP TABLE IF EXISTS `bus_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_timings` (
  `going_to` varchar(30) DEFAULT NULL,
  `coming_from` varchar(30) DEFAULT NULL,
  `timing` time DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_timings`
--

LOCK TABLES `bus_timings` WRITE;
/*!40000 ALTER TABLE `bus_timings` DISABLE KEYS */;
INSERT INTO `bus_timings` VALUES ('Guwahati','City','07:45:00','N\r'),('Guwahati','City','07:45:00','N\r'),('Guwahati','City','07:45:00','N\r'),('Guwahati','City','08:15:00','N\r'),('Guwahati','City','09:00:00','F\r'),('Guwahati','City','10:00:00','N\r'),('Guwahati','City','12:00:00','N\r'),('Guwahati','City','13:00:00','N\r'),('Guwahati','City','14:00:00','N\r'),('Guwahati','City','14:30:00','F\r'),('Guwahati','City','15:00:00','N\r'),('Guwahati','City','16:00:00','N\r'),('Guwahati','City','17:15:00','N\r'),('Guwahati','City','18:45:00','N\r'),('Guwahati','City','19:30:00','N\r'),('Guwahati','City','20:00:00','N\r'),('Guwahati','City','20:30:00','N\r'),('Guwahati','City','20:45:00','F\r'),('Guwahati','City','20:55:00','N\r'),('City','Guwahati','08:00:00','N\r'),('City','Guwahati','09:00:00','N\r'),('City','Guwahati','10:00:00','N\r'),('City','Guwahati','11:00:00','N\r'),('City','Guwahati','12:00:00','N\r'),('City','Guwahati','13:00:00','N\r'),('City','Guwahati','14:00:00','N\r'),('City','Guwahati','15:00:00','N\r'),('City','Guwahati','17:00:00','N\r'),('City','Guwahati','17:15:00','N\r'),('City','Guwahati','17:40:00','N\r'),('City','Guwahati','18:45:00','N\r'),('City','Guwahati','20:00:00','N\r'),('City','Guwahati','20:40:00','N\r'),('City','Guwahati','21:00:00','N\r'),('City','Guwahati','21:15:00','N\r'),('City','Guwahati','21:30:00','N\r'),('City','Guwahati','21:35:00','N\r'),('Guwahati','City','06:45:00','H\r'),('Guwahati','City','07:45:00','H\r'),('Guwahati','City','08:15:00','H\r'),('Guwahati','City','10:00:00','H\r'),('Guwahati','City','11:00:00','H\r'),('Guwahati','City','13:00:00','H\r'),('Guwahati','City','14:00:00','H\r'),('Guwahati','City','15:00:00','H\r'),('Guwahati','City','16:00:00','H\r'),('Guwahati','City','17:00:00','H\r'),('Guwahati','City','18:00:00','H\r'),('Guwahati','City','18:30:00','H\r'),('Guwahati','City','19:15:00','H\r'),('Guwahati','City','20:00:00','H\r'),('Guwahati','City','20:30:00','H\r'),('Guwahati','City','20:45:00','H\r'),('Guwahati','City','20:55:00','H\r'),('Guwahati','City','21:00:00','H\r'),('City','Guwahati','08:00:00','H\r'),('City','Guwahati','09:00:00','H\r'),('City','Guwahati','10:00:00','H\r'),('City','Guwahati','10:30:00','H\r'),('City','Guwahati','12:00:00','H\r'),('City','Guwahati','13:00:00','H\r'),('City','Guwahati','14:00:00','H\r'),('City','Guwahati','15:00:00','H\r'),('City','Guwahati','15:30:00','H\r'),('City','Guwahati','16:00:00','H\r'),('City','Guwahati','17:00:00','H\r'),('City','Guwahati','17:40:00','H\r'),('City','Guwahati','18:45:00','H\r'),('City','Guwahati','20:00:00','H\r'),('City','Guwahati','20:40:00','H\r'),('City','Guwahati','21:00:00','H\r'),('City','Guwahati','21:15:00','H\r'),('City','Guwahati','21:30:00','H\r');
/*!40000 ALTER TABLE `bus_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `name` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `ltpc` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `textbooks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('﻿Chemistry','FY',1,'CH 101','3-1-0-6','\"Structure and Bonding; Origin of quantum theory, postulates of quantum mechanics; Schrodinger wave equation: operators and observables, superposition theorem and expectation values, solutions for par','\"P. W. Atkins, Physical Chemistry\"\r'),('Intoduction to Compu','FY',1,'CS 101','3-1-0-8','\"Introduction: The von Neumann architecture, machine language, assembly language, high level programming languages, compiler, interpreter, loader, linker, text editors, operating systems, flowchart; B','\"A Kelly and I Pohl, A Book on C\"\r'),('Maths - II','FY',1,'MA 102','3-1-0-8','\"Vector functions of one variable – continuity and differentiability; functions of several variables – continuity, partial derivatives, directional derivatives, gradient, differentiability, chain rule','\" S. L. Ross, Differential Equations\"\r'),('Physics-II','FY',2,'PH 102','2-1-0-6','\"Vector Calculus: Gradient, Divergence and Curl, Line, Surface, and Volume integrals, Gauss\'s divergence theorem and Stokes\' theorem in Cartesian, Spherical polar, and Cylindrical polar coordinates, D','\"D. J. Griffiths, Introduction to Electrodynamics\"\r'),('Basic Electronics La','FY',2,'EE 102','0-0-3-3','\"Experiments using diodes and bipolar junction transistor (BJT): design and analysis of half -wave and full-wave rectifiers, clipping circuits and Zener regulators, BJT characteristics and BJT amplifi','\"A. P. Malvino, Electronic Principles, Tata McGraw-Hill\"\r'),('Probability and Rand','EE',4,'EE 221','3-1-0-8','\"Introduction to probability: mathematical background - sets, set operations, sigma and Borel fields; classical, relative-frequency and axiomatic definitions of probability; conditional probability, i','\" A. L. Garcia, Probability and Random Processes for Electrical Engineering\"\r'),(' System Software Lab','CS',4,'CS 241','0-0-3-3','\"Overview of Unix system, commands and utilities; Basic Linux administration and installation: grub, rpm, yum, disk partitioning; Basic Linux utilities, logging, backup, authentication; Internet mail ','\"E. Nemeth, G. Snyder and T. R. Hein, Linux Administration Handbook\"\r'),('Theory of Computatio','CS',5,'CS 301','3-0-0-6','\"Models of computation: Turing Machine, RAM, µ-recursive function, grammars; Undecidability: Rice\'s Theorem, Post Correspondence Problem, logical theories; Complexity classes: P, NP,  coNP, EXP, PSPAC','\"M. Sipser, Introduction to the Theory of Computation, Thomson, 2004.\"\r'),('Fluid Mechanics Labo','CL',3,'CL 210 ','0-0-3-3','\"Laboratory experiments on Fluid flow, which include basic experiments on flow through pipes, channels, nozzles, packed beds, pipe-fittings and flow meters, pump test rigs, etc\"','\" R. W. Fox and A. T. McDonald, Introduction to fluid mechanics,\"\r'),(' Thermodynamics Labo','CL',4,'CL 211','0-0-3-3','\"Laboratory experiments on Chemical Engineering Thermodynamics, which include basic experiments on vapor pressure estimation, vapour - liquid equilibrium; liquid - liquid equilibrium; heat of reaction','\"S. I. Sandler, Chemical Engg. Thermodynamics\"\r'),('Lasers and Photonics','PH',7,'PH 415','3-0-0-6','\"optical properties of anisotropic media, wave refractive index, optical activity and Faraday effect, liquid crystals; principles of electro-optics, magneto-optics, photo refractive materials, acousto','\"W. T. Silfvast, Laser Fundamentals, 2nd Ed., Cambridge University Press\"\r'),('Electromagnetics','PH',3,'PH 202','3-0-0-6','\"Electrostatics: Green function, Dirichlet and Neumann boundary conditions, Green function for the sphere.  Laplace Equation:  Separation of variables in spherical and cylindrical coordinates and gene','\"J. D. Jackson, Classical Electrodynamics\"\r'),('Plant Biotechnology','BT',6,'BT 309','3-0-0-6','\"Plant morphogenesis; cellular totipotency; in vitro culture; protoplast isolation and culture; somatic hybridization; haploid and triploid production; somaclonal variation; embryo rescue and syntheti','\"A. Slater, N. Scott and M. Fowler, Plant Biotechnology: The genetic manipulation of plants\"\r'),('Introduction To Psyc','',0,'HS 106','3-0-0-6','\"The nature and history of psychology; Methods of psychology; Perceptual processes: Attention; Constancies and Illusion; Psychophysics - Classical Psychophysics & Signal Detectability; Learning: Thorn','\"E. R. Hilgard, R. C. Atkinsorl and R. L. Atkinson, Introduction to Psychology\"\r');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restros`
--

DROP TABLE IF EXISTS `restros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restros` (
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `timings` varchar(80) DEFAULT NULL,
  `cuisine` varchar(80) DEFAULT NULL,
  `keywords` varchar(80) DEFAULT NULL,
  `delivery` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restros`
--

LOCK TABLES `restros` WRITE;
/*!40000 ALTER TABLE `restros` DISABLE KEYS */;
INSERT INTO `restros` VALUES ('﻿FODDIES WORLD','FOOD COURT,BEHIND NEW SAC','7577984948','11:00-23:00','ITALIAN','PIZZA,PASTA,GARLIC BRAD STICKS,FAST FOOD','YES\r'),('SUBWAY','FOOD COURT,BEHIND NEW SAC','9085014747','12:00 - 23:00','SUB,COOKIES','SANDWICH,SUBMARINE,HEALTHY,VEGETABLES,FAST FOOD','NO\r'),('BASKIN ROBINS,BR','FOOD COURT,BEHIND NEW SAC','7577057560','11:00 to 22:30','ICE CREAMS,SUNDAE','ICE CREAM,SUNDAE,SWEETS','NO\r'),('MANIKANTA','FOOD COURT,BEHIND NEW SAC','7403456234','10:00 - 21:00','SOUTH INDIAN','IDLI,SAMBHAR,VADA,DOSA','NO\r'),('SILVER DINE','MARKET COMPLEX ','7086048193','11:00 to 23:00','NORTH INDIAN ,CHINESE','NORTH INDIAN ,CHINESE ,CONTENENTIAL,MULTICUISINE,RESTAURANTS','YES\r'),('VINAIGRETTE','NEAR CORE 3 ','8452398756','ALWAYS OPEN','NORTH INDIAN ,CHINESE','GOOD CHEAP FOOD,RESTAURANTS','YES\r'),('CCD,CAFE COFFEE DAY','INSIDE LIBRARY BUILDING','9928176432','10:00 - 23:00','COFFEE,SHAKES','BROWNIE,SHAKES,COFFEE,SNACKS','NO\r');
/*!40000 ALTER TABLE `restros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `dept` varchar(3) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES ('﻿EE','MA201','2017-05-01 00:00:00',3),('EE','EE201','2017-05-02 00:00:00',3),('EE','EE220','2017-05-03 00:00:00',3),('EE','HS21','2017-05-04 00:00:00',3),('EE','EE202','2017-05-05 00:00:00',3),('EE','EE203','2017-04-29 00:00:00',4),('EE','EE230','2017-05-01 00:00:00',4),('EE','EE270','2017-05-02 00:00:00',4),('EE','EE221','2017-04-30 00:00:00',4),('EE','HS220','2017-05-03 00:00:00',4),('CL','MA201','2017-05-01 00:00:00',3),('CL','HS210','2017-05-04 00:00:00',3),('CL','CL201','2017-05-02 00:00:00',3),('CL','CL202','2017-05-03 00:00:00',3),('CL','CL203','2017-05-05 00:00:00',3),('CL','ME212','2017-05-06 00:00:00',3),('CL','CL204','2017-04-29 00:00:00',4),('CL','CL205','0000-00-00 00:00:00',4),('CL','CL206','0000-00-00 00:00:00',4),('CL','CL207','0000-00-00 00:00:00',4),('CL','HS220','0000-00-00 00:00:00',4);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-16  6:47:29
