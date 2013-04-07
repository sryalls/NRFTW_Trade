-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: NRFTW_trade
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

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
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities` (
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
INSERT INTO `commodities` VALUES ('Brick'),('Rockrete'),('Lumber');
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodities_tags`
--

DROP TABLE IF EXISTS `commodities_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities_tags` (
  `commodity` varchar(40) DEFAULT NULL,
  `tag` varchar(40) DEFAULT NULL,
  `grade` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities_tags`
--

LOCK TABLES `commodities_tags` WRITE;
/*!40000 ALTER TABLE `commodities_tags` DISABLE KEYS */;
INSERT INTO `commodities_tags` VALUES ('Morphine','Anesthetic',1),('Penacilin','Antibiotic',1),('Archeotech','Archeotech',1),('Flack','Armor',1),('Carapce','Armor',1),('Mesh','Armor',1),('Poppies','Biomass (Morphine)',1),('Venom(Morphine)','Biomass (Morphine)',1),('Fungus(Penicilin)','Biomass (Penicilin)',1),('Clean Water','Clean Water',1),('Sewage','Dirty Water',1),('River Water','Dirty Water',1),('Manure','Fertilizer',1),('Chemical Fertilizer','Fertilizer',1),('Cotton','Fibres',1),('Flax','Fibres',1),('Hemp ','Fibres',1),('Accrylic','Fibres',1),('Wool','Fibres',1),('Corpse Starch','Food',1),('Reconstituted Protei','Food',1),('Vegetable Starch','Food',1),('Grains','Food',2),('Preserved Fruit','Food',2),('Preserved Vegetables','Food',2),('Processed Meat','Food',2),('Processed Fish','Food',2),('Fresh Fish','Food',3),('Fresh Meat','Food',3),('Fresh Fruit','Food',3),('Fresh Veg','Food',3),('Wood','Fuel',1),('Manure','Fuel',1),('Animal Fats','Fuel',1),('Fish Oil','Fuel',1),('Peat','Fuel',1),('Coal ','Fuel',2),('Oil','Fuel',2),('Gass','Fuel',2),('Promethium','Fuel',3),('High Grade Promethiu','Fuel',4),('Skins','Skins',1),('Glassware','Gllassware',1),('Glues','Glues',1),('Hard Point Weapons','Hard Point Weapons',1),('Heavy Munitions','Heavy Munitions',1),('Inks','Inks',1),('Slaves','Labor',1),('Servitors','Labor',1),('Endentured Servents','Labor',1),('Macro Munitions','Macro munitions',1),('Macro Weapons','Macro Weapons',1),('Sulpher','Minerals (propellant',1),('Oil','Minerals (propellant',1),('Phospherus','Minerals (propellant',1),('Samarium-Cobalt','Minerals (renew)',1),('Pressurised Oxygen ','Oxygen',1),('Plant Machinery','Plant Machinery',1),('Propellant','Propellant',1),('Small Arms','Small Arms',1),('Small Arm Muniitons','Small Arm Munitions',1),('Soldiers','Soldiers',1),('Milita','Militia',1),('Books','Teaching Materias',1),('Data Slates','Teaching Materias',1),('Tech Grade 1','Tech',1),('Tech Grade 2','Tech',2),('Tech Grade 3','Tech',3),('Textiles','Textiles',1),('Vacines','Vacines',1),('Veichals','Veichals',1),('Sugar','Biomass(vaccine)',1),('Wood','Building Materials ',1),('Corrugated Iron','Building Materials ',1),('Sheet Plastic','Building Materials ',1),('Stone','Building Materials ',2),('Rockrete','Building Materials ',2),('Bricks','Building Materials ',2),('Construction Grade S','Building Materials ',3),('Adamantine','Building Materials ',3),('Ceramic Plates','Armour Component',1),('Aluminium','Armour Component',1),('Titanium','Armour Component',1),('Steel','Armour Component',1),('Adamantine','Armour Component',1),('Plastics','Plastics',1),('Nitrogen','Macronutrients',1),('Sulpher','Macronutrients',1),('Pospherous','Macronutrients',1),('Potassium','Macronutrients',1),('Calcium','Macronutrients',1),('Magnesium ','Macronutrients',1),('Human Corpses','Animal Biomass',1),('Carrion','Animal Biomass',1),('Animal Waste','Animal Biomass',1),('Acids','Acids',1),('Coagulants','Coagulants',1),('Salt','Preservatives',1),('Sugar','Preservatives',1),('Fungi','Fungi',1),('Vegetable Waste','Vegetable Waste',1),('Pigment','Pigment',1),('Nickle','Gun Metal',1),('Iron','Gun Metal',1),('Steel','Gun Metal',1),('Paper','Paper',1),('Aluminium','Tech Metals',1),('Steel ','Tech Metals',1),('Titanium','Tech Metals',1),('Gold','Conductor Metals',1),('Copper','Conductor Metals',1),('Natural Rubber','Rubber',1),('Artificial Rubber','Rubber',1),('Clay','Clay',1),('Iron Ore','Iron Ore',1),('Adamantine Ore','Adamantine Ore',1),('Carbon','Carbon',1),('Carbon','Pigment Raws',1),('Zink ore','Pigment Raws',1),('Titanium ore','Pigment Raws',1),('Iron ore','Pigment Raws',1),('Clay','Pigment Raws',1),('Ultramarine','Pigment Raws',1),('Oil','Oil ',1);
/*!40000 ALTER TABLE `commodities_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markets` (
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets`
--

LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
INSERT INTO `markets` VALUES ('Arboria'),('Chelm'),('Kurox III'),('Schatternberg'),('Seraph'),('Valarax IV'),('Varyaga'),('0'),('Testudo'),('Testusdo'),('Almeran'),('null');
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets_tags`
--

DROP TABLE IF EXISTS `markets_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markets_tags` (
  `market` varchar(20) DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `grade` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets_tags`
--

LOCK TABLES `markets_tags` WRITE;
/*!40000 ALTER TABLE `markets_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `markets_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_capacity`
--

DROP TABLE IF EXISTS `route_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_capacity` (
  `route` mediumint(9) DEFAULT NULL,
  `commodity` varchar(20) DEFAULT NULL,
  `rate` mediumint(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_capacity`
--

LOCK TABLES `route_capacity` WRITE;
/*!40000 ALTER TABLE `route_capacity` DISABLE KEYS */;
INSERT INTO `route_capacity` VALUES (5,'Brick',65),(5,'Rockrete',65),(5,'Lumber',65),(6,'Brick',667),(6,'Rockrete',667),(6,'Lumber',667),(7,'Brick',99),(7,'Rockrete',99),(7,'Lumber',99);
/*!40000 ALTER TABLE `route_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_matrix`
--

DROP TABLE IF EXISTS `trade_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_matrix` (
  `commodity_name` varchar(40) DEFAULT NULL,
  `p_rate` mediumint(8) DEFAULT NULL,
  `tag_name` varchar(40) DEFAULT NULL,
  `tag_grade` tinyint(1) DEFAULT NULL,
  `c_rate` mediumint(8) DEFAULT NULL,
  `market_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_matrix`
--

LOCK TABLES `trade_matrix` WRITE;
/*!40000 ALTER TABLE `trade_matrix` DISABLE KEYS */;
INSERT INTO `trade_matrix` VALUES ('Lumber',554,NULL,NULL,NULL,'Arboria'),('Brick',43,NULL,NULL,NULL,'Arboria'),('Rockrete',234,NULL,NULL,NULL,'Arboria'),(NULL,NULL,'building materials',1,2345678,'Arboria'),(NULL,NULL,'building materials',2,34567,'Arboria'),('Lumber',334,NULL,NULL,NULL,'Chelm'),('Brick',33,NULL,NULL,NULL,'Chelm'),('Rockrete',23,NULL,NULL,NULL,'Chelm'),(NULL,NULL,'building materials',1,22,'Chelm'),(NULL,NULL,'building materials',2,432,'Chelm'),('Lumber',23423,NULL,NULL,NULL,'Kurox III'),('Brick',23432,NULL,NULL,NULL,'Kurox III'),('Rockrete',422343,NULL,NULL,NULL,'Kurox III'),(NULL,NULL,'building materials',1,23,'Kurox III'),(NULL,NULL,'building materials',2,654,'Kurox III'),('Lumber',2345523,NULL,NULL,NULL,'Schatternberg'),('Brick',345322,NULL,NULL,NULL,'Schatternberg'),('Rockrete',5534,NULL,NULL,NULL,'Schatternberg'),(NULL,NULL,'building materials',1,5432,'Schatternberg'),(NULL,NULL,'building materials',2,532,'Schatternberg'),('Lumber',542,NULL,NULL,NULL,'Seraph'),('Brick',456,NULL,NULL,NULL,'Seraph'),('Rockrete',23423,NULL,NULL,NULL,'Seraph'),(NULL,NULL,'building materials',1,543233,'Seraph'),(NULL,NULL,'building materials',2,53422,'Seraph'),('Lumber',4232,NULL,NULL,NULL,'Valarax IV'),('Brick',2234432,NULL,NULL,NULL,'Valarax IV'),('Rockrete',233422,NULL,NULL,NULL,'Valarax IV'),(NULL,NULL,'building materials',1,4235,'Valarax IV'),(NULL,NULL,'building materials',2,4321,'Valarax IV'),('Lumber',22342,NULL,NULL,NULL,'Varyaga'),('Brick',2342324,NULL,NULL,NULL,'Varyaga'),('Rockrete',232352,NULL,NULL,NULL,'Varyaga'),(NULL,NULL,'building materials',1,342344,'Varyaga'),(NULL,NULL,'building materials',2,423342,'Varyaga'),(NULL,NULL,'building materials',1,42234,'Arboria'),(NULL,NULL,'building materials',2,23423,'Arboria'),(NULL,NULL,'building materials',1,345576,'Chelm'),(NULL,NULL,'building materials',2,33,'Chelm'),(NULL,NULL,'building materials',1,564322,'Kurox III'),(NULL,NULL,'building materials',2,4223,'Kurox III'),(NULL,NULL,'building materials',1,33244,'Schatternberg'),(NULL,NULL,'building materials',2,2342233,'Schatternberg'),(NULL,NULL,'building materials',1,23453,'Seraph'),(NULL,NULL,'building materials',2,4223345,'Seraph'),(NULL,NULL,'building materials',1,44532,'Valarax IV'),(NULL,NULL,'building materials',2,23224,'Valarax IV'),(NULL,NULL,'building materials',1,42342,'Varyaga'),(NULL,NULL,'building materials',2,34223,'Varyaga'),(NULL,NULL,'building materials',1,4674,'Chelm'),(NULL,NULL,'building materials',2,432,'Chelm'),(NULL,NULL,'building materials',1,2345,'Seraph'),(NULL,NULL,'building materials',2,2345,'Seraph'),('Lumber',46,NULL,NULL,NULL,'Testudo'),('Brick',76,NULL,NULL,NULL,'Testudo'),('Rockrete',45,NULL,NULL,NULL,'Testudo'),(NULL,NULL,'Small Arms',1,43,'Testudo'),(NULL,NULL,'Soldiers',1,45,'Testudo'),(NULL,NULL,'Hard Point Weapons',1,43,'Testudo'),(NULL,NULL,'Labor',1,54,'Testudo'),(NULL,NULL,'Minerals (renew)',1,32,'Testudo'),(NULL,NULL,'Plastics',1,33,'Testudo'),(NULL,NULL,'Conductor Metals',1,32,'Testudo'),(NULL,NULL,'Macro munitions',1,66,'Testudo'),(NULL,NULL,'Minerals (propellant',1,65,'Testudo'),(NULL,NULL,'Tech',3,12,'Testudo'),(NULL,NULL,'Tech',2,23,'Testudo'),(NULL,NULL,'Tech',1,34,'Testudo'),(NULL,NULL,'Armor',1,32,'Testudo'),(NULL,NULL,'Glues',1,22,'Testudo'),(NULL,NULL,'Macro Weapons',1,23,'Testudo'),(NULL,NULL,'Animal Biomass',1,2,'Testudo'),(NULL,NULL,'Macronutrients',1,22,'Testudo'),(NULL,NULL,'Tech Metals',1,54,'Testudo'),(NULL,NULL,'Pigment Raws',1,34,'Testudo'),(NULL,NULL,'Clean Water',1,90,'Testudo'),(NULL,NULL,'Militia',1,22,'Testudo'),(NULL,NULL,'Veichals',1,32,'Testudo'),(NULL,NULL,'Adamantine Ore',1,43,'Testudo'),(NULL,NULL,'Clay',1,65,'Testudo'),(NULL,NULL,'Rubber',1,23,'Testudo'),(NULL,NULL,'Acids',1,3,'Testudo'),(NULL,NULL,'Textiles',1,65,'Testudo'),(NULL,NULL,'Food',1,65,'Testudo'),(NULL,NULL,'Iron Ore',1,22,'Testudo'),(NULL,NULL,'Teaching Materias',1,32,'Testudo'),(NULL,NULL,'Food',2,12,'Testudo'),(NULL,NULL,'Food',3,87,'Testudo'),(NULL,NULL,'Archeotech',1,21,'Testudo'),(NULL,NULL,'Oxygen',1,54,'Testudo'),(NULL,NULL,'Fuel',4,54,'Testudo'),(NULL,NULL,'Fuel',3,4,'Testudo'),(NULL,NULL,'Oil ',1,43,'Testudo'),(NULL,NULL,'Fuel',2,99,'Testudo'),(NULL,NULL,'Fuel',1,34,'Testudo'),(NULL,NULL,'Propellant',1,55,'Testudo'),(NULL,NULL,'Fertilizer',1,98,'Testudo'),(NULL,NULL,'Biomass (Penicilin)',1,12,'Testudo'),(NULL,NULL,'Antibiotic',1,89,'Testudo'),(NULL,NULL,'Anesthetic',1,33,'Testudo'),(NULL,NULL,'Vacines',1,23,'Testudo'),(NULL,NULL,'Armour Component',1,32,'Testudo'),(NULL,NULL,'Paper',1,22,'Testudo'),(NULL,NULL,'Skins',1,99,'Testudo'),(NULL,NULL,'Dirty Water',1,65,'Testudo'),(NULL,NULL,'Gllassware',1,78,'Testudo'),(NULL,NULL,'Heavy Munitions',1,65,'Testudo'),(NULL,NULL,'Building Materials ',3,1,'Testudo'),(NULL,NULL,'Building Materials ',2,332,'Testudo'),(NULL,NULL,'Small Arm Munitions',1,43,'Testudo'),(NULL,NULL,'Building Materials ',1,223,'Testudo'),(NULL,NULL,'Fungi',1,654,'Testudo'),(NULL,NULL,'Fibres',1,21,'Testudo'),(NULL,NULL,'Plant Machinery',1,234,'Testudo'),(NULL,NULL,'Pigment',1,34,'Testudo'),(NULL,NULL,'Vegetable Waste',1,22,'Testudo'),(NULL,NULL,'Coagulants',1,3,'Testudo'),(NULL,NULL,'Biomass(vaccine)',1,111,'Testudo'),(NULL,NULL,'Preservatives',1,33,'Testudo'),(NULL,NULL,'Gun Metal',1,44,'Testudo'),(NULL,NULL,'Inks',1,12,'Testudo'),(NULL,NULL,'Carbon',1,22,'Testudo'),(NULL,NULL,'Biomass (Morphine)',1,12,'Testudo'),('Lumber',44,NULL,NULL,NULL,'Almeran'),('Brick',44,NULL,NULL,NULL,'Almeran'),('Rockrete',44,NULL,NULL,NULL,'Almeran'),(NULL,NULL,'Small Arms',1,33,'Almeran'),(NULL,NULL,'Soldiers',1,333,'Almeran'),(NULL,NULL,'Hard Point Weapons',1,33,'Almeran'),(NULL,NULL,'Labor',1,33,'Almeran'),(NULL,NULL,'Minerals (renew)',1,33,'Almeran'),(NULL,NULL,'Plastics',1,33,'Almeran'),(NULL,NULL,'Conductor Metals',1,3,'Almeran'),(NULL,NULL,'Macro munitions',1,33,'Almeran'),(NULL,NULL,'Minerals (propellant',1,33,'Almeran'),(NULL,NULL,'Tech',3,333,'Almeran'),(NULL,NULL,'Tech',2,333,'Almeran'),(NULL,NULL,'Tech',1,33,'Almeran'),(NULL,NULL,'Armor',1,44,'Almeran'),(NULL,NULL,'Glues',1,33,'Almeran'),(NULL,NULL,'Macro Weapons',1,333,'Almeran'),(NULL,NULL,'Animal Biomass',1,33,'Almeran'),(NULL,NULL,'Macronutrients',1,33,'Almeran'),(NULL,NULL,'Tech Metals',1,3,'Almeran'),(NULL,NULL,'Pigment Raws',1,3,'Almeran'),(NULL,NULL,'Clean Water',1,44,'Almeran'),(NULL,NULL,'Militia',1,333,'Almeran'),(NULL,NULL,'Veichals',1,33,'Almeran'),(NULL,NULL,'Adamantine Ore',1,3,'Almeran'),(NULL,NULL,'Clay',1,3,'Almeran'),(NULL,NULL,'Rubber',1,3,'Almeran'),(NULL,NULL,'Acids',1,33,'Almeran'),(NULL,NULL,'Textiles',1,33,'Almeran'),(NULL,NULL,'Food',1,44,'Almeran'),(NULL,NULL,'Iron Ore',1,3,'Almeran'),(NULL,NULL,'Teaching Materias',1,333,'Almeran'),(NULL,NULL,'Food',2,44,'Almeran'),(NULL,NULL,'Food',3,44,'Almeran'),(NULL,NULL,'Archeotech',1,44,'Almeran'),(NULL,NULL,'Oxygen',1,33,'Almeran'),(NULL,NULL,'Fuel',4,44,'Almeran'),(NULL,NULL,'Fuel',3,44,'Almeran'),(NULL,NULL,'Oil ',1,3,'Almeran'),(NULL,NULL,'Fuel',2,44,'Almeran'),(NULL,NULL,'Fuel',1,44,'Almeran'),(NULL,NULL,'Propellant',1,333,'Almeran'),(NULL,NULL,'Fertilizer',1,44,'Almeran'),(NULL,NULL,'Biomass (Penicilin)',1,44,'Almeran'),(NULL,NULL,'Antibiotic',1,44,'Almeran'),(NULL,NULL,'Anesthetic',1,44,'Almeran'),(NULL,NULL,'Vacines',1,333,'Almeran'),(NULL,NULL,'Armour Component',1,33,'Almeran'),(NULL,NULL,'Paper',1,33,'Almeran'),(NULL,NULL,'Skins',1,4,'Almeran'),(NULL,NULL,'Dirty Water',1,44,'Almeran'),(NULL,NULL,'Gllassware',1,44,'Almeran'),(NULL,NULL,'Heavy Munitions',1,33,'Almeran'),(NULL,NULL,'Building Materials ',3,33,'Almeran'),(NULL,NULL,'Building Materials ',2,33,'Almeran'),(NULL,NULL,'Small Arm Munitions',1,33,'Almeran'),(NULL,NULL,'Building Materials ',1,333,'Almeran'),(NULL,NULL,'Fungi',1,33,'Almeran'),(NULL,NULL,'Fibres',1,44,'Almeran'),(NULL,NULL,'Plant Machinery',1,33,'Almeran'),(NULL,NULL,'Pigment',1,33,'Almeran'),(NULL,NULL,'Vegetable Waste',1,33,'Almeran'),(NULL,NULL,'Coagulants',1,33,'Almeran'),(NULL,NULL,'Biomass(vaccine)',1,33,'Almeran'),(NULL,NULL,'Preservatives',1,333,'Almeran'),(NULL,NULL,'Gun Metal',1,33,'Almeran'),(NULL,NULL,'Inks',1,33,'Almeran'),(NULL,NULL,'Carbon',1,3,'Almeran'),(NULL,NULL,'Biomass (Morphine)',1,44,'Almeran'),('Lumber',34,NULL,NULL,NULL,'0'),('Brick',43,NULL,NULL,NULL,'0'),('Rockrete',34,NULL,NULL,NULL,'0'),(NULL,NULL,'Small Arms',1,9,'0'),(NULL,NULL,'Soldiers',1,9,'0'),(NULL,NULL,'Hard Point Weapons',1,9,'0'),(NULL,NULL,'Labor',1,9,'0'),(NULL,NULL,'Minerals (renew)',1,9,'0'),(NULL,NULL,'Plastics',1,9,'0'),(NULL,NULL,'Conductor Metals',1,9,'0'),(NULL,NULL,'Macro munitions',1,9,'0'),(NULL,NULL,'Minerals (propellant',1,9,'0'),(NULL,NULL,'Tech',3,9,'0'),(NULL,NULL,'Tech',2,99,'0'),(NULL,NULL,'Tech',1,9,'0'),(NULL,NULL,'Armor',1,9,'0'),(NULL,NULL,'Glues',1,99,'0'),(NULL,NULL,'Macro Weapons',1,9,'0'),(NULL,NULL,'Animal Biomass',1,9,'0'),(NULL,NULL,'Macronutrients',1,9,'0'),(NULL,NULL,'Tech Metals',1,9,'0'),(NULL,NULL,'Pigment Raws',1,9,'0'),(NULL,NULL,'Clean Water',1,9,'0'),(NULL,NULL,'Militia',1,9,'0'),(NULL,NULL,'Veichals',1,9,'0'),(NULL,NULL,'Adamantine Ore',1,9,'0'),(NULL,NULL,'Clay',1,9,'0'),(NULL,NULL,'Rubber',1,9,'0'),(NULL,NULL,'Acids',1,9,'0'),(NULL,NULL,'Textiles',1,9,'0'),(NULL,NULL,'Food',1,9,'0'),(NULL,NULL,'Iron Ore',1,9,'0'),(NULL,NULL,'Teaching Materias',1,9,'0'),(NULL,NULL,'Food',2,9,'0'),(NULL,NULL,'Food',3,99,'0'),(NULL,NULL,'Archeotech',1,9,'0'),(NULL,NULL,'Oxygen',1,9,'0'),(NULL,NULL,'Fuel',4,99,'0'),(NULL,NULL,'Fuel',3,9,'0'),(NULL,NULL,'Oil ',1,9,'0'),(NULL,NULL,'Fuel',2,9,'0'),(NULL,NULL,'Fuel',1,9,'0'),(NULL,NULL,'Propellant',1,9,'0'),(NULL,NULL,'Fertilizer',1,99,'0'),(NULL,NULL,'Biomass (Penicilin)',1,9,'0'),(NULL,NULL,'Antibiotic',1,9,'0'),(NULL,NULL,'Anesthetic',1,9,'0'),(NULL,NULL,'Vacines',1,9,'0'),(NULL,NULL,'Armour Component',1,9,'0'),(NULL,NULL,'Paper',1,9,'0'),(NULL,NULL,'Skins',1,99,'0'),(NULL,NULL,'Dirty Water',1,99,'0'),(NULL,NULL,'Gllassware',1,9,'0'),(NULL,NULL,'Heavy Munitions',1,9,'0'),(NULL,NULL,'Building Materials ',3,9,'0'),(NULL,NULL,'Building Materials ',2,9,'0'),(NULL,NULL,'Small Arm Munitions',1,9,'0'),(NULL,NULL,'Building Materials ',1,9,'0'),(NULL,NULL,'Fungi',1,9,'0'),(NULL,NULL,'Fibres',1,99,'0'),(NULL,NULL,'Plant Machinery',1,9,'0'),(NULL,NULL,'Pigment',1,9,'0'),(NULL,NULL,'Vegetable Waste',1,9,'0'),(NULL,NULL,'Coagulants',1,9,'0'),(NULL,NULL,'Biomass(vaccine)',1,9,'0'),(NULL,NULL,'Preservatives',1,9,'0'),(NULL,NULL,'Gun Metal',1,9,'0'),(NULL,NULL,'Inks',1,9,'0'),(NULL,NULL,'Carbon',1,9,'0'),(NULL,NULL,'Biomass (Morphine)',1,99,'0');
/*!40000 ALTER TABLE `trade_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_routes`
--

DROP TABLE IF EXISTS `trade_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_routes` (
  `market_1` varchar(20) DEFAULT NULL,
  `market_2` varchar(20) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_routes`
--

LOCK TABLES `trade_routes` WRITE;
/*!40000 ALTER TABLE `trade_routes` DISABLE KEYS */;
INSERT INTO `trade_routes` VALUES ('Varyaga','Chelm',1),('Seraph','Varyaga',2),('Varyaga','Schatternberg',3),('Schatternberg','Arboria',5),('Chelm','Schatternberg',6),('Varyaga','Kurox III',7);
/*!40000 ALTER TABLE `trade_routes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-07 10:24:28
