SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `propietarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `propietarios` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `documento` VARCHAR(20) NOT NULL ,
  `nombres` VARCHAR(45) NOT NULL ,
  `apellidos` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(50) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `correo` VARCHAR(60) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haciendas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `haciendas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(60) NOT NULL ,
  `hectareas` FLOAT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lotes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `lotes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(50) NOT NULL ,
  `fecha` DATE NOT NULL ,
  `haciendas_id` INT NOT NULL ,
  `propietarios_id` INT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_lotes_haciendas` (`haciendas_id` ASC) ,
  INDEX `fk_lotes_propietarios1` (`propietarios_id` ASC) ,
  CONSTRAINT `fk_lotes_haciendas`
    FOREIGN KEY (`haciendas_id` )
    REFERENCES `haciendas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lotes_propietarios1`
    FOREIGN KEY (`propietarios_id` )
    REFERENCES `propietarios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `especies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `especies` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(50) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `razas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `razas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `animales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `animales` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `observacion` VARCHAR(45) NOT NULL ,
  `peso` FLOAT NOT NULL ,
  `fecha` DATE NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `lotes_id` INT NOT NULL ,
  `raza_id` INT NOT NULL ,
  `especies_id` INT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_animales_lotes1` (`lotes_id` ASC) ,
  INDEX `fk_animales_raza1` (`raza_id` ASC) ,
  INDEX `fk_animales_especies1` (`especies_id` ASC) ,
  CONSTRAINT `fk_animales_lotes1`
    FOREIGN KEY (`lotes_id` )
    REFERENCES `lotes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animales_raza1`
    FOREIGN KEY (`raza_id` )
    REFERENCES `razas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animales_especies1`
    FOREIGN KEY (`especies_id` )
    REFERENCES `especies` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pesos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pesos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NOT NULL ,
  `peso` FLOAT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  `animales_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_pesos_animales1` (`animales_id` ASC) ,
  CONSTRAINT `fk_pesos_animales1`
    FOREIGN KEY (`animales_id` )
    REFERENCES `animales` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vacunas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `vacunas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dosis`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dosis` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha` VARCHAR(45) NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `ndosis` TINYINT NOT NULL ,
  `vacunas_id` INT NOT NULL ,
  `animales_id` INT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_dosis_vacunas1` (`vacunas_id` ASC) ,
  INDEX `fk_dosis_animales1` (`animales_id` ASC) ,
  CONSTRAINT `fk_dosis_vacunas1`
    FOREIGN KEY (`vacunas_id` )
    REFERENCES `vacunas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dosis_animales1`
    FOREIGN KEY (`animales_id` )
    REFERENCES `animales` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `categorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `categorias` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `unidades` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `sigla` VARCHAR(15) NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insumos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `insumos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(50) NOT NULL ,
  `stock` FLOAT NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `categoria_id` INT NOT NULL ,
  `unidades_id` INT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_insumos_categoria1` (`categoria_id` ASC) ,
  INDEX `fk_insumos_unidades1` (`unidades_id` ASC) ,
  CONSTRAINT `fk_insumos_categoria1`
    FOREIGN KEY (`categoria_id` )
    REFERENCES `categorias` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumos_unidades1`
    FOREIGN KEY (`unidades_id` )
    REFERENCES `unidades` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `controles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NOT NULL ,
  `cantidad` FLOAT NOT NULL ,
  `costo` DOUBLE NOT NULL ,
  `observacion` VARCHAR(55) NOT NULL ,
  `animales_id` INT NOT NULL ,
  `insumos_id` INT NOT NULL ,
  `created` TIMESTAMP NOT NULL ,
  `modified` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_controles_animales1` (`animales_id` ASC) ,
  INDEX `fk_controles_insumos1` (`insumos_id` ASC) ,
  CONSTRAINT `fk_controles_animales1`
    FOREIGN KEY (`animales_id` )
    REFERENCES `animales` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controles_insumos1`
    FOREIGN KEY (`insumos_id` )
    REFERENCES `insumos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `especies`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO especies (`id`, `nombre`, `descripcion`, `created`, `modified`) VALUES ('1', 'Vacas', 'Ganado vacuno', '2021-08-02:19:52:25', NULL);
INSERT INTO especies (`id`, `nombre`, `descripcion`, `created`, `modified`) VALUES ('2', 'Cerdo', 'Porcino', '2021-08-02:19:52:25', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `razas`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO razas (`id`, `nombre`, `created`, `modified`) VALUES ('1', 'Cebú', '2021-08-02:19:49:25', '');
INSERT INTO razas (`id`, `nombre`, `created`, `modified`) VALUES ('2', 'Angu Rojo', '2021-08-02:19:50:00', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `vacunas`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
INSERT INTO vacunas (`id`, `nombre`, `created`, `modified`) VALUES ('1', 'Anti Actosa', '2021-08-02:19:52:25', NULL);
INSERT INTO vacunas (`id`, `nombre`, `created`, `modified`) VALUES ('2', 'Abti Carbón', '2021-08-02:19:52:25', NULL);

COMMIT;
