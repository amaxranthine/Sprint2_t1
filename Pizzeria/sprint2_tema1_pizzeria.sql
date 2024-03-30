
DROP DATABASE IF EXISTS Pizzeria;
CREATE SCHEMA IF NOT EXISTS Pizzeria DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE Pizzeria;

-- -----------------------------------------------------
-- Table `Pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS clientes (
  idCliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  direcc VARCHAR(45) NOT NULL,
  cdp VARCHAR(5) NOT NULL,
  localidad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  telf VARCHAR(9) NOT NULL,
  PRIMARY KEY (idCliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO clientes  (idCliente, nombre, apellidos, direcc, cdp, localidad, provincia, telf) VALUES
(6, 'Carlos', 'López Hernández', 'Calle Mayor 111', '46001', 'Valencia', 'Valencia', '987123654'),
(7, 'Sofía', 'Díaz Fernández', 'Avenida Libertad 222', '28010', 'Madrid', 'Madrid', '456321789'),
(8, 'David', 'García López', 'Calle del Sol 333', '41002', 'Sevilla', 'Sevilla', '789123456'),
(9, 'Elena', 'Martínez Pérez', 'Plaza España 444', '08003', 'Barcelona', 'Barcelona', '321789456'),
(10, 'Manuel', 'Ruiz Gómez', 'Calle Alcalá 555', '28005', 'Madrid', 'Madrid', '654321987');


-- -----------------------------------------------------
-- -- Crear tabla para tiendas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS botigues (
  idBotiga INT NOT NULL AUTO_INCREMENT,
  direcc VARCHAR(45) NOT NULL,
  cdp VARCHAR(5) NOT NULL,
  localidad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  PRIMARY KEY (idBotiga)
) ENGINE=InnoDB;

INSERT INTO botigues ( direcc, cdp, localidad, provincia)VALUES
('Carrer dels Arbres, 12', 08005, 'Barcelona', 'Barcelona'),
('Plaça de la Constitució, 7', 17004, 'Girona', 'Girona'),
('Avinguda del Paral·lel, 123', 08015, 'Barcelona', 'Barcelona'),
('Carrer de la Mar, 55', 43004, 'Tarragona', 'Tarragona'),
('Carrer Gran de Sant Joan, 67', 08010, 'Barcelona', 'Barcelona');

-- -----------------------------------------------------
-- Table `Pizzeria`.`empleats`
-- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS empleados (
  idEmpleado INT NOT NULL AUTO_INCREMENT,
  tipo_empleado ENUM('cocinero', 'repartidor') NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  nif VARCHAR(9) NOT NULL,
  telf VARCHAR(9) NOT NULL,
  idBotiga INT NOT NULL,
  PRIMARY KEY (idEmpleado),
  INDEX idx_idBotiga (idBotiga),
  CONSTRAINT fk_idBotiga
    FOREIGN KEY (idBotiga)
    REFERENCES botigues (idBotiga)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;
INSERT INTO empleados (tipo_empleado, nombre,  nif, telf, idBotiga)
VALUES
('cuiner', 'Juan', 'Martínez', '12345678A', 612345678, 1),
('repartidor', 'Pedro', 'García', '98765431B', 612345679, 2),
('cuiner', 'Laura', 'González', '45678923C', 612345680, 3),
('repartidor', 'María', 'Rodríguez', '32165487D', 612345681, 4),
('cuiner', 'Carlos', 'López', '78912356E', 612345682, 5),
('repartidor', 'Ana', 'Fernández', '65498721F', 612345683, 1),
('cuiner', 'David', 'Pérez', '23456789G', 612345684, 2),
('repartidor', 'Sofía', 'Gómez', '78901235H', 612345685, 3),
('cuiner', 'Elena', 'Ruiz', '56789123I', 612345686, 4),
('repartidor', 'Manuel', 'Hernández', '01245678J', 612345687, 5),
-- -----------------------------------------------------
-- Table `Pizzeria`.`comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comandes(
 idComanda INT NOT NULL PRIMARY KEY,
 fecha_hora TIMESTAMP NOT NULL,
 entrega ENUM('a domicilio', 'recoger') NOT NULL,
 precio_final DECIMAL(5,2) NOT NULL,
 idCliente INT NOT NULL,
 idEmpleado INT NULL,
 idBotiga INT  NOT NULL,
 
 INDEX idx_idCliente (idCliente),
 INDEX idx_idEmpleado (idEmpleado),
 INDEX idx_idBotiga (idBotiga),
 INDEX idx_entrega (entrega)
 CONSTRAINT fk_idClient FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
 CONSTRAINT fk_idEmpleat FOREIGN KEY (idEmpleado) REFERENCES empleats(idEmpleado),
 CONSTRAINT fk_idBotiga FOREIGN KEY (idBotiga) REFERENCES botigues(idBotiga)
)ENGINE = InnoDB;

INSERT INTO comandes(fecha_hora, entrega, precio_final , idCliente, idEmpleado, idBotiga)
VALUES
('2024-03-01 12:30:00', 'a domicilio', 23.50, 3, 7, 2),
('2024-03-01 13:45:00', 'recoger', 19.75, 9, NULL, 3),
('2024-03-01 14:30:00', 'a domicilio', 28.00, 6, 4, 1),
('2024-03-01 15:15:00', 'recoger', 22.80, 8, NULL, 2),
('2024-03-01 16:00:00', 'a domicilio', 25.90, 5, 10, 3),
('2024-03-01 17:30:00', 'recoger', 20.95, 2, NULL, 1),
('2024-03-01 18:15:00', 'a domicilio', 34.25, 1, 12, 5),
('2024-03-01 19:00:00', 'recoger', 25.60, 10, NULL, 4),
('2024-03-01 20:15:00', 'a domicilio', 28.75, 4, 9, 1),
('2024-03-01 21:00:00', 'recoger', 30.40, 11, NULL, 3),
('2024-03-02 12:30:00', 'a domicilio', 24.50, 12, 8, 4),
('2024-03-02 13:45:00', 'recoger', 20.75, 7, NULL, 5),
('2024-03-02 14:30:00', 'a domicilio', 27.00, 13, 6, 1),
('2024-03-02 15:15:00', 'recoger', 22.80, 10, NULL, 2),
('2024-03-02 16:00:00', 'a domicilio', 25.90, 9, 11, 3),

-- -----------------------------------------------------
-- Table `Pizzeria`.`categorias pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categorias_pizzas (
  idPizza INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  )
ENGINE = InnoDB;
INSERT INTO categorias_pizzas(idPizza, nombre)VALUES
(1, 'especiales'),
(2, 'sin gluten'),
(3, 'clasica'),

-- -----------------------------------------------------
-- Table `Pizzeria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS productos (
  idProducto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  descripción VARCHAR(100) NOT NULL,
  imagen BLOB(0) NOT NULL,
  precio_euros DECIMAL(5,2) NOT NULL,
  idPizza INT NULL,
  
  INDEX indx_idPizza (idPizza),
  CONSTRAINT idPizza
  FOREIGN KEY (idPizza)
  REFERENCES categories_pizzas (idPizza)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)ENGINE = InnoDB;

INSERT INTO productos (tipo, nombre, descripcion,  imagen, precio_euros, idPizza)
VALUES
('pizza', 'Capricciosa', 'Tomate, mozzarella, jamón, champiñones, alcachofas', 'img19.png', 12.50, 3),
('pizza', 'Prosciutto e Funghi', 'Tomate, mozzarella, jamón, champiñones', 'img20.png', 11.50, 4),
('pizza', 'Quattro Stagioni', 'Tomate, mozzarella, jamón, champiñones, alcachofas, aceitunas', 'img21.png', 13.00, 5),
('pizza', 'Diavola', 'Tomate, mozzarella, pepperoni, chiles picantes', 'img22.png', 12.50, 6),
('pizza', 'Rúcula y Parmesano', 'Tomate, mozzarella, rúcula, parmesano', 'img23.png', 11.00, 7),
('pizza', 'Bufala', 'Tomate, mozzarella de búfala, tomates cherry, albahaca', 'img24.png', 14.00, 8),
('pizza', 'Calzone', 'Tomate, mozzarella, jamón, champiñones, cerrada como un empanadilla', 'img25.png', 13.50, 9),
('pizza', 'Pesto', 'Tomate, mozzarella, pesto, tomates cherry', 'img26.png', 12.00, 10),
('beguda', 'Sprite', 'Refresco de lima-limón', 'img27.png', 2.50, NULL),
('beguda', 'Aquarius', 'Bebida isotónica de naranja', 'img28.png', 2.00, NULL),
('beguda', 'Limonada', 'Refresco de limón', 'img29.png', 2.50, NULL),
('beguda', 'Té Helado', 'Té frío con limón', 'img30.png', 2.00, NULL),
('beguda', 'Vino Tinto', 'Vino tinto de la casa', 'img31.png', 4.00, NULL),
('hamburguesa', 'Hamburguesa Doble', 'Doble carne, doble queso, lechuga, tomate', 'img32.png', 8.00, NULL),
('hamburguesa', 'Hamburguesa con Champiñones', 'Carne, champiñones salteados, queso suizo', 'img33.png', 6.00, NULL),
('hamburguesa', 'Hamburguesa de Salmón', 'Salmón a la plancha, salsa tártara, lechuga', 'img34.png', 7.50, NULL),
('hamburguesa', 'Hamburguesa Vegana', 'Hamburguesa de tofu con verduras', 'img35.png', 6.00, NULL),
('hamburguesa', 'Hamburguesa con Foie Gras', 'Carne, foie gras, cebolla caramelizada', 'img36.png', 9.00, NULL);


-- -----------------------------------------------------
-- Table productes comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS productes_comanda (
  idProducto INT NOT NULL,
  cantidad INT NOT NULL,
  idComanda INT NOT NULL,
  prec_total DECIMAL(5,2) NOT NULL,  
  INDEX cantidad_idx (cantidad),
  INDEX idComanda_idx (idComanda),
  
  CONSTRAINT prod1  
    FOREIGN KEY (idProducto)  
    REFERENCES productes (idProducto) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT idComanda  
    FOREIGN KEY (idComanda) 
    REFERENCES comandes (idComanda)  
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;
INSERT INTO productes_comanda (idProducto, cantidad, idComanda, prec_total)
VALUES
(10, 3, 4, 35.50),
(5, 2, 7, 22.00),
(8, 1, 9, 15.75),
(3, 4, 12, 36.00),
(6, 2, 15, 27.00),
(2, 3, 18, 21.00),
(7, 1, 21, 12.50),
(4, 2, 24, 18.50),
(9, 3, 27, 33.75);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;