USE estacionamiento;
INSERT INTO sucursal (provincia, localidad, direccion, altura, capacidad_max) VALUES
('Buenos Aires', 'La Plata', 'Calle 7', 123, 100),
('Buenos Aires', 'Quilmes', 'Av. Mitre', 456, 80),
('Córdoba', 'Córdoba Capital', 'Av. Colón', 789, 120),
('Santa Fe', 'Rosario', 'Av. Pellegrini', 321, 90),
('Mendoza', 'Godoy Cruz', 'San Martín', 654, 70),
('Tucumán', 'San Miguel', 'Av. Roca', 987, 60),
('Salta', 'Salta Capital', 'Belgrano', 159, 50),
('Neuquén', 'Neuquén Capital', 'Av. Argentina', 753, 85),
('Chaco', 'Resistencia', 'Av. Sarmiento', 852, 65),
('Entre Ríos', 'Paraná', 'Urquiza', 951, 75);

INSERT INTO cliente (dni, apellido, nombre) VALUES
('30111222', 'Gomez', 'Juan'),
('28999888', 'Perez', 'Maria'),
('31222333', 'Lopez', 'Carlos'),
('33444555', 'Fernandez', 'Ana'),
('35666777', 'Martinez', 'Luis'),
('37888999', 'Sanchez', 'Lucia'),
('40111222', 'Diaz', 'Pedro'),
('42333444', 'Torres', 'Sofia'),
('44555666', 'Ramirez', 'Diego'),
('46777888', 'Flores', 'Valentina');

INSERT INTO empleado (num_legajo, dni, apellido, nombre, antiguedad, tipo_contrato, id_sucursal) VALUES
('E001', '20111222', 'Ruiz', 'Martin', 5, 'efectivo_full', 1),
('E002', '20222333', 'Castro', 'Laura', 3, 'efectivo_part', 2),
('E003', '20333444', 'Morales', 'Jorge', 2, 'prueba', 3),
('E004', '20444555', 'Ortiz', 'Carla', 4, 'efectivo_full', 4),
('E005', '20555666', 'Silva', 'Pablo', 1, 'prueba', 5),
('E006', '20666777', 'Rojas', 'Elena', 6, 'efectivo_full', 6),
('E007', '20777888', 'Navarro', 'Diego', 2, 'efectivo_part', 7),
('E008', '20888999', 'Molina', 'Andrea', 3, 'efectivo_full', 8),
('E009', '20999000', 'Herrera', 'Sergio', 7, 'efectivo_full', 9),
('E010', '21000111', 'Vega', 'Paula', 1, 'prueba', 10);

INSERT INTO auto (patente, marca, modelo, color, piso, plaza, id_cliente, id_sucursal) VALUES
('AA123BB', 'Toyota', 'Corolla', 'Blanco', 1, 1, 1, 1),
('AB234CD', 'Ford', 'Focus', 'Negro', 1, 2, 2, 2),
('AC345DE', 'Chevrolet', 'Cruze', 'Gris', 2, 1, 3, 3),
('AD456EF', 'Volkswagen', 'Golf', 'Rojo', 2, 2, 4, 4),
('AE567FG', 'Peugeot', '208', 'Azul', 3, 1, 5, 5),
('AF678GH', 'Renault', 'Clio', 'Blanco', 3, 2, 6, 6),
('AG789HI', 'Fiat', 'Cronos', 'Negro', 1, 3, 7, 7),
('AH890IJ', 'Honda', 'Civic', 'Gris', 2, 3, 8, 8),
('AI901JK', 'Nissan', 'Sentra', 'Azul', 3, 3, 9, 9),
('AJ012KL', 'Hyundai', 'Elantra', 'Rojo', 1, 4, 10, 10);