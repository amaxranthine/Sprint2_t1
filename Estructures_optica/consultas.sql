/*Òptica:

Llista el total de compres d’un client/a.
Llista les diferents ulleres que ha venut un empleat durant un any.
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.*/

USE optica;

SELECT clients.nom, clients.cognom, COUNT(vendes.id_client) FROM clients INNER JOIN vendes ON clients.id_client = vendes.id_client
GROUP BY clients.nom, clients.cognom;


/*2*/
SELECT ulleres.marca, empleats.nom, YEAR(vendes.data_venda) 
FROM vendes 
INNER JOIN ulleres ON vendes.id_ulleres = ulleres.id_ulleres 
INNER JOIN empleats ON vendes.id_empleat = empleats.id_empleat 
WHERE empleats.id_empleat = 1 AND YEAR(vendes.data_venda) = 2023;


/*3*/

SELECT proveIdors.nom 
FROM proveIdors 
INNER JOIN ulleres ON proveIdors.id_prove = ulleres.id_prove
INNER JOIN vendes ON ulleres.id_ulleres = vendes.id_ulleres 
GROUP BY proveIdors.nom;
