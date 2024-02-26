USE marketplace_db;
select * from proveedores;

-- Iniciar una transacción en la tabla 'productos'
START transaction;

-- Eliminar algunos registros en la tabla 'product' (o reemplazar por inserción si está vacía)
DELETE FROM proveedores WHERE id_proveedor = 1;
DELETE FROM proveedores WHERE id_proveedor = 2;
DELETE FROM proveedores WHERE id_proveedor = 3;

-- Comentar la sentencia Rollback (no ejecutar)
-- ROLLBACK;

-- Comentar la sentencia Commit (no ejecutar)
-- COMMIT;

-- INSERT INTO proveedores (id_proveedor,nombre, contacto, direccion, estado, info_financiera, tipo) VALUES
-- (1,'Proveedor A', 999888777, 'Calle Principal 123', 'Activo', 'Cuenta Bancaria: XXXX-XXXX-XXXX-XXXX', 'Electrónicos'),
-- (2,'Proveedor B', 888777666, 'Avenida Secundaria 456', 'Activo', 'Cuenta Bancaria: YYYY-YYYY-YYYY-YYYY', 'Ropa'),
-- (3,'Proveedor C', 777666555, 'Plaza Comercial 789', 'Inactivo', 'Cuenta Bancaria: ZZZZ-ZZZZ-ZZZZ-ZZZZ', 'Hogar');

-- Iniciar una transacción en la tabla 'review'
START transaction;

-- Insertar ocho nuevos registros de productos deportivos en la tabla 'product'
INSERT INTO productos (id_producto, nombre, descripcion, precio, cantidad,id_categoria) VALUES
(14, 'Auriculares Inalámbricos', 'Auriculares Bluetooth con cancelación de ruido', 79.99, 50, 1),
(15, 'Bicicleta de Montaña', 'Bicicleta todo terreno con suspensión', 499.95, 15, 2),
(16, 'Cámara DSLR Profesional', 'Cámara de alta resolución para fotografía profesional', 899.99, 10, 3),
(17, 'Mochila Impermeable', 'Mochila resistente al agua para actividades al aire libre', 45.50, 30, 4);

-- Agregar un savepoint después de la inserción del cuarto registro
savepoint savepoint4;

-- Continuar con la inserción de registros
INSERT INTO productos(id_producto,nombre,descripcion,precio,cantidad,id_categoria) VALUES
(18, 'Impresora Multifunción', 'Impresora que imprime, escanea y copia', 129.75, 20, 5),
(19, 'Teclado Gaming RGB', 'Teclado mecánico para juegos con retroiluminación RGB', 69.99, 25, 6),
(20, 'Silla Ergonómica de Oficina', 'Silla ajustable para una postura cómoda durante horas de trabajo', 149.95, 15, 7),
(21, 'Estuche de Maquillaje Profesional', 'Kit completo de maquillaje para uso profesional', 79.99, 20, 8);

-- Agregar un savepoint después de la inserción del octavo registro
savepoint savepoint8;

-- Comentar la sentencia para eliminar el savepoint de los primeros 4 registros insertados
-- ROLLBACK TO savepoint4;

select * from productos;