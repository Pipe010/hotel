DELIMITER $$
CREATE PROCEDURE Bus_Habi_Dis(
  IN f_entrada DATE,
  IN f_salida  DATE
)
BEGIN
  SELECT  h.id, h.numero, t.capacidad, t.precio_x_noche FROM habitacion as h JOIN tipo_habitacion as t ON h.id = t.id WHERE NOT EXISTS (
    SELECT * FROM Reserva as r WHERE r.habitacion_id = h.id AND r.fecha_salida  > f_entrada AND r.fecha_entrada < f_salida )
	ORDER BY t.capacidad, h.numero;
END;$$
DELIMITER ;