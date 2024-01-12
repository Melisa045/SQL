
USE marketplace_db;

-- 1. Historial de compras por cada Usuario
CREATE OR REPLACE VIEW VistaUsuarioHistorial AS
SELECT u.id_usuario, u.tipo_documento, u.dni, u.nombre, u.apellido, u.correo, u.telefono, u.fecha_nacimiento,
       h.id_historial, h.fecha, h.estado
FROM usuarios u
JOIN historial_compras h ON u.id_usuario = h.id_usuario;

select * FROM VistaUsuarioHistorial;

-- 2. Detalle del historial de compras por carrito
CREATE OR REPLACE VIEW VistaCarritoDetalles AS
SELECT dc.id_detalle_carrito, dc.cantidad, dc.precio_total,
       c.id_carrito, c.fecha_creacion,
       p.id_producto, p.nombre AS nombre_producto, p.description,
       pr.id_proveedor, pr.nombre AS nombre_proveedor,
       COUNT(*) AS total_detalles,
       SUM(dc.precio_total * dc.cantidad) AS total_precio
FROM detalle_carrito dc
JOIN carrito c ON dc.id_carrito = c.id_carrito
JOIN productos p ON dc.id_producto = p.id_producto
JOIN proveedores pr ON dc.id_proveedor = pr.id_proveedor
GROUP BY dc.id_detalle_carrito, c.id_carrito, p.id_producto
ORDER BY c.fecha_creacion;

select * FROM VistaCarritoDetalles;

-- 3. Total de Ventas Por Categoría
CREATE VIEW VistaTotalVentasPorCategoria AS
SELECT c.id_categoria, c.nombre AS nombre_categoria,
       COUNT(dh.id_detalle_historial) AS total_ventas,
       SUM(dh.price * dh.cantidad) AS ingreso_total
FROM categorias c
LEFT JOIN productos p ON c.id_categoria = p.id_categoria
LEFT JOIN detalle_historial dh ON p.id_producto = dh.id_producto
GROUP BY c.id_categoria, c.nombre
ORDER BY ingreso_total DESC;

select * FROM VistaTotalVentasPorCategoria;


