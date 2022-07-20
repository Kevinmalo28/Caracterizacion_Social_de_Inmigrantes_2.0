-- Un procedimiento almacenado donde se ingrese un país y muestre los datos de todos los ciudadanos extranjeros pertenecientes a ese país

CREATE OR REPLACE FUNCTION datos_inmigrante_pais (pais VARCHAR) 
    RETURNS TABLE (
		DATA_ID_DATOS_INMIGRANTE INTEGER,
		DATA_PASAPORTE VARCHAR,
		DATA_NOMBRES VARCHAR,
		DATA_APELLIDOS VARCHAR,
		DATA_FECHA_NACIMIENTO DATE,
		DATA_NACIONALIDAD VARCHAR,
		DATA_DOCUMENTO_IDENTIDAD VARCHAR,
		DATA_MENOR_EDAD BOOL,
		DATA_PARTIDA_NACIMIENTO VARCHAR,
		DATA_IDENTIDAD_GENERO VARCHAR,
		DATA_PROFESION VARCHAR
) 
AS $$
BEGIN
    RETURN QUERY select * from datos_inmigrante
	where
	nacionalidad = pais;
END; $$ 

LANGUAGE 'plpgsql';


select * from datos_inmigrante_pais('CHILE');