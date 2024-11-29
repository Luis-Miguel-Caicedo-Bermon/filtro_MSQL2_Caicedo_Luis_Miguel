use el_universitario;

-- 1 Encuentra el profesor que ha impartido más asignaturas en el último año académico.
select p.* , count(*) as cantidad_asignaturas_impartidas from profesor p 
inner join asignatura a on p.id = a.id_profesor group by 1 order by count(*) desc limit 1;

-- 2 Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
select d.* , count(*) as cantidad_asignaturas_impartidas from departamento d
inner join profesor p on d.id = p.id_departamento
inner join asignatura a on p.id = a.id_profesor group by 1 order by count(*) desc limit 5;

-- 3 Obtén el total de alumnos y docentes por departamento.
select d.* , count(p.id) , count(alu.id) as cantidad_asignaturas_impartidas from departamento d
inner join profesor p on d.id = p.id_departamento
inner join asignatura a on p.id = a.id_profesor
inner join alumno_se_matricula_asignatura asm on a.id = asm.id_asignatura
inner join alumno alu on asm.id_alumno = alu.id group by 1;


-- 4 Calcula el número total de alumnos matriculados en asignaturas de un género específico en un semestre determinado.
select count(*) as cantidad_alumnos_matriculados from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join asignatura a on asm.id_asignatura = a.id where al.sexo = 'H' and a.cuatrimestre = 1 group by al.id;

-- 5 Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.
-- 6 Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
select g.* , count(*) as cantidad_asignaturas from grado g inner join asignatura a on g.id = a.id_grado where a.cuatrimestre = 2 group by 1 limit 3 ;

-- 7 Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.
select p.* , count(*) from profesor p inner join asignatura a on p.id = a.id_profesor group by 1 order by count(*) asc limit 5;

-- 8 Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
select min( c.anyo_inicio - year(al.fecha_nacimiento)) as edad from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join curso_escolar c on asm.id_curso_escolar = c.id group by al.nombre;

-- 9 Encuentra los cinco profesores que han impartido más clases de un mismo grado.

-- 10 Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.

-- 11 Calcula el promedio de créditos de las asignaturas por grado.
select g.nombre , avg(a.creditos) from grado g inner join asignatura a on g.id = a.id_grado group by 1;

-- 12 Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.

-- 13 Muestra los alumnos que han cursado más asignaturas de un género específico.
select al.* , count(*) asignaturas_cursadas from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join asignatura a on asm.id_asignatura = a.id where al.sexo = 'H' group by 1;

-- 14 Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.

-- 15 Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.

-- 16 Calcula el total de asignaturas impartidas por cada profesor en el último semestre.
select p.* , count(*) as cantidad_asignaturas_impartidas from profesor p 
inner join asignatura a on p.id = a.id_profesor where a.cuatrimestre = 2 group by 1 order by 2 desc;

-- 17 Encuentra al alumno con la matrícula más reciente.
select al.nombre from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno;

-- 18 Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.

-- 19 Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.

-- 20 Lista los profesores que no han impartido clases en el último año académico.
