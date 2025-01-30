-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_ID` varchar(8) NOT NULL,
  `First_Name` varchar(32) NOT NULL,
  `Last_Name` varchar(32) NOT NULL,
  `Gender` char(3) NOT NULL,
  PRIMARY KEY (`author_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('3614','Jael','Terrell','F'),('3641','Clayton','Gibson','F'),('3756','Guy','Logan','M,'),('3775','Octavius','Brooks','F'),('3802','Ina','Vang','F'),('3823','Joelle','Phelps','F'),('3854','Orla','Vaughan','F'),('4059','Maxwell','Roberts','M,'),('4163','Heather','Cameron','M,'),('4270','Gage','Carrillo','F'),('4279','Vernon','Mayo','F'),('4281','Imelda','Mayo','F'),('4290','Laith','Hutchinson','M,'),('4323','Leslie','Woodward','M,'),('4324','Gil','Alvarado','M,'),('4438','Jerome','Roach','F'),('4485','Lane','Payne','F'),('4504','Kennan','Carney','M,'),('4521','Ima','Flynn','F'),('4532','Callum','Stokes','F'),('4534','Baxter','Butler','F'),('4879','Virginia','Tucker','F'),('4941','Dacey','Chase','F'),('4965','Susan','Booker','F'),('4983','Iris','Lee','M,');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_ID` varchar(12) NOT NULL,
  `book_name` varchar(64) NOT NULL,
  `book_edition` varchar(32) DEFAULT NULL,
  `genre` varchar(16) NOT NULL,
  `copies_available` int NOT NULL,
  `isBorrowed` varchar(6) NOT NULL,
  `author_ID` varchar(8) NOT NULL,
  `publisher_ID` varchar(8) NOT NULL,
  `form_ID` varchar(8) NOT NULL,
  PRIMARY KEY (`book_ID`),
  KEY `author_ID` (`author_ID`),
  KEY `publisher_ID` (`publisher_ID`),
  KEY `form_ID` (`form_ID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_ID`) REFERENCES `author` (`author_ID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_ID`) REFERENCES `publisher` (`publisher_ID`),
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`form_ID`) REFERENCES `form` (`form_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('3128','lorem','2','Romance',0,'Yes','4059','3150','4201'),('3518','vestibulum','3','Action',2,'No','3775','3150','4586'),('3568','sit','1','Drama',3,'No','3756','4158','4203'),('3587','facilisis','2','non-fiction',0,'Yes','3641','4360','4586'),('3632','sollicitudin','1','non-fiction',3,'No','4941','3150','4586'),('3635','rutrum','3','Drama',3,'No','4534','4710','4673'),('3760','interdum','3','Horror',3,'No','3614','4360','4349'),('3893','tincidunt','3','Drama',0,'Yes','4521','4158','4673'),('3998','quam','2','Drama',3,'No','3854','4360','4349'),('4085','amet','3','Romance',3,'No','4290','4158','4349'),('4193','consequat','4','Romance',0,'Yes','4965','4158','4586'),('4300','sodales','1','Educational',3,'No','4983','4710','4673'),('4334','facilisis','3','Educational',0,'Yes','4485','3394','4673'),('4361','a','4','Action',3,'No','4532','3150','4349'),('4364','non','2','Horror',0,'Yes','4504','4158','4203'),('4484','arcu','4','Drama',0,'Yes','4279','4360','4203'),('4538','Ut','2','non-fiction',3,'No','4324','4710','4349'),('4555','et','4','Action',3,'No','4270','3394','4673'),('4613','fames','3','Educational',0,'Yes','4879','3394','4201'),('4650','magnis','3','Educational',0,'Yes','4163','4158','4673'),('4735','eget','2','Horror',3,'No','3802','4158','4203'),('4783','Praesent','4','Romance',3,'No','3823','3394','4203'),('4819','non','3','Romance',0,'Yes','4438','4158','4201'),('4863','consequat','1','Action',3,'No','4281','3394','4673'),('4938','dolor','3','Horror',0,'Yes','4323','3394','4203');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed` (
  `book_ID` varchar(12) NOT NULL,
  `user_ID` varchar(8) NOT NULL,
  `date_borrowed` varchar(16) NOT NULL,
  `date_due` varchar(16) NOT NULL,
  PRIMARY KEY (`book_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`),
  CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `library_member` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES ('3128','827075','Apr 9 2022',' Apr 16 2022'),('3568','892585','Apr 13 2022',' Apr 25 2022'),('3587','499263','Apr 8 2022 ',' Apr 25 2022'),('3632','163463','Apr 16 2022',' Apr 7 2022'),('3635','148838','Apr 7 2022',' Apr 16 2022'),('3760','857971','Apr 6 2022',' Apr 25 2022'),('3893','668621','Apr 7 2022',' Nov 17  2022'),('3998','953368','Apr 6 2022',' Nov 17 2022'),('4085','554655','Apr 2 2022',' Apr 25 2022'),('4193','616514','Apr 8 2022',' Nov 17 2022'),('4300','534953','Apr 8 2022',' Apr 16 2022'),('4334','104275','Apr 10 2022',' Apr 25 2022'),('4361','363683','Apr 1 2022',' Apr 25 2022'),('4364','751687','Apr 17 2022',' Apr 16 2022'),('4484','234695','Apr 4 2022',' Nov 17 2022'),('4538','690218','Apr 5 2022',' Apr 16 2022'),('4555','614367',' Apr 17 2022','Nov 17 2022'),('4613','437224','Apr 7 2022',' Apr 25 2022'),('4650','964843','Apr 4 2022',' Apr 25 2022'),('4735','159629','Apr 15 2022',' Apr 25 2022'),('4783','413147','Apr 4 2022 ',' Apr 25 2022'),('4819','847914','Apr 11 2022',' Nov 17 2022'),('4863','126698','Apr 14 2022',' Apr 20 2022'),('4938','418132','Apr 9 2022',' Apr 25 2022');
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form` (
  `form_ID` varchar(8) NOT NULL,
  `form_name` varchar(64) NOT NULL,
  PRIMARY KEY (`form_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES ('1234','comic'),('4201','Articles'),('4203','MP4'),('4349','PDF'),('4586','Book'),('4673','MP3');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `librarian_ID` varchar(8) NOT NULL,
  `First_Name` varchar(32) NOT NULL,
  `Last_Name` varchar(32) NOT NULL,
  `Address` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Gender` char(3) NOT NULL,
  PRIMARY KEY (`librarian_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES ('121674','Charles','Villarreal','7759 Nunc Road','duis@hotmail.org','M'),('271400','Charles','Mitchell','Ap #107-8347 A Avenue','quisque.porttitor@outlook.ca','M'),('315033','Charles','Barnett','Ap #663-867 Pede, St.','felis.donec@google.net','M'),('347087','Charles','Carey','3441 Libero. Ave','rhoncus.proin.nisl@yahoo.edu','M'),('470499','Charles','Hess','573-6220 Non Rd.','sed.molestie@hotmail.ca','M'),('500621','Charles','Hardin','9139 Tincidunt. Rd.','magna.ut.tincidunt@protonmail.net','M'),('505251','Charles','Oliver','723-1723 Tellus. St.','non.feugiat.nec@google.org','F'),('516577','Charles','Sargent','Ap #251-6835 Arcu Av.','velit.quisque@hotmail.couk','F'),('538633','Charles','Hull','938-878 Ornare, Avenue','eget.massa.suspendisse@outlook.ca','M'),('542202','Charles','Benson','6336 Adipiscing. St.','nisi.dictum.augue@google.org','M'),('622681','Charles','Price','P.O. Box 543, 920 Consectetuer Ave','curae.phasellus@yahoo.edu','M'),('636603','Charles','York','5489 Eu Rd.','egestas.lacinia.sed@hotmail.couk','F'),('671421','Charles','Morales','Ap #505-3588 Cubilia Av.','quisque.ac@outlook.net','M'),('712911','Charles','Cunningham','955-7863 Donec Avenue','et.magnis@aol.edu','M'),('732834','Charles','Ballard','P.O. Box 439, 9679 Neque Rd.','elit.nulla@aol.edu','F'),('738134','Charles','Lang','364-9877 Fusce St.','at@outlook.org','M'),('755442','Charles','Oliver','Ap #131-454 Ac, St.','odio.sagittis@google.couk','M'),('787808','Charles','Sullivan','P.O. Box 954, 9465 Luctus St.','donec.non@icloud.ca','F'),('799556','Charles','Lara','679-6751 Ac Rd.','purus.in.molestie@outlook.ca','M'),('800688','Charles','Salas','8617 Odio St.','turpis.egestas.fusce@protonmail.ca','F'),('803184','Charles','Good','Ap #951-8414 Quis Rd.','senectus.et.netus@aol.ca','M'),('872021','Charles','Hurst','P.O. Box 645, 7757 Felis Street','dis.parturient@aol.net','F'),('897339','Charles','Marshall','P.O. Box 429, 2733 Natoque Ave','orci.in@aol.ca','F'),('906303','Charles','Woods','P.O. Box 625, 8115 A, Rd.','dignissim.maecenas@icloud.edu','M'),('920720','Charles','Vaughn','267-3227 Vitae St.','cursus.diam@aol.ca','M');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_member`
--

DROP TABLE IF EXISTS `library_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_member` (
  `user_ID` varchar(8) NOT NULL,
  `First_Name` varchar(32) NOT NULL,
  `Last_Name` varchar(32) NOT NULL,
  `Address` varchar(128) NOT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Gender` char(3) NOT NULL,
  `Birthdate` varchar(32) NOT NULL,
  `Age` int NOT NULL,
  `librarian_ID` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `librarian_ID` (`librarian_ID`),
  CONSTRAINT `library_member_ibfk_1` FOREIGN KEY (`librarian_ID`) REFERENCES `librarian` (`librarian_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_member`
--

LOCK TABLES `library_member` WRITE;
/*!40000 ALTER TABLE `library_member` DISABLE KEYS */;
INSERT INTO `library_member` VALUES ('104275','Heather','Graves','593-4383 Molestie Av.','erat.etiam@yahoo.edu','F','Jun 5, 2003',22,'121674'),('126698','Sean','Hurst','372-5001 Velit St.','natoque@icloud.net','F','Dec 25, 2007',22,'271400'),('148838','Zenaida','Bradley','715-9722 Sem Ave','porttitor.scelerisque@aol.com','F','Oct 27, 2007',22,'712911'),('159629','Nayda','Nieves','4092 Egestas. Road','vivamus.molestie@protonmail.edu','F','Dec 1, 2004',22,'542202'),('163463','Abra','Copeland','6769 Aliquam Rd.','donec@hotmail.ca','F','Jun 20, 2005',22,'920720'),('234695','Desiree','Austin','547-2846 Cras Rd.','nonummy.ipsum.non@protonmail.org','F','Jan 28, 2004',22,'800688'),('363683','Heather','Herrera','629-2932 Dolor Rd.','ridiculus.mus@icloud.edu','F','Mar 15, 2009',22,'799556'),('413147','Ira','Pratt','P.O. Box 909, 2924 Ac Rd.','vestibulum.ut@outlook.org','F','Jan 27, 2006',22,'755442'),('415616','Otto','Porter','3839 Nulla St.','vivamus.rhoncus@google.edu','F','Jul 7, 2010',22,'920720'),('418132','Maite','Sullivan','P.O. Box 954, 9465 Luctus St.','donec.non@icloud.ca','F','Feb 1, 2001',22,'787808'),('437224','Cyrus','Gould','4744 Diam. Street','tincidunt.neque@outlook.edu','F','May 23, 2003',22,'636603'),('499263','Kenneth','Woods','658-5042 Ornare, Ave','semper.et@hotmail.edu','F','Jul 19, 2010',25,'755442'),('534953','Lacota','Franklin','352-7054 Nascetur St.','sed.consequat.auctor@yahoo.org','F','Nov 22, 2006',25,'732834'),('554655','Rhea','Barnes','991-1159 Vulputate, Av.','mauris.quis@icloud.couk','F','May 20, 2000',25,'470499'),('614367','Timon','Bond','927-5216 Risus, St.','orci.ut.sagittis@hotmail.ca','F','Aug 14, 2001',25,'920720'),('616514','Knox','Wagner','595-1961 Enim. Avenue','mauris.non@yahoo.couk','F','Aug 13, 2007',25,'732834'),('668621','Drake','Jimenez','Ap #664-8983 Aliquet Street','mauris.vel@icloud.com','F','Nov 18, 2008',25,'347087'),('690218','Hedley','Beasley','129-7282 Eget, Ave','amet@aol.org','F','Jun 25, 2010',25,'347087'),('751687','Sebastian','Barnett','Ap #663-867 Pede, St.','felis.donec@google.net','F','Nov 23, 2002',25,'315033'),('827075','Jennifer','Robertson','4228 Vestibulum Rd.','quisque.fringilla@yahoo.couk','F','Jul 7, 2008',25,'712911'),('847914','Drake','Johns','6223 At, Avenue','at.pretium.aliquet@outlook.org','F','Jan 18, 2010',25,'906303'),('857971','Hunter','Houston','Ap #522-1472 Donec Road','imperdiet.non@protonmail.edu','F','Sep 21, 2008',25,'755442'),('892585','Brock','Ortiz','807-1207 Sit Av.','sed.et.libero@yahoo.couk','F','Mar 3, 2004',25,'872021'),('953368','Guinevere','Mitchell','Ap #107-8347 A Avenue','quisque.porttitor@outlook.ca','F','Nov 7, 2000',25,'271400'),('964843','Rina','Carter','9813 Semper. Avenue','quisque.ac.libero@outlook.ca','F','Mar 5, 2001',25,'920720');
/*!40000 ALTER TABLE `library_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_ID` varchar(8) NOT NULL,
  `publisher_name` varchar(64) NOT NULL,
  PRIMARY KEY (`publisher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('3150','Simon'),('3394','Penguin'),('4158','Reed'),('4360','TCK'),('4710','Harper');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved` (
  `book_ID` varchar(12) NOT NULL,
  `user_ID` varchar(8) NOT NULL,
  `reserve_date` varchar(16) NOT NULL,
  PRIMARY KEY (`book_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `reserved_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`),
  CONSTRAINT `reserved_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `library_member` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved`
--

LOCK TABLES `reserved` WRITE;
/*!40000 ALTER TABLE `reserved` DISABLE KEYS */;
INSERT INTO `reserved` VALUES ('3128','827075','20-Apr'),('3518','415616','19-Apr'),('3568','892585','23-Apr'),('3587','499263','18-Apr'),('3632','163463','23-Apr'),('3635','148838','19-Apr'),('3760','857971','20-Apr'),('3893','668621','22-Apr'),('3998','953368','20-Apr'),('4085','554655','21-Apr'),('4193','616514','20-Apr'),('4300','534953','20-Apr'),('4334','104275','23-Apr'),('4361','363683','18-Apr'),('4364','751687','23-Apr'),('4484','234695','23-Apr'),('4538','690218','18-Apr'),('4555','614367','20-Apr'),('4613','437224','19-Apr'),('4650','964843','21-Apr'),('4735','159629','22-Apr'),('4783','413147','23-Apr'),('4819','847914','20-Apr'),('4863','126698','23-Apr'),('4938','418132','20-Apr');
/*!40000 ALTER TABLE `reserved` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26 20:26:16
