SELECT COUNT(*), oficina_migracion.ciudad  FROM  registro_migracion
INNER JOIN oficina_migracion
ON registro_migracion.id_oficina = oficina_migracion.id_oficina
GROUP BY oficina_migracion.id_oficina;