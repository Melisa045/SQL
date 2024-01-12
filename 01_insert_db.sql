
INSERT INTO usuarios (id_usuario,tipo_documento, dni, nombre, apellido, correo, contrasena, telefono, fecha_nacimiento) VALUES
(1,'DNI', 123456789, 'Juan', 'Pérez', 'juan.perez@email.com', 'contraseña123', '987654321', '1990-05-15 00:00:00'),
(2,'Pasaporte', 987654321, 'Ana', 'Gómez', 'ana.gomez@email.com', 'clave_segura', '654321987', '1985-08-22 00:00:00'),
(3,'DNI', 567890123, 'Pedro', 'Martínez', 'pedro.martinez@email.com', 'password123', '789012345', '1992-02-10 00:00:00'),
(4,'Carné de Identidad', 456789012, 'Laura', 'García', 'laura.garcia@email.com', 'seguridad456', '012345678', '1988-11-30 00:00:00'),
(5,'DNI', 345678901, 'Miguel', 'López', 'miguel.lopez@email.com', 'contraseña456', '345678901', '1995-07-05 00:00:00'),
(6,'Pasaporte', 234567890, 'Carolina', 'Sánchez', 'carolina.sanchez@email.com', 'clave_segura789', '567890123', '1998-04-18 00:00:00'),
(7,'DNI', 876543210, 'Daniel', 'Fernández', 'daniel.fernandez@email.com', 'secure_pass', '678901234', '1983-09-12 00:00:00'),
(8,'Carné de Identidad', 765432109, 'Isabel', 'Díaz', 'isabel.diaz@email.com', 'password789', '890123456', '1991-12-25 00:00:00'),
(9,'DNI', 654321098, 'Lucas', 'Hernández', 'lucas.hernandez@email.com', 'contraseña789', '901234567', '1980-06-08 00:00:00'),
(10,'Pasaporte', 543210987, 'María', 'Jiménez', 'maria.jimenez@email.com', 'seguro_pass', '234567890', '1987-03-03 00:00:00');


INSERT INTO historial_compras (id_historial, fecha, estado, id_usuario) VALUES
(1, '2024-06-01 10:15:00', 'Completado', 1),
(2, '2024-06-02 12:30:00', 'Pendiente', 2),
(3, '2024-06-03 14:45:00', 'Cancelado', 3),
(4, '2024-06-04 09:00:00', 'Completado', 4),
(5, '2024-06-05 11:20:00', 'Pendiente', 5),
(6, '2024-06-06 16:00:00', 'Completado', 6),
(7, '2024-06-07 08:45:00', 'Cancelado', 7),
(8, '2024-06-08 13:10:00', 'Completado', 8),
(9, '2024-06-09 15:30:00', 'Pendiente', 9),
(10, '2024-06-10 10:00:00', 'Completado', 10);


INSERT INTO categorias (id_categoria, nombre,descripcion,fecha_creacion) VALUES 
(1, 'Electrónicos','Productos electrónicos como teléfonos, computadoras y accesorios',NOW()),
(2, 'Ropa','Ropa de moda para hombres, mujeres y niños',NOW()),
(3, 'Hogar y Jardín','Artículos para el hogar, muebles y suministros de jardinería.',NOW()),
(4, 'Deportes','Equipos y accesorios para deportes y actividades al aire libre.',NOW()),
(5, 'Libros','Libros de diversas categorías',NOW()),
(6, 'Juguetes','Juguetes para niños de todas las edades',NOW()),
(7, 'Joyería','Joyas y accesorios',NOW()),
(8, 'Alimentación','Productos alimenticios y gourmet',NOW()),
(9, 'Salud y Belleza','Productos para el cuidado personal',NOW()),
(10, 'Automotriz','Accesorios y productos para automóviles',NOW());


INSERT INTO productos (id_producto, nombre, description, price, cantidad) VALUES
(1, 'Smartphone X', 'Potente smartphone con cámara dual', 599.99, 50),
(2, 'Camiseta de Algodón', 'Camiseta cómoda y de alta calidad', 19.99, 100),
(3, 'Juego de Sartenes', 'Set de sartenes antiadherentes', 89.95, 30),
(4, 'Balón de Fútbol', 'Balón oficial para partidos', 29.99, 20),
(5, 'Libro "Aventuras en el Espacio"', 'Novela de ciencia ficción', 14.50, 80),
(6, 'Muñeca Interactiva', 'Muñeca que habla y realiza acciones', 39.99, 15),
(7, 'Collar de Diamantes', 'Collar elegante con diamantes', 499.99, 10),
(8, 'Pack de Snacks Saludables', 'Variado pack de snacks saludables', 29.95, 50),
(9, 'Kit de Cuidado Facial', 'Productos para el cuidado facial', 59.99, 25),
(10, 'Limpiaparabrisas Universal', 'Limpiaparabrisas de calidad para automóviles', 12.75, 40);


INSERT INTO detalle_historial (price, cantidad, comentario, id_historial, id_usuario, id_producto, id_categoria) VALUES
(59.99, 2, 'Buena compra', 1, 3, 1, 1),
(19.99, 1, 'Talla correcta', 1, 2, 2, 2),
(89.95, 1, 'Excelente calidad', 1, 1, 3, 3),
(29.99, 3, 'Divertido para jugar en equipo', 2, 4, 4, 4),
(14.50, 1, 'Interesante trama', 2, 3, 5, 5),
(39.99, 1, 'Ideal para regalar', 3, 1, 6, 6),
(499.99, 1, 'Muy elegante', 3, 2, 7, 7),
(29.95, 2, 'Deliciosos snacks', 4, 4, 8, 8),
(59.99, 1, 'Noté mejoras en mi piel', 4, 3, 9, 9),
(12.75, 1, 'Fácil instalación', 5, 1, 10, 10);

  
INSERT INTO proveedores (id_proveedor,nombre, contacto, direccion, estado, info_financiera, tipo) VALUES
(1,'Proveedor A', 999888777, 'Calle Principal 123', 'Activo', 'Cuenta Bancaria: XXXX-XXXX-XXXX-XXXX', 'Electrónicos'),
(2,'Proveedor B', 888777666, 'Avenida Secundaria 456', 'Activo', 'Cuenta Bancaria: YYYY-YYYY-YYYY-YYYY', 'Ropa'),
(3,'Proveedor C', 777666555, 'Plaza Comercial 789', 'Inactivo', 'Cuenta Bancaria: ZZZZ-ZZZZ-ZZZZ-ZZZZ', 'Hogar'),
(4,'Proveedor D', 666555444, 'Calle Peatonal 101', 'Activo', 'Cuenta Bancaria: WWWW-WWWW-WWWW-WWWW', 'Deportes'),
(5,'Proveedor E', 555444333, 'Calle de los Libros 202', 'Inactivo', 'Cuenta Bancaria: VVVV-VVVV-VVVV-VVVV', 'Libros'),
(6,'Proveedor F', 444333222, 'Esquina de los Juguetes 303', 'Activo', 'Cuenta Bancaria: UUUU-UUUU-UUUU-UUUU', 'Juguetes'),
(7,'Proveedor G', 333222111, 'Avenida de las Joyas 404', 'Activo', 'Cuenta Bancaria: TTTT-TTTT-TTTT-TTTT', 'Joyería'),
(8,'Proveedor H', 222111000, 'Calle de los Alimentos 505', 'Inactivo', 'Cuenta Bancaria: SSSS-SSSS-SSSS-SSSS', 'Alimentación'),
(9,'Proveedor I', 111000999, 'Paseo de la Salud 606', 'Activo', 'Cuenta Bancaria: RRRR-RRRR-RRRR-RRRR', 'Salud y Belleza'),
(10,'Proveedor J', 999000888, 'Bulevar Automotriz 707', 'Activo', 'Cuenta Bancaria: QQQQ-QQQQ-QQQQ-QQQQ', 'Automotriz');


INSERT INTO promociones (id_promocion, nombre, descuento, fecha_inicio, fecha_fin, id_producto, id_categoria, id_proveedor) VALUES
(1, 'Oferta Verano', 0.15, '2024-06-01 00:00:00', '2024-06-30 23:59:59', 1, 1, 1),
(2, 'Descuento Ropa', 0.20, '2024-07-01 00:00:00', '2024-07-15 23:59:59', 2, 2, 2),
(3, 'Liquidación Hogar', 0.30, '2024-08-01 00:00:00', '2024-08-31 23:59:59', 3, 3, 3),
(4, 'Especial Deportes', 0.25, '2024-09-01 00:00:00', '2024-09-15 23:59:59', 4, 4, 4),
(5, 'Promo Libros', 0.18, '2024-10-01 00:00:00', '2024-10-31 23:59:59', 5, 5, 5),
(6, 'Juguetes Rebajados', 0.22, '2024-11-01 00:00:00', '2024-11-15 23:59:59', 6, 6, 6),
(7, 'Descuento Joyería', 0.15, '2024-12-01 00:00:00', '2024-12-31 23:59:59', 7, 7, 7),
(8, 'Oferta Alimentación', 0.25, '2025-01-01 00:00:00', '2025-01-15 23:59:59', 8, 8, 8),
(9, 'Cuidado Facial en Oferta', 0.20, '2025-02-01 00:00:00', '2025-02-28 23:59:59', 9, 9, 9),
(10, 'Accesorios Automotrices', 0.15, '2025-03-01 00:00:00', '2025-03-15 23:59:59', 10, 10, 10);


INSERT INTO ordenes (id_orden, fecha, estado, id_promocion) VALUES
(1, '2024-06-01 10:15:00', 'En Proceso', 1),
(2, '2024-06-02 12:30:00', 'Enviado', 2),
(3, '2024-06-03 14:45:00', 'Entregado', 3),
(4, '2024-06-04 09:00:00', 'En Proceso', 4),
(5, '2024-06-05 11:20:00', 'Enviado', 5),
(6, '2024-06-06 16:00:00', 'Entregado', 6),
(7, '2024-06-07 08:45:00', 'En Proceso', 7),
(8, '2024-06-08 13:10:00', 'Enviado', 8),
(9, '2024-06-09 15:30:00', 'Entregado', 9),
(10, '2024-06-10 10:00:00', 'Enviado', 10);


INSERT INTO envios (id_envio, direccion, estado, fecha_entrega, metodo, courrier, costo, tiempo_entrega) VALUES
(1, 'Calle Principal 123', 'En Proceso', '2024-06-15 14:00:00', 'Estándar', 'EnvíoExpress', 15.99, NULL),
(2, 'Avenida Secundaria 456', 'Enviado', '2024-06-16 10:30:00', 'Express', 'RápidoEnvíos', 25.50, '2024-06-18 14:00:00'),
(3, 'Plaza Comercial 789', 'Entregado', '2024-06-17 11:45:00', 'Estándar', 'MegaLogística', 12.75, '2024-06-19 12:30:00'),
(4, 'Calle Peatonal 101', 'En Proceso', '2024-06-18 09:30:00', 'Express', 'EntregaVeloz', 20.00, NULL),
(5, 'Calle de los Libros 202', 'Enviado', '2024-06-19 12:15:00', 'Estándar', 'LibrosExpress', 18.99, '2024-06-21 15:00:00'),
(6, 'Esquina de los Juguetes 303', 'Entregado', '2024-06-20 15:30:00', 'Express', 'JugueteRápido', 22.50, '2024-06-22 10:45:00'),
(7, 'Avenida de las Joyas 404', 'Enviado', '2024-06-21 14:45:00', 'Estándar', 'JoyasEnvíos', 30.00, '2024-06-23 13:00:00'),
(8, 'Calle de los Alimentos 505', 'En Proceso', '2024-06-22 10:00:00', 'Express', 'RicoEnvío', 15.75, NULL),
(9, 'Paseo de la Salud 606', 'Entregado', '2024-06-23 12:30:00', 'Estándar', 'SaludableExpress', 28.99, '2024-06-25 09:15:00'),
(10, 'Bulevar Automotriz 707', 'En Proceso', '2024-06-24 09:45:00', 'Express', 'AutoRápido', 19.50, NULL);


INSERT INTO detalle_orden (id_detalle, cantidad, precio_total, id_producto, id_categoria, id_usuario, id_envio, id_orden) VALUES
(1, 2, 35.99, 1, 1, 1, 1, 1),
(2, 1, 25.50, 2, 2, 2, 2, 2),
(3, 3, 45.75, 3, 3, 3, 3, 3),
(4, 4, 80.00, 4, 4, 4, 4, 4),
(5, 2, 37.98, 5, 5, 5, 5, 5),
(6, 1, 44.99, 6, 6, 6, 6, 6),
(7, 3, 90.00, 7, 7, 7, 7, 7),
(8, 2, 31.50, 8, 8, 8, 8, 8),
(9, 1, 28.99, 9, 9, 9, 9, 9),
(10, 4, 65.00, 10, 10, 10, 10, 10);


INSERT INTO carrito (id_carrito, fecha_creacion, id_orden) VALUES
(1, '2024-06-01 10:15:00', 1),
(2, '2024-06-02 12:30:00', 2),
(3, '2024-06-03 14:45:00', 3),
(4, '2024-06-04 09:00:00', 4),
(5, '2024-06-05 11:20:00', 5),
(6, '2024-06-06 16:00:00', 6),
(7, '2024-06-07 08:45:00', 7),
(8, '2024-06-08 13:10:00', 8),
(9, '2024-06-09 15:30:00', 9),
(10, '2024-06-10 10:00:00', 10);


INSERT INTO detalle_carrito (id_detalle_carrito, cantidad, precio_total, id_carrito, id_orden, id_producto, id_categoria, id_proveedor) VALUES
(1, 2, 35.99, 1, 1, 1, 1, 1),
(2, 1, 25.50, 2, 2, 2, 2, 2),
(3, 3, 45.75, 3, 3, 3, 3, 3),
(4, 4, 80.00, 4, 4, 4, 4, 4),
(5, 2, 37.98, 5, 5, 5, 5, 5),
(6, 1, 44.99, 6, 6, 6, 6, 6),
(7, 3, 90.00, 7, 7, 7, 7, 7),
(8, 2, 31.50, 8, 8, 8, 8, 8),
(9, 1, 28.99, 9, 9, 9, 9, 9),
(10, 4, 65.00, 10, 10, 10, 10, 10);


INSERT INTO comentarios (id_comentario, comentario, fecha, estado, calificacion, id_producto, id_categoria) VALUES
(1, '¡Excelente producto, estoy muy satisfecho!', '2024-06-01 14:30:00', 'Aprobado', '5 estrellas', 1, 1),
(2, 'Buen servicio al cliente, rápido y eficiente.', '2024-06-02 11:45:00', 'Aprobado', '4 estrellas', 2, 2),
(3, 'Producto de calidad, lo recomiendo.', '2024-06-03 09:20:00', 'Pendiente', '5 estrellas', 3, 3),
(4, 'No recibí mi pedido a tiempo, servicio insatisfactorio.', '2024-06-04 16:00:00', 'Rechazado', '2 estrellas', 4, 4),
(5, '¡Me encanta! Compré otro para regalar.', '2024-06-05 12:15:00', 'Aprobado', '5 estrellas', 5, 5),
(6, 'El producto no cumplió con mis expectativas.', '2024-06-06 14:45:00', 'Aprobado', '3 estrellas', 6, 6),
(7, 'Servicio de entrega excelente, llegó antes de lo esperado.', '2024-06-07 10:30:00', 'Aprobado', '4 estrellas', 7, 7),
(8, 'Calidad regular, esperaba más.', '2024-06-08 13:00:00', 'Rechazado', '2 estrellas', 8, 8),
(9, '¡Me encanta este producto! Compraría de nuevo.', '2024-06-09 15:30:00', 'Pendiente', '5 estrellas', 9, 9),
(10, 'Buen servicio, producto conforme a la descripción.', '2024-06-10 08:45:00', 'Aprobado', '4 estrellas', 10, 10);

  
select * from usuarios;
select * from historial_compras;
select * from categorias;
select * from productos;
select * from detalle_historial;
select * from proveedores;
select * from promociones;
select * from ordenes;
select * from envios;
select * from detalle_orden;
select * from carrito;
select * from detalle_carrito;
select * from comentarios;
