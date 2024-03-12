USE tienda;
/*Llista el nom de tots els productes que hi ha en la taula "producto".*/
SELECT NOMBRE FROM PRODUCTO;
/* Llista els noms i els preus de tots els productes de la taula "producto".*/
SELECT nombre , precio FROM producto;
/*Llista totes les columnes de la taula "producto".*/
SELECT * FROM producto;
/*Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).*/
SELECT nombre, precio, precio *1.18 as precioUSD FROM producto;
/*Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.*/
SELECT nombre AS "nom de producto", precio AS euros, precio*1.18 AS "dòlars nord-americans" FROM producto;
/* Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.*/
SELECT UPPER(nombre), precio FROM producto;
/*Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.*/
SELECT LOWER(nombre), precio FROM producto;
/*Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
SELECT nombre, UPPER(SUBSTRING(NOMBRE, 1, 2)) AS iniciales FROM fabricante;
/*(9)Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.*/
SELECT nombre, ROUND (precio, 0) AS precio_round FROM producto;
/*Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
SELECT nombre, TRUNCATE(precio, 0 ) AS precio_truncate FROM producto;
/*Llista el codi dels fabricants que tenen productes en la taula "producto".*/
SELECT codigo_fabricante FROM producto;
/*Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.*/
SELECT DISTINCT codigo_fabricante FROM producto;
/* 13 Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 Llista els noms dels fabricants ordenats de manera descendent.*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;
/* 15 Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
