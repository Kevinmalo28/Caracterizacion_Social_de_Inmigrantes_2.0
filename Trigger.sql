-- Un trigger que impida el acceso de un inmigrante más de cinco veces en el mismo mes a un inmigrante. (Podría pensarse que está traficando)

create or replace function tg_ingresoveces() returns trigger
as
$tg_ingresoveces$
    declare
        cantidad integer;
begin
	SELECT COUNT(*) INTO cantidad FROM registro_migracion WHERE to_char(fecha_ingreso, 'YYYY') = to_char(new.fecha_ingreso, 'YYYY') AND to_char(fecha_ingreso, 'MM') = to_char(new.fecha_ingreso, 'MM') AND id_datos_inmigrante = new.id_datos_inmigrante;
        if(cantidad>=5) then
            raise exception 'El viajero no puede entrar registra 5 visitas en el mismo mes';
        end if;
        return new;
end;
$tg_ingresoveces$
language plpgsql;


create trigger tg_ingresoveces before insert
on registro_migracion for each row
execute procedure tg_ingresoveces();


INSERT INTO REGISTRO_MIGRACION(ID_REGISTRO_MIGRACION,ID_OFICINA,ID_DATOS_INMIGRANTE,ID_SITUACION_ECONOMICA,MOTIVO_SALIDA,OBJETIVO_ARRIBO,MEDIO_DE_INGRESO,FECHA_INGRESO,FECHA_SALIDA,UNIDAD_DE_CONTROL,CIUDAD_ACTUAL_RESIDENCIA,TIEMPO_ESTADIA,FECHA_REGISTRO) 

VALUES (12,'2','4','2','PASEO POR VACACIONES','VACACIONES','AEREO','2022-02-27','2022-03-20','AEROPUERTO','MANTA','1 MES','2022-03-03');