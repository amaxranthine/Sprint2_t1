USE pizzeria;
/*/* Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat. */*/
SELECT botigues.localidad, SUM(productos_comanda.cantidad) AS cantidad_vendida
FROM productos JOIN productos_comanda ON productos.idProducto = productos_comanda.idProducto
JOIN comandes ON productos_comanda.idComanda = comandes.idComanda
JOIN botigues ON comandes.idBotiga = botigues.idBotiga
WHERE productos.tipo = 'bebida'
GROUP BY botigues.localidad;
/
/* Llista quantes comandes ha efectuat un determinat empleat/da.*/

SELECT empleados.nombre, empleados.idEmpleado, COUNT(comandes.idComanda) AS cantidad_comandas 
FROM empleados 
LEFT JOIN comandes ON comandes.idEmpleado = empleados.idEmpleado 
GROUP BY empleados.nombre;
