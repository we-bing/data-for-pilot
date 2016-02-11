# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: WEBING-PILOT
# Generation Time: 2016-02-11 14:10:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table CODE_CITY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CODE_CITY`;

CREATE TABLE `CODE_CITY` (
  `city_name` varchar(16) NOT NULL,
  `city_code` int(16) NOT NULL,
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CODE_COUNTY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CODE_COUNTY`;

CREATE TABLE `CODE_COUNTY` (
  `county_name` varchar(16) NOT NULL,
  `county_code` int(16) NOT NULL,
  `city_code` int(16) NOT NULL,
  PRIMARY KEY (`county_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CODE_TOWNSHIP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CODE_TOWNSHIP`;

CREATE TABLE `CODE_TOWNSHIP` (
  `township_name` varchar(16) NOT NULL,
  `township_code` int(16) NOT NULL,
  `county_code` int(16) NOT NULL,
  `district` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`township_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_CANDIDACIES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_CANDIDACIES`;

CREATE TABLE `TB_CANDIDACIES` (
  `candidacy_id` int(16) NOT NULL,
  `was_elected` varchar(2) NOT NULL DEFAULT 'F',
  `birthday` varchar(16) NOT NULL DEFAULT '',
  `party` varchar(16) NOT NULL DEFAULT '',
  `district` varchar(32) NOT NULL DEFAULT '',
  `candidacy_name` varchar(16) NOT NULL DEFAULT '',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `person_id` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`candidacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_CANDIDACY_KEYWORDS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_CANDIDACY_KEYWORDS`;

CREATE TABLE `TB_CANDIDACY_KEYWORDS` (
  `keyword_id` int(16) NOT NULL AUTO_INCREMENT,
  `candidacy_id` int(16) NOT NULL,
  `keyword_name` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`keyword_id`),
  KEY `candidacy_id` (`candidacy_id`),
  CONSTRAINT `tb_candidacy_keywords_ibfk_1` FOREIGN KEY (`candidacy_id`) REFERENCES `TB_CANDIDACIES` (`candidacy_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_KEYWORD_NEWS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_KEYWORD_NEWS`;

CREATE TABLE `TB_KEYWORD_NEWS` (
  `news_id` int(16) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(16) NOT NULL,
  `news_url` text NOT NULL,
  `news_summary` varchar(255) NOT NULL DEFAULT '',
  `news_status` varchar(4) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`news_id`),
  KEY `keyword_id` (`keyword_id`),
  CONSTRAINT `tb_keyword_news_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `TB_CANDIDACY_KEYWORDS` (`keyword_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_MEMBER_REPORT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_MEMBER_REPORT`;

CREATE TABLE `TB_MEMBER_REPORT` (
  `member_id` int(16) NOT NULL,
  `member_name` varchar(16) NOT NULL DEFAULT '',
  `birthday` varchar(16) NOT NULL DEFAULT '',
  `attendance_rate` varchar(8) NOT NULL DEFAULT '',
  `proposal` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table TB_POPONG19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TB_POPONG19`;

CREATE TABLE `TB_POPONG19` (
  `person_id` int(16) NOT NULL,
  `party` varchar(16) NOT NULL DEFAULT '',
  `when_elected` varchar(16) NOT NULL DEFAULT '',
  `commitee` varchar(32) NOT NULL DEFAULT '',
  `experience` varchar(512) NOT NULL DEFAULT '',
  `bill_keywords` varchar(255) NOT NULL DEFAULT '',
  `member_name` varchar(16) NOT NULL DEFAULT '',
  `birthday` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
