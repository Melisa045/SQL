
USE marketplace_db;

-- 1. 
-- Creación de la Tabla log de productos
CREATE TABLE IF NOT EXISTS log_productos
             (
                          log_id                     INT AUTO_INCREMENT PRIMARY KEY,
                          id_producto                INT NOT NULL,
                          usuario_modificacion       VARCHAR(50),
                          fecha_modificacion         DATE NOT NULL,
                          hora_modificacion  		 TIME NOT NULL,
						  accion_realizada           VARCHAR(255) NOT NULL,
                          columna_modificada         VARCHAR(255) NULL,
                          valor_anterior             VARCHAR(255) NULL,
                          valor_actual               VARCHAR(255) NULL
                        
             );



-- Creación de un Trigger BEFORE para Registrar Cambios en la tabla Productos en la Tabla de Log
DELIMITER //

CREATE TRIGGER before_update_log_productos
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
  INSERT INTO log_productos (id_producto, usuario_modificacion, fecha_modificacion, hora_modificacion, accion_realizada, valor_anterior, valor_actual)
  VALUES (NEW.id_producto, 'nombre_de_usuario', CURDATE(), CURTIME(), 'update', NEW.nombre, NEW.nombre);
END;
//
DELIMITER ;



-- Modificación de un Trigger AFTER para Registrar Cambios en la tabla Productos en la Tabla de Log
DELIMITER //
CREATE TRIGGER after_update_producto_log_trigger
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    DECLARE columna_modificada VARCHAR(255);
    DECLARE valor_anterior VARCHAR(255);
    DECLARE valor_actual VARCHAR(255);

    -- Determinar la columna modificada
    IF OLD.price <> NEW.price THEN
        SET columna_modificada = 'price';
        SET valor_anterior = OLD.price;
        SET valor_actual = NEW.price;
    ELSEIF OLD.cantidad <> NEW.cantidad THEN
        SET columna_modificada = 'cantidad';
        SET valor_anterior = OLD.cantidad;
        SET valor_actual = NEW.cantidad;
    ELSEIF OLD.description <> NEW.description THEN
        SET columna_modificada = 'description';
        SET valor_anterior = OLD.description;
        SET valor_actual = NEW.description;
    ELSEIF OLD.nombre <> NEW.nombre THEN
        SET columna_modificada = 'nombre';
        SET valor_anterior = OLD.nombre;
        SET valor_actual = NEW.nombre;
    END IF;

    -- Insertar en el log solo si alguna columna ha cambiado
    IF columna_modificada IS NOT NULL THEN
        INSERT INTO log_productos (id_producto, usuario_modificacion, fecha_modificacion, hora_modificacion, accion_realizada, columna_modificada, valor_anterior, valor_actual)
        VALUES (NEW.id_producto, CURRENT_USER(), CURDATE(), CURTIME(), 'After update', columna_modificada, valor_anterior, valor_actual);
    END IF;
END;
//
DELIMITER ;


-- 2. 
-- Creación de la Tabla log de usuarios
USE marketplace_db;

-- Crear tabla de log para usuarios
CREATE TABLE IF NOT EXISTS log_usuarios (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_anterior VARCHAR(255),
    valor_actual VARCHAR(255),
    fecha_modificacion DATE NOT NULL,
    hora_modificacion TIME NOT NULL
);

-- Crear trigger BEFORE UPDATE
DELIMITER //

CREATE TRIGGER before_update_log_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN
  IF NEW.tipo_documento <> OLD.tipo_documento THEN
    INSERT INTO log_usuarios (id_usuario, campo_modificado, valor_anterior, valor_actual, fecha_modificacion, hora_modificacion)
    VALUES (OLD.id_usuario, 'tipo_documento', OLD.tipo_documento, NEW.tipo_documento, CURDATE(), CURTIME());
  END IF;

  IF NEW.nroDoc <> OLD.nroDoc THEN
    INSERT INTO log_usuarios (id_usuario, campo_modificado, valor_anterior, valor_actual, fecha_modificacion, hora_modificacion)
    VALUES (OLD.id_usuario, 'nroDoc', OLD.nroDoc, NEW.nroDoc, CURDATE(), CURTIME());
  END IF;

END;
//
DELIMITER ;


-- Crear trigger AFTER INSERT
DELIMITER //

CREATE TRIGGER after_insert_log_usuarios
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
  INSERT INTO log_usuarios (id_usuario, campo_modificado, valor_anterior, valor_actual, fecha_modificacion,hora_modificacion)
  VALUES (NEW.id_usuario, 'nuevo_usuario_insertado', NULL, NULL, CURDATE(), CURTIME());
END;
//
DELIMITER ;

INSERT INTO usuarios (id_usuario,tipo_documento, nroDoc, nombre, apellido, correo, contrasena, telefono, fecha_nacimiento) VALUES
(11,'DNI', 123456111, 'José', 'Pérez', 'jose.perez@email.com', 'contraseña123', '987654321', '1990-05-15 00:00:00')


