DROP DATABASE IF EXISTS hotelregister;
CREATE DATABASE hotelregister;
use hotelregister;
CREATE TABLE cliente (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100),
	direccion VARCHAR(255),
	telefono BIGINT(19),
	email VARCHAR(100) UNIQUE
);

CREATE TABLE tipo_habitacion (
	id INT AUTO_INCREMENT PRIMARY KEY,
	capacidad TINYINT ,
	precio_x_noche DECIMAL(10,2)
);

CREATE TABLE habitacion (
	id INT AUTO_INCREMENT PRIMARY KEY,
	numero INT(10) UNIQUE,
	tp_habitacion INT
);

CREATE TABLE reserva (
	id INT AUTO_INCREMENT PRIMARY KEY,
	cliente_id INT ,
	habitacion_id INT,
	fecha_reserva DATE,
	fecha_entrada DATE,
	fecha_salida DATE,
	noches INT  GENERATED ALWAYS AS (DATEDIFF(fecha_salida, fecha_entrada)) STORED,
	subtotal   DECIMAL(10,2),
	descuento  DECIMAL(10,2),
	total  DECIMAL(10,2)
);
ALTER TABLE habitacion ADD CONSTRAINT FK_Habi_tp_Habi FOREIGN KEY (tp_habitacion) REFERENCES tipo_habitacion(id);
ALTER TABLE reserva ADD CONSTRAINT FK_Rese_Cli FOREIGN KEY (cliente_id) REFERENCES cliente(id);
ALTER TABLE reserva ADD CONSTRAINT FK_Rese_Habi FOREIGN KEY (habitacion_id) REFERENCES habitacion(id);