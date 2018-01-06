CREATE DATABASE IF NOT EXISTS `nn_nst_2018` DEFAULT CHARACTER SET utf8;

USE `nn_nst_2018`;

DROP TABLE IF EXISTS `rola`;

CREATE TABLE `rola` (
  `id` INT(11) NOT NULL,
  `naziv` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `rola` (id, naziv) VALUES (1,'Seeker');
INSERT INTO `rola` (id, naziv) VALUES (2,'Designer');
INSERT INTO `rola` (id, naziv) VALUES (3,'Admin');

DROP TABLE IF EXISTS `korisnik`; 

CREATE TABLE `korisnik` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(255) NOT NULL,
  `prezime` VARCHAR(255) NOT NULL,
  `rolaId` INT(11) NOT NULL,
  `lp` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_korisnik_rola` FOREIGN KEY (`rolaId`) REFERENCES `rola` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


INSERT  INTO `korisnik`(`id`,`ime`,`prezime`,`rolaId`,`lp`) VALUES (1,'Nikola','Paunovic',2,1);
INSERT  INTO `korisnik`(`id`,`ime`,`prezime`,`rolaId`,`lp`) VALUES (2,'Nikola','Solunac',2,2);

DROP TABLE IF EXISTS `secretQstn`;

CREATE TABLE `secretQstn` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `opis` VARCHAR(255) NOT NULL,
    `opis_US` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)  
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT  INTO `secretQstn`(`id`,`opis`,`opis_US`) VALUES (1,'Koje je ime Vašeg omiljenog fudbalskog kluba?', 'What''s your favourite football team?');

DROP TABLE IF EXISTS `loginParams`;

CREATE TABLE `loginParams` (
   `korisnikId` INT(11) NOT NULL,
   `username` VARCHAR(255) NOT NULL,
   `password` VARCHAR(255) NOT NULL,
   `lock` BIT DEFAULT 0,
   `qstn` INT(11) NOT NULL,
   `qstnA` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`korisnikId`),
   CONSTRAINT `FK_loginparams_korisnik` FOREIGN KEY (`korisnikId`) REFERENCES `korisnik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FK_loginparams_secretQstn` FOREIGN KEY (`qstn`) REFERENCES `secretQstn` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- videti hash podataka
INSERT  INTO `loginParams`(`korisnikId`,`username`,`password`,`qstn`,`qstnA`) VALUES (1,'paun','123',1,'Crvena zvezda'); 
INSERT  INTO `loginParams`(`korisnikId`,`username`,`password`,`qstn`,`qstnA`) VALUES (2,'soki','123',1,'Crvena zvezda'); 


-- IF not exists select 1 from `information_schema`.`TABLES` where `table_name` = 'profilasdasd'

DROP TABLE IF EXISTS `segmentSifarnik`;

CREATE TABLE `segmentSifarnik`(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`naziv` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `profil`;

CREATE TABLE `profil`(
	`korisnikId` INT(11) NOT NULL,
	`segment` INT(11) NOT NULL,
	`datumOd` VARCHAR(10) NOT NULL,
	`datumDo` VARCHAR(10) NULL,
	`heading1` VARCHAR(255) NULL,
	`heading2` VARCHAR(255) NULL,
	`opis` VARCHAR(255) NULL,
	PRIMARY KEY (`korisnikId`),
	CONSTRAINT `FK_profil_korisnik` FOREIGN KEY (`korisnikId`) REFERENCES `korisnik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `FK_profil_segmentSifarnik` FOREIGN KEY (`segment`) REFERENCES `segmentSifarnik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sablon`;

CREATE TABLE `sablon`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`korisnikId` INT (11) NOT NULL,
	`direktorijum` VARCHAR (255) NOT NULL,
	`tip` TINYINT(4) NULL,
	`naziv` VARCHAR (255) NOT NULL,
	`cena` DOUBLE(18,2) NOT NULL,
	`brProd` INT(11) DEFAULT 0,
	`brLajkova` INT(11) DEFAULT 0,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_sablon_korisnik` FOREIGN KEY (`korisnikId`) REFERENCES `korisnik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag`(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`naziv` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tagA`;

CREATE TABLE `tagA`(
	`sablonId` INT(11) NOT NULL ,
	`tagId` INT(11) NOT NULL,
	CONSTRAINT `FK_tagA_sablon` FOREIGN KEY (`sablonId`) REFERENCES `sablon` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `FK_tagA_tag` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `konverzacija`;

CREATE TABLE `konverzacija`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`inicijator` INT (11) NOT NULL,
	`inicirani` INT (11) NOT NULL,
	`datum` DATETIME NOT NULL,
	`flag` BIT DEFAULT 1,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK_konverzacija_korisnik` FOREIGN KEY (`inicijator`) REFERENCES `korisnik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT `FK_konverzacija_korisnik2` FOREIGN KEY (`inicirani`) REFERENCES `korisnik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `poruka`;

CREATE TABLE `poruka`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`posaljilac` INT (11) NOT NULL,
	`primalac` INT (11) NOT NULL,
	`konverzacijaId` INT (11) NOT NULL,
	`Datum` DATETIME NOT NULL,
	PRIMARY KEY (`Id`),
	CONSTRAINT `FK_poruka_korisnik` FOREIGN KEY (`posaljilac`) REFERENCES `korisnik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT `FK_poruka_korisnik2` FOREIGN KEY (`primalac`) REFERENCES `korisnik` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT `FK_poruka_konverzacija` FOREIGN KEY (`konverzacijaId`) REFERENCES `konverzacija` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `konverzacijaArh`;

CREATE TABLE `konverzacijaArh`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`inicijator` INT (11) NOT NULL,
	`inicirani` INT (11) NOT NULL,
	`datum` DATETIME NOT NULL,
	`flag` BIT DEFAULT 1,
	PRIMARY KEY (`Id`)
	-- CONSTRAINT `FK_konverzacija_korisnik` FOREIGN KEY (`inicijator`) REFERENCES `korisnik` (`id`) ON DELETE restrict ON UPDATE restrict
	-- CONSTRAINT `FK_konverzacija_korisnik2` FOREIGN KEY (`inicirani`) REFERENCES `korisnik` (`id`) ON DELETE restrict ON UPDATE restrict
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `porukaArh`;

CREATE TABLE `porukaArh`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`posaljilac` INT (11) NOT NULL,
	`primalac` INT (11) NOT NULL,
	`konverzacijaId` INT (11) NOT NULL,
	`Datum` DATETIME NOT NULL,
	PRIMARY KEY (`Id`)
	-- CONSTRAINT `FK_poruka_korisnik` FOREIGN KEY (`posaljilac`) REFERENCES `korisnik` (`id`) ON DELETE restrict ON UPDATE restrict
	-- CONSTRAINT `FK_poruka_korisnik2` FOREIGN KEY (`primalac`) REFERENCES `korisnik` (`id`) ON DELETE restrict ON UPDATE restrict
	-- CONSTRAINT `FK_poruka_konverzacija` FOREIGN KEY (`konverzacijaId`) REFERENCES `konverzacija` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `CV`;

CREATE TABLE `CV`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`sablonId` INT (11) NOT NULL,
	`profilId` INT (11) NOT NULL,
	`direktorijum` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_cv_sablon` FOREIGN KEY (`sablonId`) REFERENCES `sablon` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT `FK_cv_profil` FOREIGN KEY (`profilId`) REFERENCES `profil` (`korisnikId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8;
