DROP DATABASE IF EXISTS optica;
CREATE SCHEMA IF NOT EXISTS optica CHARACTER SET utf8;
USE optica;

CREATE TABLE proveIdors (
  id_prove int PRIMARY KEY AUTO_INCREMENT,
  nom varchar(45) NOT NULL,
  carrer varchar(45) NOT NULL,
  num int NOT NULL,
  pis int,
  porta int,
  ciutat varchar(45) NOT NULL,
  país varchar(45) NOT NULL,
  telèfon int NOT NULL,
  fax int,
  nif varchar(45) NOT NULL
);

CREATE TABLE clients (
  id_client int PRIMARY KEY AUTO_INCREMENT,
  nom varchar(45) NOT NULL,
  cognom varchar(45) NOT NULL,
  adreça varchar(45) NOT NULL,
  telf int NOT NULL,
  email varchar(45) NOT NULL,
  data_registre date NOT NULL,
  recomana int
);

CREATE TABLE ulleres (
  id_ulleres int PRIMARY KEY AUTO_INCREMENT,
  marca varchar(45) NOT NULL,
  grad_esquerra float NOT NULL,
  grad_dret float NOT NULL,
  muntura enum('a aire', 'pasta', 'metall') NOT NULL,
  color_munt varchar(45) NOT NULL,
  color_esquerre varchar(45) NOT NULL,
  color_dret varchar(45) NOT NULL,
  id_prov int NOT NULL
);

CREATE TABLE empleats (
  id_empleat int PRIMARY KEY AUTO_INCREMENT,
  nom varchar(45)
);

CREATE TABLE periode_vendes (
  id_periode int PRIMARY KEY AUTO_INCREMENT,
  mes_inici varchar(45) NOT NULL,
  mes_final varchar(45) NOT NULL
);

CREATE TABLE vendes (
  id_venda int PRIMARY KEY AUTO_INCREMENT,
  id_client int,
  id_ulleres int,
  id_empleat int,
  periode int
);

/*Proveidors*/

INSERT INTO proveIdors VALUES (1, 'VISTAOPTICA', 'Avenida ', 10, 3, 1, 'Barcelona', 'Espanya', 123456789, 93555556, 'R4577894A');
INSERT INTO proveIdors VALUES (2, 'MACROSTOCKS', 'Boulevard ', 42, 2, NULL, 'Castilla y Leon', 'Espanya',246813579, 935046034, 'H31307861');
INSERT INTO proveIdors VALUES (3, 'PROSUN', 'Sort', 73, 1, NULL, 'Barcelona', 'Espanya', 930625988, 135792468, 'V70059183');

/*Clients*/
INSERT INTO clients VALUES(1,'Lia','Sanchez','Calle Mayor, 123, Madrid', 666123456, 'cmartinez@mail.com', '2023-01-15', NULL);
INSERT INTO clients VALUES(2,'Joan','Smith','Avenida Libertad, 67, Valencia', 667987654, 'lSmith@mail.com', '2022-02-20', 1);
INSERT INTO clients VALUES(3,'Ana','Badia','Plaza España, 5, Sevilla', 668555444, 'Abadia@mail.com', '2023-04-10', NULL);
INSERT INTO clients VALUES(4,'Mar','Cruz','Paseo del Prado, 10, Madrid', 667111000, 'mCruz@mail.com', '2020-09-08', 4);
INSERT INTO clients VALUES(5,'Pedro','López','Calle Granada, 8, Málaga', 669333222, 'Plopez@mail.com', '2019-06-25', 2);

/*Ulleres*/
INSERT INTO ulleres VALUES (1, 'Vogue', 2.0, 1.8, 'metall', 'plata', 'blanco', 'negro', 1);
INSERT INTO ulleres VALUES (2, 'Dior', 1.7, 1.3, 'pasta', 'negra', 'azul', 'verde', 3);
INSERT INTO ulleres VALUES (3, 'Gucci', 0.5, 0.8, 'a l\''aire', 'dorado', 'rojo', 'amarillo', 3);
INSERT INTO ulleres VALUES (4, 'Armani', 3.0, 3.0, 'pasta', 'azul', 'blanco', 'azul', 2);
INSERT INTO ulleres VALUES (5, 'Prada', 2.2, 2.5, 'metall', 'negro', 'plata', 'negro', 2);

/*Empleats*/
INSERT INTO empleats VALUES (1, 'Sara');
INSERT INTO empleats VALUES (2, 'Martina');
INSERT INTO empleats VALUES (3, 'Antoni');
/*Periode vendes*/
INSERT INTO periode_vendes VALUES (1, 'març', 'abril');
INSERT INTO periode_vendes VALUES (2, 'juny', 'juliol');
INSERT INTO periode_vendes VALUES (3, 'juliol', 'setembre');
INSERT INTO periode_vendes VALUES (4, 'gener', 'març');
/*vendes*/
INSERT INTO vendes VALUES (1, 1, 5, 1, 1);
INSERT INTO vendes VALUES (2, 2, 2, 2, 1);
INSERT INTO vendes VALUES (3, 3, 3, 1, 2);
INSERT INTO vendes VALUES (4, 4, 1, 2, 3);
INSERT INTO vendes VALUES (5, 5, 4, 3, 4);