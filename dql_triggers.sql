use el_universitario;

-- 1 ActualizarTotalAsignaturasProfesor: Al asignar una nueva asignatura a un profesor, actualiza el total de asignaturas impartidas por dicho profesor.
drop trigger if exists ActualizarTotalAsignaturasProfesor;
delimiter //
create trigger ActualizarTotalAsignaturasProfesor
after insert on asignatura
for each row
begin
end
// delimiter ;


-- 2 AuditarActualizacionAlumno: Cada vez que se modifica un registro de un alumno, guarda el cambio en una tabla de auditoría.
drop trigger if exists AuditarActualizacionAlumno;
delimiter //
create trigger AuditarActualizacionAlumno
after update on alumno
for each row
begin
insert into auditoria (id_alumno_actualizado,nif,nombre,apellido1,apellido2, ciudad,direccion,telefono,fecha_nacimiento,sexo)
values (old.id,old.nif,old.nombre,old.apellido1,old.apellido2, old.ciudad,old.direccion,old.telefono,old.fecha_nacimiento,old.sexo);
end
// delimiter ;

update alumno set ciudad = 'cucuta' where id = 2;


-- 3 RegistrarHistorialCreditos: Al modificar los créditos de una asignatura, guarda un historial de los cambios.

drop trigger if exists RegistrarHistorialCreditos;
delimiter //
create trigger RegistrarHistorialCreditos
after update on asignatura
for each row
begin
insert into asignatura_historial_cambios (id_asignatura,nombre,creditos)
values (new.id,new.nombre,new.creditos);
end
// delimiter ;

update asignatura set creditos = 8 where id = 3;


-- 4 NotificarCancelacionMatricula: Registra una notificación cuando se elimina una matrícula de un alumno.
drop trigger if exists NotificarCancelacionMatricula;
delimiter //
create trigger NotificarCancelacionMatricula
after delete on alumno_se_matricula_asignatura
for each row
begin
insert into matricula_cancelada (notificacion)
values (concat('se eliminó la matricula a la asignatura con el id ', old.id_asignatura , ' de el estudiante con el id ', old.id_alumno));
end
// delimiter ;

delete from alumno_se_matricula_asignatura where id_alumno = 1 and id_asignatura = 4 and id_curso_escolar = 1;