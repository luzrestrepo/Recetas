-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recetas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema recetas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recetas` DEFAULT CHARACTER SET utf8mb3 ;
USE `recetas` ;

-- -----------------------------------------------------
-- Table `recetas`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recetas`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `recetas`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recetas`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `instruction` VARCHAR(45) NULL DEFAULT NULL,
  `date_made` DATE NULL DEFAULT NULL,
  `under30` VARCHAR(45) NULL DEFAULT NULL,
  `recipescol` TINYINT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `recetas`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
