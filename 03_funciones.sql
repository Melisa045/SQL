USE marketplace_db;
-- 1. Obtener el historial del detalle de las compras por Usuario
DELIMITER //
CREATE FUNCTION obtener_historial_compras_por_usuario(usuario_id INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(255);
    SELECT GROUP_CONCAT(CONCAT('ID Historial: ', hc.id_historial, ', Fecha: ', hc.fecha, ', Estado: ', hc.estado, ', Productos: ', p.productos))
    INTO resultado
    FROM historial_compras hc
    JOIN (
        SELECT dh.id_historial, GROUP_CONCAT(p.nombre) AS productos
        FROM detalle_historial dh
        JOIN productos p ON dh.id_producto = p.id_producto
        GROUP BY dh.id_historial
    ) p ON hc.id_historial = p.id_historial
    WHERE hc.id_usuario = usuario_id;
    RETURN resultado;
END //
DELIMITER ;

select obtener_historial_compras_por_usuario(1);


-- 2.  Obtener productos en una categoría específica: Electrónicos,Ropa,Libros
DELIMITER //
CREATE FUNCTION obtener_productos_por_categoria(categoria_nombre VARCHAR(45)) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(255);
    SELECT GROUP_CONCAT(p.nombre) INTO resultado
    FROM productos p
    JOIN categorias c ON p.id_categoria = c.id_categoria
    WHERE c.nombre = categoria_nombre;
	RETURN resultado;
END //
DELIMITER ;

SELECT obtener_productos_por_categoria('Electrónicos') AS Resultado;


-- 3. Calcular Descuento Total de una promoción por Ordenes
DELIMITER //
CREATE FUNCTION calcular_descuento_total(orden_id INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE descuento_total DECIMAL(10, 2);
    SELECT SUM(p.descuento) INTO descuento_total
    FROM promociones p 
    JOIN ordenes_promociones op ON p.id_promocion= op.id_promocion
    JOIN ordenes o ON op.id_orden= o.id_orden
    WHERE o.id_orden = orden_id;
    RETURN descuento_total;
END //
DELIMITER ;

SELECT calcular_descuento_total(1);

