-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema book4uapi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema book4uapi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `book4uapi` DEFAULT CHARACTER SET utf8mb4 ;
USE `book4uapi` ;

-- -----------------------------------------------------
-- Table `book4uapi`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`author` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_d3962fd11a54d87f927e84d108` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`language` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_7df7d1e250ea2a416f078a631f` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`book_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`book_images` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `frontSideImage` VARCHAR(255) NOT NULL,
  `rightSideImage` VARCHAR(255) NOT NULL,
  `leftSideImage` VARCHAR(255) NOT NULL,
  `backSideImage` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`publisher` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_9dc496f2e5b912da9edd2aa445` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`user_situation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`user_situation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` ENUM('Pendente', 'Confirmado') NOT NULL DEFAULT 'Pendente',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`personal_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`personal_data` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `streetName` VARCHAR(255) NULL DEFAULT NULL,
  `complement` VARCHAR(255) NULL DEFAULT NULL,
  `zipCode` VARCHAR(255) NULL DEFAULT NULL,
  `houseNumber` VARCHAR(255) NULL DEFAULT NULL,
  `district` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `cellphone` VARCHAR(255) NOT NULL,
  `telephone` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_d432272f81e9d9297f71725c88` (`telephone` ASC) VISIBLE,
  UNIQUE INDEX `IDX_b7d29a876647c0e9e463155cc9` (`cellphone` ASC) VISIBLE,
  UNIQUE INDEX `IDX_a69995036215ac616f25aad4dd` (`email` ASC) VISIBLE,
  UNIQUE INDEX `IDX_8f5e3ca530946c600bc2da3868` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `picture` VARCHAR(255) NOT NULL,
  `registerNumber` VARCHAR(255) NOT NULL,
  `credits` VARCHAR(255) NOT NULL DEFAULT '0',
  `personalDataId` INT(11) NULL DEFAULT NULL,
  `userSituationId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_5449b5a238a60e8fc7b91578ce` (`registerNumber` ASC) VISIBLE,
  UNIQUE INDEX `REL_8cf09661f91bf2c488592fa02d` (`personalDataId` ASC) VISIBLE,
  INDEX `FK_3a013563ed6542b420d56a519b5` (`userSituationId` ASC) VISIBLE,
  CONSTRAINT `FK_3a013563ed6542b420d56a519b5`
    FOREIGN KEY (`userSituationId`)
    REFERENCES `book4uapi`.`user_situation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_8cf09661f91bf2c488592fa02d7`
    FOREIGN KEY (`personalDataId`)
    REFERENCES `book4uapi`.`personal_data` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `pagesQuantity` INT(11) NOT NULL,
  `synopsis` VARCHAR(1000) NOT NULL,
  `price` VARCHAR(255) NOT NULL,
  `status` ENUM('Disponível', 'Indisponível') NOT NULL DEFAULT 'Disponível',
  `condition` ENUM('Novo', 'Semi-novo', 'Usado') NOT NULL DEFAULT 'Usado',
  `createdAt` VARCHAR(255) NOT NULL,
  `authorId` INT(11) NULL DEFAULT NULL,
  `languageId` INT(11) NULL DEFAULT NULL,
  `publisherId` INT(11) NULL DEFAULT NULL,
  `bookImagesId` INT(11) NULL DEFAULT NULL,
  `ownerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_66a4f0f47943a0d99c16ecf90b2` (`authorId` ASC) VISIBLE,
  INDEX `FK_a1d1140264d98ba83fa11de0da1` (`languageId` ASC) VISIBLE,
  INDEX `FK_b8988524dd01b5dcb67b4b3ede7` (`publisherId` ASC) VISIBLE,
  INDEX `FK_a7342229e766fc9a4fcdd45574a` (`bookImagesId` ASC) VISIBLE,
  INDEX `FK_b90677e3d515d915033134fc5f4` (`ownerId` ASC) VISIBLE,
  CONSTRAINT `FK_66a4f0f47943a0d99c16ecf90b2`
    FOREIGN KEY (`authorId`)
    REFERENCES `book4uapi`.`author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_a1d1140264d98ba83fa11de0da1`
    FOREIGN KEY (`languageId`)
    REFERENCES `book4uapi`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_a7342229e766fc9a4fcdd45574a`
    FOREIGN KEY (`bookImagesId`)
    REFERENCES `book4uapi`.`book_images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_b8988524dd01b5dcb67b4b3ede7`
    FOREIGN KEY (`publisherId`)
    REFERENCES `book4uapi`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_b90677e3d515d915033134fc5f4`
    FOREIGN KEY (`ownerId`)
    REFERENCES `book4uapi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`book_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`book_categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `bookId` INT(11) NULL DEFAULT NULL,
  `categoryId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_11a8804bb7f4ae35b4a5a118b1b` (`bookId` ASC) VISIBLE,
  INDEX `FK_fcdf094e1e43afe76a6c95138c9` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `FK_11a8804bb7f4ae35b4a5a118b1b`
    FOREIGN KEY (`bookId`)
    REFERENCES `book4uapi`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fcdf094e1e43afe76a6c95138c9`
    FOREIGN KEY (`categoryId`)
    REFERENCES `book4uapi`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`exchange_with_credit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`exchange_with_credit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `createdAt` VARCHAR(255) NOT NULL,
  `situation` ENUM('Confirmado', 'Pendente', 'Recusado', 'Entregue') NOT NULL DEFAULT 'Pendente',
  `readBuyer` ENUM('Read', 'Nonread') NOT NULL DEFAULT 'Nonread',
  `readOwner` ENUM('Read', 'Nonread') NOT NULL DEFAULT 'Nonread',
  `userId` INT(11) NULL DEFAULT NULL,
  `bookId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_d28dea2d25d51bb1c53e8b23d36` (`userId` ASC) VISIBLE,
  INDEX `FK_45ff747fc58759dd5787555d08e` (`bookId` ASC) VISIBLE,
  CONSTRAINT `FK_45ff747fc58759dd5787555d08e`
    FOREIGN KEY (`bookId`)
    REFERENCES `book4uapi`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_d28dea2d25d51bb1c53e8b23d36`
    FOREIGN KEY (`userId`)
    REFERENCES `book4uapi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`request` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `situation` ENUM('Confirmado', 'Pendente', 'Recusado', 'Entregue') NOT NULL DEFAULT 'Pendente',
  `createdAt` VARCHAR(255) NOT NULL,
  `readOwner1` ENUM('Read', 'Nonread') NOT NULL DEFAULT 'Nonread',
  `readOwner2` ENUM('Read', 'Nonread') NOT NULL DEFAULT 'Nonread',
  `book1Id` INT(11) NULL DEFAULT NULL,
  `book2Id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_e7c9734841e011411e9328c7300` (`book1Id` ASC) VISIBLE,
  INDEX `FK_827bd59fc523d1c4fe53de67fdb` (`book2Id` ASC) VISIBLE,
  CONSTRAINT `FK_827bd59fc523d1c4fe53de67fdb`
    FOREIGN KEY (`book2Id`)
    REFERENCES `book4uapi`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_e7c9734841e011411e9328c7300`
    FOREIGN KEY (`book1Id`)
    REFERENCES `book4uapi`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`exchange_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`exchange_history` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `exchangeDate` VARCHAR(255) NOT NULL,
  `exchangeType` ENUM('PONTOS', 'LIVRO') NOT NULL,
  `requestId` INT(11) NULL DEFAULT NULL,
  `exchangeWithCreditId` INT(11) NULL DEFAULT NULL,
  `userId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_d79c9dc96919650a28985e28236` (`requestId` ASC) VISIBLE,
  INDEX `FK_0ebec0972e79599b4ce5edc9ba8` (`exchangeWithCreditId` ASC) VISIBLE,
  INDEX `FK_e116d74dfb02839508711882980` (`userId` ASC) VISIBLE,
  CONSTRAINT `FK_0ebec0972e79599b4ce5edc9ba8`
    FOREIGN KEY (`exchangeWithCreditId`)
    REFERENCES `book4uapi`.`exchange_with_credit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_d79c9dc96919650a28985e28236`
    FOREIGN KEY (`requestId`)
    REFERENCES `book4uapi`.`request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_e116d74dfb02839508711882980`
    FOREIGN KEY (`userId`)
    REFERENCES `book4uapi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`wish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`wish` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_cc0ea2abf152cc78b535338c579` (`userId` ASC) VISIBLE,
  CONSTRAINT `FK_cc0ea2abf152cc78b535338c579`
    FOREIGN KEY (`userId`)
    REFERENCES `book4uapi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `book4uapi`.`wish_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book4uapi`.`wish_list` (
  `wish` INT(11) NOT NULL,
  `book` INT(11) NOT NULL,
  PRIMARY KEY (`wish`, `book`),
  INDEX `IDX_eed7ed8c5eff67ace222159340` (`wish` ASC) VISIBLE,
  INDEX `IDX_083335ca3e93664f956bc58b29` (`book` ASC) VISIBLE,
  CONSTRAINT `FK_083335ca3e93664f956bc58b290`
    FOREIGN KEY (`book`)
    REFERENCES `book4uapi`.`book` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_eed7ed8c5eff67ace222159340f`
    FOREIGN KEY (`wish`)
    REFERENCES `book4uapi`.`wish` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
