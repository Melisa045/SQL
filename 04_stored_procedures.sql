
USE marketplace_db;

-- 1. Calcular el Monto total por Orden
DELIMITER //
CREATE PROCEDURE calcular_total_orden(IN orden_id INT)
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(do.precio_unitario*do.cantidad) INTO total
    FROM detalle_orden do
    WHERE do.id_orden = orden_id;

    SELECT total AS TotalOrden;
END //
DELIMITER ;

CALL calcular_total_orden(1);
select * from detalle_orden;


-- 2. Realizar el orden de una data Escogiendo el Nombre de la tabla, La Columna y Orden que se mostrará
DELIMITER //
CREATE PROCEDURE ordenar_tabla(
    IN p_nombre_tabla VARCHAR(255),
    IN p_campo_ordenamiento VARCHAR(255),
    IN p_orden VARCHAR(4)
)
BEGIN
    SET @sql_query = CONCAT('SELECT * FROM ', p_nombre_tabla, ' ORDER BY ', p_campo_ordenamiento, ' ', p_orden);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL ordenar_tabla('comentarios','estado','DESC');


-- 3. Eliminar un item del carrito de compras
DELIMITER //
CREATE PROCEDURE eliminar_item_carrito(IN carrito_id INT, IN detalle_carrito_id INT)
BEGIN
    DECLARE existe_carrito INT;

    SELECT COUNT(*) INTO existe_carrito
    FROM carrito
    WHERE id_carrito = carrito_id;

    -- Si el carrito existe, eliminar el detalle del carrito
    IF existe_carrito > 0 THEN
        DELETE FROM detalle_carrito
        WHERE id_detalle_carrito = detalle_carrito_id;

        SELECT 'Item eliminado del carrito correctamente.' AS mensaje;
    ELSE
        SELECT 'El carrito especificado no existe.' AS mensaje;
    END IF;
END //

DELIMITER ;

CALL eliminar_item_carrito(10, 10);
select * from detalle_carrito;

-- 4. Crear un item del carrito de compras
DELIMITER //
CREATE PROCEDURE agregar_item_carrito(
    IN carrito_id INT,
    IN producto_id INT,
    IN cantidad INT,
    IN precio_unitario DECIMAL(10, 2)
)
BEGIN
    DECLARE existe_carrito INT;

    -- Verificar si el carrito existe
    SELECT COUNT(*) INTO existe_carrito
    FROM carrito
    WHERE id_carrito = carrito_id;

    -- Si el carrito existe, agregar el detalle al carrito
    IF existe_carrito > 0 THEN
        INSERT INTO detalle_carrito (id_carrito, id_producto, cantidad, precio_unitario)
        VALUES (carrito_id, producto_id, cantidad, precio_unitario);

        SELECT 'Item agregado al carrito correctamente.' AS mensaje;
    ELSE
        SELECT 'El carrito especificado no existe.' AS mensaje;
    END IF;
END //
DELIMITER ;

CALL agregar_item_carrito(10, 7,3, 29.95);
select * from detalle_carrito;