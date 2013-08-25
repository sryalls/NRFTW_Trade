-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: NRFTW_trade
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.2

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
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `market` varchar(20) DEFAULT NULL,
  `commodity` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES ('Seraph','Bricks',77),('Seraph','Rockrete',0),('Seraph','Wood',77),('Arboria','Bricks',99),('Arboria','Rockrete',0),('Arboria','Wood',99),('Chelm','Bricks',99),('Chelm','Rockrete',0),('Chelm','Wood',99),('Kurox III','Bricks',99),('Kurox III','Rockrete',0),('Kurox III','Wood',99),('Schatternberg','Bricks',99),('Schatternberg','Rockrete',0),('Schatternberg','Wood',99),('Valarax IV','Bricks',99),('Valarax IV','Rockrete',0),('Valarax IV','Wood',99),('Varyaga','Bricks',99),('Varyaga','Rockrete',0),('Varyaga','Wood',99),('0','Bricks',99),('0','Rockrete',0),('0','Wood',99),('Testudo','Bricks',99),('Testudo','Rockrete',99),('Testudo','Wood',99),('Testusdo','Bricks',99),('Testusdo','Rockrete',99),('Testusdo','Wood',99),('Almeran','Bricks',99),('Almeran','Rockrete',99),('Almeran','Wood',99),('null','Bricks',99),('null','Rockrete',99),('null','Wood',99);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
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
  `market_name` varchar(20) DEFAULT NULL,
  `stock` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_matrix`
--

LOCK TABLES `trade_matrix` WRITE;
/*!40000 ALTER TABLE `trade_matrix` DISABLE KEYS */;
INSERT INTO `trade_matrix` VALUES ('Wood',100,NULL,NULL,100,'Arboria',NULL),('Bricks',100,NULL,NULL,100,'Arboria',NULL),('Rockrete',100,NULL,NULL,100,'Arboria',4378),(NULL,100,'building materials',1,100,'Arboria',NULL),(NULL,100,'building materials',2,100,'Arboria',NULL),('Wood',100,NULL,NULL,100,'Chelm',NULL),('Bricks',100,NULL,NULL,100,'Chelm',NULL),('Rockrete',100,NULL,NULL,100,'Chelm',538),(NULL,100,'building materials',1,100,'Chelm',NULL),(NULL,100,'building materials',2,100,'Chelm',NULL),('Wood',100,NULL,NULL,100,'Kurox III',NULL),('Bricks',100,NULL,NULL,100,'Kurox III',NULL),('Rockrete',100,NULL,NULL,100,'Kurox III',2534458),(NULL,100,'building materials',1,100,'Kurox III',NULL),(NULL,100,'building materials',2,100,'Kurox III',NULL),('Wood',100,NULL,NULL,100,'Schatternberg',NULL),('Bricks',100,NULL,NULL,100,'Schatternberg',NULL),('Rockrete',100,NULL,NULL,100,'Schatternberg',33604),(NULL,100,'building materials',1,100,'Schatternberg',NULL),(NULL,100,'building materials',2,100,'Schatternberg',NULL),('Wood',100,NULL,NULL,100,'Seraph',NULL),('Bricks',100,NULL,NULL,100,'Seraph',NULL),('Rockrete',100,NULL,NULL,100,'Seraph',117515),(NULL,100,'building materials',1,100,'Seraph',NULL),(NULL,100,'building materials',2,100,'Seraph',NULL),('Wood',100,NULL,NULL,100,'Valarax IV',NULL),('Bricks',100,NULL,NULL,100,'Valarax IV',NULL),('Rockrete',100,NULL,NULL,100,'Valarax IV',1167510),(NULL,100,'building materials',1,100,'Valarax IV',NULL),(NULL,100,'building materials',2,100,'Valarax IV',NULL),('Wood',100,NULL,NULL,100,'Varyaga',NULL),('Bricks',100,NULL,NULL,100,'Varyaga',NULL),('Rockrete',100,NULL,NULL,100,'Varyaga',1162160),(NULL,100,'building materials',1,100,'Varyaga',NULL),(NULL,100,'building materials',2,100,'Varyaga',NULL),(NULL,100,'building materials',1,100,'Arboria',NULL),(NULL,100,'building materials',2,100,'Arboria',NULL),(NULL,100,'building materials',1,100,'Chelm',NULL),(NULL,100,'building materials',2,100,'Chelm',NULL),(NULL,100,'building materials',1,100,'Kurox III',NULL),(NULL,100,'building materials',2,100,'Kurox III',NULL),(NULL,100,'building materials',1,100,'Schatternberg',NULL),(NULL,100,'building materials',2,100,'Schatternberg',NULL),(NULL,100,'building materials',1,100,'Seraph',NULL),(NULL,100,'building materials',2,100,'Seraph',NULL),(NULL,100,'building materials',1,100,'Valarax IV',NULL),(NULL,100,'building materials',2,100,'Valarax IV',NULL),(NULL,100,'building materials',1,100,'Varyaga',NULL),(NULL,100,'building materials',2,100,'Varyaga',NULL),(NULL,100,'building materials',1,100,'Chelm',NULL),(NULL,100,'building materials',2,100,'Chelm',NULL),(NULL,100,'building materials',1,100,'Seraph',NULL),(NULL,100,'building materials',2,100,'Seraph',NULL),('Wood',100,NULL,NULL,100,'Testudo',NULL),('Bricks',100,NULL,NULL,100,'Testudo',NULL),('Rockrete',100,NULL,NULL,100,'Testudo',NULL),(NULL,100,'Small Arms',1,100,'Testudo',NULL),(NULL,100,'Soldiers',1,100,'Testudo',NULL),(NULL,100,'Hard Point Weapons',1,100,'Testudo',NULL),(NULL,100,'Labor',1,100,'Testudo',NULL),(NULL,100,'Minerals (renew)',1,100,'Testudo',NULL),(NULL,100,'Plastics',1,100,'Testudo',NULL),(NULL,100,'Conductor Metals',1,100,'Testudo',NULL),(NULL,100,'Macro munitions',1,100,'Testudo',NULL),(NULL,100,'Minerals (propellant',1,100,'Testudo',NULL),(NULL,100,'Tech',3,100,'Testudo',NULL),(NULL,100,'Tech',2,100,'Testudo',NULL),(NULL,100,'Tech',1,100,'Testudo',NULL),(NULL,100,'Armor',1,100,'Testudo',NULL),(NULL,100,'Glues',1,100,'Testudo',NULL),(NULL,100,'Macro Weapons',1,100,'Testudo',NULL),(NULL,100,'Animal Biomass',1,100,'Testudo',NULL),(NULL,100,'Macronutrients',1,100,'Testudo',NULL),(NULL,100,'Tech Metals',1,100,'Testudo',NULL),(NULL,100,'Pigment Raws',1,100,'Testudo',NULL),(NULL,100,'Clean Water',1,100,'Testudo',NULL),(NULL,100,'Militia',1,100,'Testudo',NULL),(NULL,100,'Veichals',1,100,'Testudo',NULL),(NULL,100,'Adamantine Ore',1,100,'Testudo',NULL),(NULL,100,'Clay',1,100,'Testudo',NULL),(NULL,100,'Rubber',1,100,'Testudo',NULL),(NULL,100,'Acids',1,100,'Testudo',NULL),(NULL,100,'Textiles',1,100,'Testudo',NULL),(NULL,100,'Food',1,100,'Testudo',NULL),(NULL,100,'Iron Ore',1,100,'Testudo',NULL),(NULL,100,'Teaching Materias',1,100,'Testudo',NULL),(NULL,100,'Food',2,100,'Testudo',NULL),(NULL,100,'Food',3,100,'Testudo',NULL),(NULL,100,'Archeotech',1,100,'Testudo',NULL),(NULL,100,'Oxygen',1,100,'Testudo',NULL),(NULL,100,'Fuel',4,100,'Testudo',NULL),(NULL,100,'Fuel',3,100,'Testudo',NULL),(NULL,100,'Oil ',1,100,'Testudo',NULL),(NULL,100,'Fuel',2,100,'Testudo',NULL),(NULL,100,'Fuel',1,100,'Testudo',NULL),(NULL,100,'Propellant',1,100,'Testudo',NULL),(NULL,100,'Fertilizer',1,100,'Testudo',NULL),(NULL,100,'Biomass (Penicilin)',1,100,'Testudo',NULL),(NULL,100,'Antibiotic',1,100,'Testudo',NULL),(NULL,100,'Anesthetic',1,100,'Testudo',NULL),(NULL,100,'Vacines',1,100,'Testudo',NULL),(NULL,100,'Armour Component',1,100,'Testudo',NULL),(NULL,100,'Paper',1,100,'Testudo',NULL),(NULL,100,'Skins',1,100,'Testudo',NULL),(NULL,100,'Dirty Water',1,100,'Testudo',NULL),(NULL,100,'Gllassware',1,100,'Testudo',NULL),(NULL,100,'Heavy Munitions',1,100,'Testudo',NULL),(NULL,100,'Building Materials ',3,100,'Testudo',NULL),(NULL,100,'Building Materials ',2,100,'Testudo',NULL),(NULL,100,'Small Arm Munitions',1,100,'Testudo',NULL),(NULL,100,'Building Materials ',1,100,'Testudo',NULL),(NULL,100,'Fungi',1,100,'Testudo',NULL),(NULL,100,'Fibres',1,100,'Testudo',NULL),(NULL,100,'Plant Machinery',1,100,'Testudo',NULL),(NULL,100,'Pigment',1,100,'Testudo',NULL),(NULL,100,'Vegetable Waste',1,100,'Testudo',NULL),(NULL,100,'Coagulants',1,100,'Testudo',NULL),(NULL,100,'Biomass(vaccine)',1,100,'Testudo',NULL),(NULL,100,'Preservatives',1,100,'Testudo',NULL),(NULL,100,'Gun Metal',1,100,'Testudo',NULL),(NULL,100,'Inks',1,100,'Testudo',NULL),(NULL,100,'Carbon',1,100,'Testudo',NULL),(NULL,100,'Biomass (Morphine)',1,100,'Testudo',NULL),('Wood',100,NULL,NULL,100,'Almeran',NULL),('Bricks',100,NULL,NULL,100,'Almeran',NULL),('Rockrete',100,NULL,NULL,100,'Almeran',NULL),(NULL,100,'Small Arms',1,100,'Almeran',NULL),(NULL,100,'Soldiers',1,100,'Almeran',NULL),(NULL,100,'Hard Point Weapons',1,100,'Almeran',NULL),(NULL,100,'Labor',1,100,'Almeran',NULL),(NULL,100,'Minerals (renew)',1,100,'Almeran',NULL),(NULL,100,'Plastics',1,100,'Almeran',NULL),(NULL,100,'Conductor Metals',1,100,'Almeran',NULL),(NULL,100,'Macro munitions',1,100,'Almeran',NULL),(NULL,100,'Minerals (propellant',1,100,'Almeran',NULL),(NULL,100,'Tech',3,100,'Almeran',NULL),(NULL,100,'Tech',2,100,'Almeran',NULL),(NULL,100,'Tech',1,100,'Almeran',NULL),(NULL,100,'Armor',1,100,'Almeran',NULL),(NULL,100,'Glues',1,100,'Almeran',NULL),(NULL,100,'Macro Weapons',1,100,'Almeran',NULL),(NULL,100,'Animal Biomass',1,100,'Almeran',NULL),(NULL,100,'Macronutrients',1,100,'Almeran',NULL),(NULL,100,'Tech Metals',1,100,'Almeran',NULL),(NULL,100,'Pigment Raws',1,100,'Almeran',NULL),(NULL,100,'Clean Water',1,100,'Almeran',NULL),(NULL,100,'Militia',1,100,'Almeran',NULL),(NULL,100,'Veichals',1,100,'Almeran',NULL),(NULL,100,'Adamantine Ore',1,100,'Almeran',NULL),(NULL,100,'Clay',1,100,'Almeran',NULL),(NULL,100,'Rubber',1,100,'Almeran',NULL),(NULL,100,'Acids',1,100,'Almeran',NULL),(NULL,100,'Textiles',1,100,'Almeran',NULL),(NULL,100,'Food',1,100,'Almeran',NULL),(NULL,100,'Iron Ore',1,100,'Almeran',NULL),(NULL,100,'Teaching Materias',1,100,'Almeran',NULL),(NULL,100,'Food',2,100,'Almeran',NULL),(NULL,100,'Food',3,100,'Almeran',NULL),(NULL,100,'Archeotech',1,100,'Almeran',NULL),(NULL,100,'Oxygen',1,100,'Almeran',NULL),(NULL,100,'Fuel',4,100,'Almeran',NULL),(NULL,100,'Fuel',3,100,'Almeran',NULL),(NULL,100,'Oil ',1,100,'Almeran',NULL),(NULL,100,'Fuel',2,100,'Almeran',NULL),(NULL,100,'Fuel',1,100,'Almeran',NULL),(NULL,100,'Propellant',1,100,'Almeran',NULL),(NULL,100,'Fertilizer',1,100,'Almeran',NULL),(NULL,100,'Biomass (Penicilin)',1,100,'Almeran',NULL),(NULL,100,'Antibiotic',1,100,'Almeran',NULL),(NULL,100,'Anesthetic',1,100,'Almeran',NULL),(NULL,100,'Vacines',1,100,'Almeran',NULL),(NULL,100,'Armour Component',1,100,'Almeran',NULL),(NULL,100,'Paper',1,100,'Almeran',NULL),(NULL,100,'Skins',1,100,'Almeran',NULL),(NULL,100,'Dirty Water',1,100,'Almeran',NULL),(NULL,100,'Gllassware',1,100,'Almeran',NULL),(NULL,100,'Heavy Munitions',1,100,'Almeran',NULL),(NULL,100,'Building Materials ',3,100,'Almeran',NULL),(NULL,100,'Building Materials ',2,100,'Almeran',NULL),(NULL,100,'Small Arm Munitions',1,100,'Almeran',NULL),(NULL,100,'Building Materials ',1,100,'Almeran',NULL),(NULL,100,'Fungi',1,100,'Almeran',NULL),(NULL,100,'Fibres',1,100,'Almeran',NULL),(NULL,100,'Plant Machinery',1,100,'Almeran',NULL),(NULL,100,'Pigment',1,100,'Almeran',NULL),(NULL,100,'Vegetable Waste',1,100,'Almeran',NULL),(NULL,100,'Coagulants',1,100,'Almeran',NULL),(NULL,100,'Biomass(vaccine)',1,100,'Almeran',NULL),(NULL,100,'Preservatives',1,100,'Almeran',NULL),(NULL,100,'Gun Metal',1,100,'Almeran',NULL),(NULL,100,'Inks',1,100,'Almeran',NULL),(NULL,100,'Carbon',1,100,'Almeran',NULL),(NULL,100,'Biomass (Morphine)',1,100,'Almeran',NULL),('Wood',100,NULL,NULL,100,'0',NULL),('Bricks',100,NULL,NULL,100,'0',NULL),('Rockrete',100,NULL,NULL,100,'0',570),(NULL,100,'Small Arms',1,100,'0',NULL),(NULL,100,'Soldiers',1,100,'0',NULL),(NULL,100,'Hard Point Weapons',1,100,'0',NULL),(NULL,100,'Labor',1,100,'0',NULL),(NULL,100,'Minerals (renew)',1,100,'0',NULL),(NULL,100,'Plastics',1,100,'0',NULL),(NULL,100,'Conductor Metals',1,100,'0',NULL),(NULL,100,'Macro munitions',1,100,'0',NULL),(NULL,100,'Minerals (propellant',1,100,'0',NULL),(NULL,100,'Tech',3,100,'0',NULL),(NULL,100,'Tech',2,100,'0',NULL),(NULL,100,'Tech',1,100,'0',NULL),(NULL,100,'Armor',1,100,'0',NULL),(NULL,100,'Glues',1,100,'0',NULL),(NULL,100,'Macro Weapons',1,100,'0',NULL),(NULL,100,'Animal Biomass',1,100,'0',NULL),(NULL,100,'Macronutrients',1,100,'0',NULL),(NULL,100,'Tech Metals',1,100,'0',NULL),(NULL,100,'Pigment Raws',1,100,'0',NULL),(NULL,100,'Clean Water',1,100,'0',NULL),(NULL,100,'Militia',1,100,'0',NULL),(NULL,100,'Veichals',1,100,'0',NULL),(NULL,100,'Adamantine Ore',1,100,'0',NULL),(NULL,100,'Clay',1,100,'0',NULL),(NULL,100,'Rubber',1,100,'0',NULL),(NULL,100,'Acids',1,100,'0',NULL),(NULL,100,'Textiles',1,100,'0',NULL),(NULL,100,'Food',1,100,'0',NULL),(NULL,100,'Iron Ore',1,100,'0',NULL),(NULL,100,'Teaching Materias',1,100,'0',NULL),(NULL,100,'Food',2,100,'0',NULL),(NULL,100,'Food',3,100,'0',NULL),(NULL,100,'Archeotech',1,100,'0',NULL),(NULL,100,'Oxygen',1,100,'0',NULL),(NULL,100,'Fuel',4,100,'0',NULL),(NULL,100,'Fuel',3,100,'0',NULL),(NULL,100,'Oil ',1,100,'0',NULL),(NULL,100,'Fuel',2,100,'0',NULL),(NULL,100,'Fuel',1,100,'0',NULL),(NULL,100,'Propellant',1,100,'0',NULL),(NULL,100,'Fertilizer',1,100,'0',NULL),(NULL,100,'Biomass (Penicilin)',1,100,'0',NULL),(NULL,100,'Antibiotic',1,100,'0',NULL),(NULL,100,'Anesthetic',1,100,'0',NULL),(NULL,100,'Vacines',1,100,'0',NULL),(NULL,100,'Armour Component',1,100,'0',NULL),(NULL,100,'Paper',1,100,'0',NULL),(NULL,100,'Skins',1,100,'0',NULL),(NULL,100,'Dirty Water',1,100,'0',NULL),(NULL,100,'Gllassware',1,100,'0',NULL),(NULL,100,'Heavy Munitions',1,100,'0',NULL),(NULL,100,'Building Materials ',3,100,'0',NULL),(NULL,100,'Building Materials ',2,100,'0',NULL),(NULL,100,'Small Arm Munitions',1,100,'0',NULL),(NULL,100,'Building Materials ',1,100,'0',NULL),(NULL,100,'Fungi',1,100,'0',NULL),(NULL,100,'Fibres',1,100,'0',NULL),(NULL,100,'Plant Machinery',1,100,'0',NULL),(NULL,100,'Pigment',1,100,'0',NULL),(NULL,100,'Vegetable Waste',1,100,'0',NULL),(NULL,100,'Coagulants',1,100,'0',NULL),(NULL,100,'Biomass(vaccine)',1,100,'0',NULL),(NULL,100,'Preservatives',1,100,'0',NULL),(NULL,100,'Gun Metal',1,100,'0',NULL),(NULL,100,'Inks',1,100,'0',NULL),(NULL,100,'Carbon',1,100,'0',NULL),(NULL,100,'Biomass (Morphine)',1,100,'0',NULL);
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

-- Dump completed on 2013-08-25  5:44:47

