-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB-1:10.5.4+maria~focal - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- ssafy_trot 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `ssafy_trot` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ssafy_trot`;

-- 테이블 ssafy_trot.Article 구조 내보내기
CREATE TABLE IF NOT EXISTS `Article` (
  `b_type` int(11) NOT NULL DEFAULT 2,
  `a_idx` int(11) NOT NULL AUTO_INCREMENT,
  `a_url` varchar(500) DEFAULT NULL,
  `a_title` varchar(100) DEFAULT NULL,
  `a_content` varchar(200) DEFAULT NULL,
  `a_img` varchar(100) DEFAULT NULL,
  `a_member` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Board 구조 내보내기
CREATE TABLE IF NOT EXISTS `Board` (
  `b_idx` int(11) NOT NULL AUTO_INCREMENT,
  `b_type` int(11) NOT NULL,
  `b_good` int(11) DEFAULT NULL,
  `b_bookmark` int(11) DEFAULT NULL,
  `a_idx` int(11) DEFAULT NULL,
  `v_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `Board_FK` (`a_idx`),
  KEY `Board_FK_1` (`v_idx`),
  CONSTRAINT `Board_FK` FOREIGN KEY (`a_idx`) REFERENCES `Article` (`a_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Board_FK_1` FOREIGN KEY (`v_idx`) REFERENCES `Video` (`v_idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Bookmark 구조 내보내기
CREATE TABLE IF NOT EXISTS `Bookmark` (
  `u_email` varchar(100) DEFAULT NULL,
  `b_idx` int(11) DEFAULT NULL,
  KEY `Bookmark_FK` (`u_email`),
  KEY `Bookmark_FK_1` (`b_idx`),
  CONSTRAINT `Bookmark_FK` FOREIGN KEY (`u_email`) REFERENCES `UserInfo` (`u_email`),
  CONSTRAINT `Bookmark_FK_1` FOREIGN KEY (`b_idx`) REFERENCES `Board` (`b_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.BroadCasting 구조 내보내기
CREATE TABLE IF NOT EXISTS `BroadCasting` (
  `bc_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bc_company` varchar(50) DEFAULT NULL,
  `bc_date` varchar(50) NOT NULL,
  `bc_time` varchar(50) NOT NULL,
  `bc_member` varchar(50) DEFAULT NULL,
  `bc_title` varchar(50) NOT NULL,
  PRIMARY KEY (`bc_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Following 구조 내보내기
CREATE TABLE IF NOT EXISTS `Following` (
  `u_email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `s_idx` int(11) DEFAULT NULL,
  KEY `Favorite_FK` (`s_idx`),
  KEY `Favorite_FK_1` (`u_email`),
  CONSTRAINT `Favorite_FK` FOREIGN KEY (`s_idx`) REFERENCES `Singer` (`s_idx`),
  CONSTRAINT `Favorite_FK_1` FOREIGN KEY (`u_email`) REFERENCES `UserInfo` (`u_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Good 구조 내보내기
CREATE TABLE IF NOT EXISTS `Good` (
  `u_email` varchar(100) DEFAULT NULL,
  `b_idx` int(11) DEFAULT NULL,
  KEY `Good_FK` (`u_email`),
  KEY `Good_FK_1` (`b_idx`),
  CONSTRAINT `Good_FK` FOREIGN KEY (`u_email`) REFERENCES `UserInfo` (`u_email`),
  CONSTRAINT `Good_FK_1` FOREIGN KEY (`b_idx`) REFERENCES `Board` (`b_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `Reply` (
  `b_idx` int(11) NOT NULL,
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) NOT NULL,
  `r_content` varchar(200) NOT NULL,
  `u_email` varchar(100) NOT NULL,
  PRIMARY KEY (`r_num`),
  KEY `Reply_FK` (`b_idx`),
  KEY `Reply_FK_1` (`u_email`),
  CONSTRAINT `Reply_FK` FOREIGN KEY (`b_idx`) REFERENCES `Board` (`b_idx`),
  CONSTRAINT `Reply_FK_1` FOREIGN KEY (`u_email`) REFERENCES `UserInfo` (`u_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Singer 구조 내보내기
CREATE TABLE IF NOT EXISTS `Singer` (
  `s_idx` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  PRIMARY KEY (`s_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.UserInfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `UserInfo` (
  `u_pw` varchar(50) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_img` varchar(100) DEFAULT NULL,
  `u_pw2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 ssafy_trot.Video 구조 내보내기
CREATE TABLE IF NOT EXISTS `Video` (
  `b_type` int(11) NOT NULL DEFAULT 1,
  `v_idx` int(11) NOT NULL AUTO_INCREMENT,
  `v_url` varchar(500) NOT NULL,
  `v_title` varchar(100) NOT NULL,
  `v_content` varchar(200) DEFAULT NULL,
  `v_member` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`v_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
