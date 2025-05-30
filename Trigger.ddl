DELIMITER $$

CREATE TRIGGER trg_before_insert_reserva
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
  DECLARE p_unitario DECIMAL(10,2);
  DECLARE dias_anticipo INT;

 
  SELECT t.precio_x_noche INTO p_unitario
  FROM tipo_habitacion AS t
  JOIN habitacion AS h ON h.tp_habitacion = t.id
  WHERE h.id = NEW.habitacion_id;


  SET NEW.subtotal = NEW.noches * p_unitario;


  SET dias_anticipo = DATEDIFF(NEW.fecha_entrada, NEW.fecha_reserva);


  IF dias_anticipo >= 15 THEN
    SET NEW.descuento = ROUND(0.10 * NEW.subtotal, 2);
  ELSE
    SET NEW.descuento = 0;
  END IF;

  SET NEW.total = NEW.subtotal - NEW.descuento;
END$$

DELIMITER ;
