USE estacionamiento ;
-- ===============================
-- Vista 1
-- ===============================

CREATE VIEW vw_autos_clientes AS
SELECT
a.patente,
a.marca,
a.modelo,
c.nombre,
c.apellido,
c.dni
FROM auto a
JOIN cliente c ON a.id_cliente = c.id_cliente;

-- ===============================
-- Vista 2
-- ===============================

CREATE VIEW vw_autos_sucursal AS
SELECT
s.id_sucursal,
s.provincia,
s.localidad,
a.patente,
a.piso,
a.plaza
FROM sucursal s
JOIN auto a ON s.id_sucursal = a.id_sucursal;

-- ===============================
-- Vista 3
-- ===============================

CREATE VIEW vw_empleados_sucursal AS
SELECT
s.id_sucursal,
s.localidad,
e.nombre,
e.apellido,
e.tipo_contrato
FROM empleado e
JOIN sucursal s ON e.id_sucursal = s.id_sucursal;

-- ===============================
-- Funcion 1
-- ===============================

DELIMITER //

CREATE FUNCTION fn_cantidad_autos_cliente(cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE cantidad INT;

SELECT COUNT(*)
INTO cantidad
FROM auto
WHERE id_cliente = cliente_id;

RETURN cantidad;
END //
DELIMITER ;

-- ===============================
-- Funcion 2
-- ===============================

DELIMITER //

CREATE FUNCTION fn_autos_sucursal(sucursal_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE cantidad INT;

SELECT COUNT(*)
INTO cantidad
FROM auto
WHERE id_sucursal = sucursal_id;

RETURN cantidad;
END //

DELIMITER ;

-- ===============================
-- SP 1
-- ===============================
DELIMITER //

CREATE PROCEDURE sp_registrar_cliente(
IN p_dni VARCHAR(20),
IN p_apellido VARCHAR(50),
IN p_nombre VARCHAR(50)
)
BEGIN
INSERT INTO cliente (dni, apellido, nombre)
VALUES (p_dni, p_apellido, p_nombre);
END //

DELIMITER ;

-- ===============================
-- SP 2
-- ===============================

DELIMITER //

CREATE PROCEDURE sp_registrar_auto(
    IN p_patente VARCHAR(10),
    IN p_marca VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_color VARCHAR(50),
    IN p_piso INT,
    IN p_plaza INT,
    IN p_id_cliente INT,
    IN p_id_sucursal INT
)
BEGIN
    INSERT INTO auto 
    (patente, marca, modelo, color, piso, plaza, id_cliente, id_sucursal)
    VALUES 
    (p_patente, p_marca, p_modelo, p_color, p_piso, p_plaza, p_id_cliente, p_id_sucursal);
END //

DELIMITER ;

-- ===============================
-- SP 3
-- ===============================

DELIMITER //

CREATE PROCEDURE sp_autos_por_sucursal(
IN p_id_sucursal INT
)
BEGIN
SELECT *
FROM auto
WHERE id_sucursal = p_id_sucursal;
END //

DELIMITER ;

-- ===============================
-- Trigger y creacion de tabla log para su funcionamiento
-- ===============================

CREATE TABLE log_autos (
id_log INT AUTO_INCREMENT PRIMARY KEY,
patente VARCHAR(10),
fecha DATETIME
);

DELIMITER //

CREATE TRIGGER trg_log_auto
AFTER INSERT ON auto
FOR EACH ROW
BEGIN
INSERT INTO log_autos (patente, fecha)
VALUES (NEW.patente, NOW());
END //

DELIMITER ;
