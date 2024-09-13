-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'OCRD'
-- Tabela de Parceiros de Negócios (clientes, fornecedores, etc.).
-- ---

DROP TABLE IF EXISTS `OCRD`;
		
CREATE TABLE `OCRD` (
  `CardCode` VARCHAR(20) NOT NULL,
  `CardName` VARCHAR(100) NULL DEFAULT NULL,
  `CardForeignName` VARCHAR(100) NULL DEFAULT NULL,
  `CardType` VARCHAR(20) NULL DEFAULT NULL,
  `GroupCode` VARCHAR(10) NULL DEFAULT NULL,
  `Phone1` VARCHAR(15) NULL DEFAULT NULL,
  `Phone2` VARCHAR(15) NULL DEFAULT NULL,
  `Cellular` VARCHAR(15) NULL DEFAULT NULL,
  `Fax` VARCHAR(15) NULL DEFAULT NULL,
  `Notes` MEDIUMTEXT NULL DEFAULT NULL,
  `FreeText` MEDIUMTEXT NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(100) NULL DEFAULT NULL,
  `ShippingType` VARCHAR(20) NULL DEFAULT NULL,
  `Website` VARCHAR(100) NULL DEFAULT NULL,
  `CompanyPrivate` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`CardCode`)
) COMMENT 'Tabela de Parceiros de Negócios (clientes, fornecedores, etc';

-- ---
-- Table 'OCRB'
-- Contas bancárias associadas aos Parceiros de Negócios.
-- ---

DROP TABLE IF EXISTS `OCRB`;
		
CREATE TABLE `OCRB` (
  `ParentKey` VARCHAR(20) NOT NULL,
  `County` VARCHAR(50) NULL DEFAULT NULL,
  `BankCode` VARCHAR(10) NULL DEFAULT NULL,
  `Branch` VARCHAR(10) NULL DEFAULT NULL,
  `UserNo1` VARCHAR(50) NULL DEFAULT NULL,
  `AccountNo` VARCHAR(20) NULL DEFAULT NULL,
  `UserNo2` VARCHAR(50) NULL DEFAULT NULL,
  `AccountName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ParentKey`)
) COMMENT 'Contas bancárias associadas aos Parceiros de Negócios.';

-- ---
-- Table 'CRD1'
-- Endereços de Parceiros de Negócios (cobrança, entrega, etc.).
-- ---

DROP TABLE IF EXISTS `CRD1`;
		
CREATE TABLE `CRD1` (
  `ParentKey` VARCHAR(20) NOT NULL,
  `AddressType` VARCHAR(10) NULL DEFAULT NULL,
  `AddressName` VARCHAR(100) NULL DEFAULT NULL,
  `TypeOfAddress` VARCHAR(50) NULL DEFAULT NULL,
  `Street` VARCHAR(100) NULL DEFAULT NULL,
  `StreetNo` VARCHAR(10) NULL DEFAULT NULL,
  `Block` VARCHAR(50) NULL DEFAULT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `County` VARCHAR(50) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `ZipCode` VARCHAR(10) NULL DEFAULT NULL,
  `Country` VARCHAR(3) NULL DEFAULT NULL,
  `BuildingFloorRoom` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ParentKey`)
) COMMENT 'Endereços de Parceiros de Negócios (cobrança, entrega, etc.)';

-- ---
-- Table 'OCRD7'
-- 
-- ---

DROP TABLE IF EXISTS `OCRD7`;
		
CREATE TABLE `OCRD7` (
  `ParentKey` VARCHAR(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `LineNum` INTEGER NULL DEFAULT NULL,
  `Address` VARCHAR(100) NULL DEFAULT NULL,
  `TaxId0` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId1` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId2` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId3` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId4` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId5` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId6` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId7` VARCHAR(20) NULL DEFAULT NULL,
  `TaxId8` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ParentKey`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `OCRD` ADD FOREIGN KEY (CardCode) REFERENCES `OCRB` (`ParentKey`);
ALTER TABLE `OCRB` ADD FOREIGN KEY (ParentKey) REFERENCES `OCRD` (`CardCode`);
ALTER TABLE `CRD1` ADD FOREIGN KEY (ParentKey) REFERENCES `OCRD` (`CardCode`);
ALTER TABLE `OCRD7` ADD FOREIGN KEY (ParentKey) REFERENCES `OCRD` (`CardCode`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `OCRD` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OCRB` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `CRD1` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `OCRD7` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `OCRD` (`CardCode`,`CardName`,`CardForeignName`,`CardType`,`GroupCode`,`Phone1`,`Phone2`,`Cellular`,`Fax`,`Notes`,`FreeText`,`EmailAddress`,`ShippingType`,`Website`,`CompanyPrivate`) VALUES
-- ('','','','','','','','','','','','','','','');
-- INSERT INTO `OCRB` (`ParentKey`,`County`,`BankCode`,`Branch`,`UserNo1`,`AccountNo`,`UserNo2`,`AccountName`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `CRD1` (`ParentKey`,`AddressType`,`AddressName`,`TypeOfAddress`,`Street`,`StreetNo`,`Block`,`City`,`County`,`State`,`ZipCode`,`Country`,`BuildingFloorRoom`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `OCRD7` (`ParentKey`,`LineNum`,`Address`,`TaxId0`,`TaxId1`,`TaxId2`,`TaxId3`,`TaxId4`,`TaxId5`,`TaxId6`,`TaxId7`,`TaxId8`) VALUES
-- ('','','','','','','','','','','','');