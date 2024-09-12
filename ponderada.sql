-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Card'
-- Contém informações de identificação e contato dos clientes e fornecedores.
-- ---

DROP TABLE IF EXISTS `Card`;
		
CREATE TABLE `Card` (
  `CardCode` VARCHAR(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `CardName` VARCHAR(255) NULL DEFAULT NULL,
  `CardType` VARCHAR(50) NULL DEFAULT NULL,
  `GroupCode` INTEGER NULL DEFAULT NULL,
  `Phone1` VARCHAR(20) NULL DEFAULT NULL,
  `Phone2` VARCHAR(20) NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(255) NULL DEFAULT NULL,
  `ShippingType` VARCHAR(50) NULL DEFAULT NULL,
  `Website` VARCHAR(255) NULL DEFAULT NULL,
  `CompanyPrivate` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`CardCode`)
) COMMENT 'Contém informações de identificação e contato dos clientes e';

-- ---
-- Table 'Adress'
-- Registra os endereços associados a cada entidade (cliente/fornecedor).
-- ---

DROP TABLE IF EXISTS `Adress`;
		
CREATE TABLE `Adress` (
  `AddressID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `ParentKey` VARCHAR(20) NULL DEFAULT NULL,
  `AddressType` VARCHAR(50) NULL DEFAULT NULL,
  `AddressName` VARCHAR(255) NULL DEFAULT NULL,
  `Street` VARCHAR(255) NULL DEFAULT NULL,
  `StreetNo` VARCHAR(255) NULL DEFAULT NULL,
  `City` VARCHAR(255) NULL DEFAULT NULL,
  `County` VARCHAR(255) NULL DEFAULT NULL,
  `State` VARCHAR(50) NULL DEFAULT NULL,
  `ZipCode` VARCHAR(10) NULL DEFAULT NULL,
  `Country` VARCHAR(20) NULL DEFAULT NULL,
  `CardCode` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) COMMENT 'Registra os endereços associados a cada entidade (cliente/fo';

-- ---
-- Table 'BankAccount'
-- Armazena informações bancárias relacionadas a cada entidade.
-- ---

DROP TABLE IF EXISTS `BankAccount`;
		
CREATE TABLE `BankAccount` (
  `BankID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `ParentKey` VARCHAR(20) NULL DEFAULT NULL,
  `BankCode` INTEGER NULL DEFAULT NULL,
  `Branch` VARCHAR(20) NULL DEFAULT NULL,
  `AccountNo` VARCHAR(50) NULL DEFAULT NULL,
  `AccountName` VARCHAR(255) NULL DEFAULT NULL,
  `CardCode` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`BankID`)
) COMMENT 'Armazena informações bancárias relacionadas a cada entidade.';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Adress` ADD FOREIGN KEY (CardCode) REFERENCES `Card` (`CardCode`);
ALTER TABLE `BankAccount` ADD FOREIGN KEY (CardCode) REFERENCES `Card` (`CardCode`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Card` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Adress` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `BankAccount` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Card` (`CardCode`,`CardName`,`CardType`,`GroupCode`,`Phone1`,`Phone2`,`EmailAddress`,`ShippingType`,`Website`,`CompanyPrivate`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `Adress` (`AddressID`,`ParentKey`,`AddressType`,`AddressName`,`Street`,`StreetNo`,`City`,`County`,`State`,`ZipCode`,`Country`,`CardCode`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `BankAccount` (`BankID`,`ParentKey`,`BankCode`,`Branch`,`AccountNo`,`AccountName`,`CardCode`) VALUES
-- ('','','','','','','');