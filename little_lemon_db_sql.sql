-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(200) NOT NULL,
  `Adderss` VARCHAR(255) NOT NULL,
  `ConatctNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `AnnualSalary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNo` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_customerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_staffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_customerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `DeliveryPrice` DECIMAL NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`MenuItems` (
  `ItemID` INT NOT NULL,
  `CourseName` VARCHAR(100) NOT NULL,
  `Type` VARCHAR(100) NOT NULL,
  `Price` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Menu` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `MenuName` VARCHAR(100) NOT NULL,
  `Cuisine` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_ItemID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `fk_ItemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDM`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `BillAmount` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_bookingID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_deliveryID_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_menuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_customerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_bookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDM`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_deliveryID`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDM`.`Delivery` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDM`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customerID_orders`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
