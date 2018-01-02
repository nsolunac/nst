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

-- CREATE TABLE `korisnikU1` (
--    
-- )
-- 
-- CREATE TABLE `korisnikU2` (
--    
-- )
-- 
-- CREATE TABLE `korisnikAdmin` (
--    
-- )

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

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `user` INT(11) NOT NULL,
  `roles` VARCHAR(255) DEFAULT NULL
  -- KEY `user` (`user`),
  -- CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- CREATE TABLE `profil`(
-- )
-- 
-- CREATE TABLE `sablon`(
-- )
-- 
-- CREATE TABLE `poruka`(
-- )
-- 
-- CREATE TABLE `stavkaPoruke`(
-- )
-- 
-- CREATE TABLE `CV`(
-- )