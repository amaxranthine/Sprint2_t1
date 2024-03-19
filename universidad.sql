USE universidad;
/*1*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2*/ SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS null;
/*3*/ SELECT * FROM persona WHERE tipo ='alumno' AND YEAR (fecha_nacimiento) = 1999;
/*4*/SELECT * FROM profesor WHERE tipo = 'profesor' AND telefono IS null AND nif LIKE '%k';
/*5*/SELECT * FROM asignatura WHERE id_grado = 7 AND curso = 3 AND cuatrimestre = 1;
/*6*/ SELECT persona.apellido1, persona.apellido2 , persona.nombre, departamento.nombre FROM profesor INNER JOIN persona ON profesor.id_profesor INNER JOIN departamento ON  profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre  ASC;
/*7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona INNER JOIN alumno_se_matricula
/*8*/ SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON grado.id = asignatura.id_grado WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND asignatura.id_profesor IS NOT NULL;
/* 9 */ SELECT * FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.id = 5 AND persona.tipo = 'alumno';
/* clàusules LEFT JOIN i RIGHT JOIN */

/*10*/SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN departamento ON profesor.id_profesor = departamento.id WHERE asignatura.id_profesor IS NULL;
/*11*/SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE  persona.tipo = 'profesor' AND profesor.id_profesor IS NULL;
/*12*/SELECT departamento.nombre FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento AND profesor.id_profesor IS NULL;
/*13*/SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;
/*14*/ SELECT asignatura.nombre FROM asignatura LEFT JOIN persona ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
/*15*/ SELECT departamento.id_departamento, departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN asignatura ON asignatura.id_profesor =profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

/*Consultes resum:*/
/*1*/ SELECT * FROM persona WHERE tipo ='alumno';
/*2*/SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/*3*/ SELECT departamento.nombre, COUNT(profesor.id_profesor) AS num_profesores FROM departamento INNER JOIN profesor ON departamento.id =profesor.id_departamento GROUP BY departamento.nombre ORDER BY num_profesores ASC;
/*4*/SELECT departamento.nombre, COUNT(profesor.id_profesor) AS num_profesores FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
/*5*/ SELECT grado.nombre, COUNT(asignatura.nombre) AS num_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY num_asignaturas DESC;
/*6*/ SELECT grado.nombre, COUTN(asignatura.nombre) AS num_asignaturas FROM grado INNER JOIN asignatura ON grdo.id = asignatura.id_grado GROUP BY grado.nombre HAVING num_asignaturas > 40;
/*7*/SELECT grado.nombre , asignatura.tipo, SUM(asignatura_creditos) AS suma_creditos FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre , asignatura.tipo;
/*8*/SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS num_alumnos FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id= alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
/*9*/SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) AS num_asignaturas FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY num_asignaturas DESC;
/*10 */ SELECT * FORM persona WHERE fecha_nacimiento =  (SELECT MAX(fecha_nacimiento) FROM persona);
/*

.

*/ 