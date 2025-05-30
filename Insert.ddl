INSERT INTO tipo_habitacion (capacidad, precio_x_noche)
VALUES (1,  50.00),(2,  80.00),(3, 120.00),(4, 150.00);

INSERT INTO habitacion (numero,tp_habitacion)
VALUES ('101', 1),('102', 1),('201', 2),('202', 2),('301', 3),('401', 4);

INSERT INTO cliente (nombre, direccion, telefono, email)
VALUES ('Maria Mendez', 'Calle Falsa 123', '3001234567', 'Mariamendez270@gmail.com'),
       ('Pedro Pascal','Av. Siempre Viva 456', '3007654321','Pedropascal2006@gmail.com');

INSERT INTO Reserva (cliente_id, habitacion_id, fecha_reserva, fecha_entrada, fecha_salida)
VALUES  (1,1, '2023-07-03', '2023-07-05', '2023-08-01'), 
		(2,2, '2023-07-03', '2023-06-18', '2023-07-25');  

CALL Bus_Habi_Dis('2023-07-10', '2023-07-18');