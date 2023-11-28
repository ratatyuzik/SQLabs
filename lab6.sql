SELECT cities.name, regions.name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population > 350000;

SELECT cities.name, regions.name
FROM cities, regions
WHERE cities.region = regions.uuid AND regions.name = 'Nord';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `station_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `branch` (`station_id`, `line_id`, `id`) VALUES
(1,	1,	1),
(1,	2,	2);

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lines` (`id`, `name`) VALUES
(1,	'Red'),
(2,	'Green');

DROP TABLE IF EXISTS `station`; 
CREATE TABLE `station` (
  `line_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `station` (`line_id`, `id`, `name`) VALUES
(1,	1,	'My first station'),
(1,	2,	'My second station'),
(2,	3,	'My first green station'),
(2,	4,	'My second green station');

DROP TABLE IF EXISTS `transit_station`;
CREATE TABLE `transit_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `from_line_id` int(11) NOT NULL,
  `to_line_id` int(11) NOT NULL,
  PRIMARY KEY (`transit_station_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `transit_station_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `transit_station` (`id`, `station_id`, `from_line_id`, `to_line_id`) VALUES
(1,	1,	1,	2);
