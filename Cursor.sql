-- Un cursor que muestre la cantidad de niños que emigraron en determinado año

do $$
declare
		cont int = 0;
		num int;
		tabla record;
		cantidad_ninos_inmigrantes cursor for select * from datos_inmigrante,registro_migracion
		where datos_inmigrante.menor_edad = true and  to_char(registro_migracion.fecha_ingreso, 'YYYY')= '2022' and registro_migracion.id_datos_inmigrante=datos_inmigrante.id_datos_inmigrante;
begin
		for num in cantidad_ninos_inmigrantes
		loop
		cont = cont + count(num.id_datos_inmigrante);
		end loop;
open cantidad_ninos_inmigrantes;
fetch cantidad_ninos_inmigrantes into tabla;
Raise notice 'Cantidad: %', cont;
end $$
language 'plpgsql';
