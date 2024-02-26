
USE marketplace_db;

-- 1. Historial de compras por cada Usuario
CREATE OR REPLACE VIEW view_historial_usuario AS
SELECT u.id_usuario, u.tipo_documento, u.numero_documento, u.nombre, u.apellido, u.correo, u.telefono, u.fecha_nacimiento,
       h.id_historial, h.fecha, h.estado
FROM usuarios u
JOIN historial_compras h ON u.id_usuario = h.id_usuario;

select * FROM view_historial_usuario;

-- 2. Detalle del historial de compras por carrito
CREATE OR REPLACE VIEW view_carrito_detalles AS
SELECT dc.id_detalle_carrito, dc.cantidad, dc.precio_unitario,
       c.id_carrito, c.fecha_creacion,
       p.id_producto, p.nombre AS nombre_producto, p.descripcion,
       pr.id_proveedor, pr.nombre AS nombre_proveedor,
       COUNT(*) AS total_detalles,
       SUM(dc.precio_unitario * dc.cantidad) AS total_precio
FROM detalle_carrito dc
JOIN carrito c ON dc.id_carrito = c.id_carrito
JOIN productos p ON dc.id_producto = p.id_producto
JOIN proveedores pr ON dc.id_proveedor = pr.id_proveedor
GROUP BY dc.id_detalle_carrito, c.id_carrito, p.id_producto
ORDER BY c.fecha_creacion;

select * FROM view_carrito_detalles;

-- 3. Total de Ventas Por Categoría
CREATE OR REPLACE VIEW vista_total_venta_por_categoria AS
SELECT c.id_categoria, c.nombre AS nombre_categoria,
       COUNT(dh.id_detalle_historial) AS total_ventas,
       SUM(dh.precio * dh.cantidad) AS ingreso_total
FROM categorias c
LEFT JOIN productos p ON c.id_categoria = p.id_categoria
LEFT JOIN detalle_historial dh ON p.id_producto = dh.id_producto
GROUP BY c.id_categoria, c.nombre
ORDER BY ingreso_total DESC;

select * FROM vista_total_venta_por_categoria;

-- 4. Ordenes en estado En proceso
CREATE OR REPLACE VIEW ordenes_pendientes AS
SELECT o.id_orden, o.fecha AS order_fecha,
       o.estado AS order_estado,c.fecha_creacion AS cart_fecha_creacion,
       u.nombre AS user_nombre, u.apellido AS user_apellido
FROM ordenes o
JOIN carrito c ON o.id_orden = c.id_orden
JOIN usuarios u ON c.id_orden = u.id_usuario
WHERE o.estado = 'En Proceso';

select * FROM ordenes_pendientes;

-- 5. Productos que tienen promociones

CREATE OR REPLACE VIEW productos_con_promociones AS
SELECT pr.nombre AS producto_nombre,pr.precio AS producto_precio,
       c.nombre AS category_nombre, prom.nombre AS promocion_nombre,
       prom.descuento AS promocion_descuento
FROM   productos pr
LEFT JOIN categorias c ON pr.id_categoria = c.id_categoria
LEFT JOIN promociones prom ON pr.id_producto = prom.id_producto OR pr.id_categoria = prom.id_categoria;


select * FROM productos_con_promociones;

