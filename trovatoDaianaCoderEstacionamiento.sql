-- Base de datos para la gestión de un estacionamiento
-- Incluye sucursales, empleados, clientes y vehículos
-- ===============================
-- Creación de la base de datos
-- ===============================
CREATE DATABASE estacionamiento;
USE estacionamiento;

-- ===============================
-- Tabla: sucursal
-- ===============================
-- capacidad_max: cantidad máxima de vehículos que puede alojar la sucursal
-- La capacidad disponible se calcula dinámicamente
-- Una sucursal puede tener múltiples empleados y vehículos

CREATE TABLE sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    provincia VARCHAR(50) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    altura INT NOT NULL,
    capacidad_max INT NOT NULL
);

-- ===============================
-- Tabla: cliente
-- ===============================
-- Un cliente puede tener múltiples vehículos

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) UNIQUE NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

-- ===============================
-- Tabla: empleado
-- ===============================
-- tipo_contrato: define la modalidad laboral del empleado
-- Se utiliza ENUM para restringir los valores posibles

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    num_legajo VARCHAR(20) UNIQUE,
    dni VARCHAR(20) UNIQUE NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    antiguedad INT,
    tipo_contrato ENUM('prueba', 'efectivo_full', 'efectivo_part') NOT NULL,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);
-- ===============================
-- Tabla: auto
-- ===============================
-- En una misma sucursal, no puede haber dos autos en el mismo piso y plaza. Por eso utilizo UNIQUE compuesto.

CREATE TABLE auto (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    patente VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    color VARCHAR(50),
    piso INT NOT NULL,
    plaza INT NOT NULL,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),

    UNIQUE (id_sucursal, piso, plaza)
);