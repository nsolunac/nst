CREATE DATABASE IF NOT EXISTS `nn_nst_2018` DEFAULT CHARACTER SET utf8;

USE `nn_nst_2018`;

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(255) NOT NULL,
  `prezime` VARCHAR(255) NOT NULL,
  `tip` SMALLINT NOT NULL DEFAULT 0,
  `lp` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT  INTO `korisnik`(`id`,`ime`,`prezime`,`tip`,`lp`) VALUES (1,'Nikola','Paunovic',2,1);
INSERT  INTO `korisnik`(`id`,`ime`,`prezime`,`tip`,`lp`) VALUES (2,'Nikola','Solunac',2,1);

DROP TABLE IF EXISTS `korisnikU1`;

CREATE TABLE `korisnikU1` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `korisnikU1` (`id`) VALUES (1)

DROP TABLE IF EXISTS `korisnikU2`;

CREATE TABLE `korisnikU2` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `korisnikU2` (`id`) VALUES (1)

DROP TABLE IF EXISTS `korisnikAdmin`;

CREATE TABLE `korisnikAdmin`(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `korisnikAdmin` (`id`) VALUES (1)

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

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `user` INT(11) NOT NULL,
  `roles` VARCHAR(255) DEFAULT NULL
  -- KEY `user` (`user`),
  -- CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `profil`;

CREATE TABLE `profil`(
	`korisnikId` INT(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`korisnikId`)
)ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `profil` (`korisnikId`) VALUES (1)

DROP TABLE IF EXISTS `sablon`;

CREATE TABLE `sablon`(
	`sablonId` INT (11) NOT NULL AUTO_INCREMENT,
    `korisnikId` INT (11) NOT NULL,
    `direktorijum` INT (11) NOT NULL,
	PRIMARY KEY (`sablonId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `sablon`(`sablonId`,`korisnikId`,`direktorijum`) VALUES (1,1,1); 

DROP TABLE IF EXISTS `poruka`;

CREATE TABLE `poruka`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
    `posaljilac` VARCHAR(255) NOT NULL,
    `primalac` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`Id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `poruka`(`id`,`posiljalac`,`primalac`) VALUES (1,'paun','soki'); 

DROP TABLE IF EXISTS `stavkaPoruke`;

CREATE TABLE `stavkaPoruke`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
    `posaljilac` VARCHAR(255) NOT NULL,
    `primalac` VARCHAR(255) NOT NULL,
    `procitana` VARCHAR(255) NOT NULL,
    `procitana_US` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`Id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `stavkaPoruke`(`id`,`posiljalac`,`primalac`,`procitana`) VALUES (1,'paun','soki','Poruka je procitana', 'The message has been read'); 

DROP TABLE IF EXISTS `CV`;

CREATE TABLE `CV`(
	`id` INT (11) NOT NULL AUTO_INCREMENT,
	`sablonId` INT (11) NOT NULL,
    `profilId` INT (11) NOT NULL,
    `direktorijum` INT (11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `CV`(`id`,`sablonId`,`profilId`,`direktorijum`) VALUES (1,1,1,1); 
