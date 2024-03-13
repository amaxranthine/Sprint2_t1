/*tienda*/
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
SELECT nombre, nombre FROM producto ORDER BY nombre ASC, precio DESC;
/*16.Retorna una llista amb les 5 primeres files de la taula "fabricante".*/
SELECT * FROM fabricante LIMIT 5;
/*17 Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.*/
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
/* 18 Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY*/
SELECT nombre , precio  FROM producto ORDER BY precio ASC LIMIT 1;
/*19.Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). */
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
/*21Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*22*/SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
/* 23 */ SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.*/
SELECT producto.nombre,  producto.precio,  fabricante.nombre FROM producto INNER JOIN  fabricante ON
/* 25 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
/* 26 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo";
/* 27 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Crucial" AND producto.precio > 200;
/* 28 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";
/* 29 */ SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ("Asus","Hewlett-Packard","Seagate");
/* 30 */ SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
/* 31 */ SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante on producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
/* 32 */ SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
/* 33 */ SELECT DISTINCT producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 35 */SELECT fabricante.nombre , producto.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo IS null;

/*posible a resolver mas tarde

Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
Llista el nom del producte més car del fabricant Lenovo.
Llista el nom del producte més barat del fabricant Hewlett-Packard.
Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.*/
