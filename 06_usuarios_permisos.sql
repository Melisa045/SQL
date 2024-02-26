USE marketplace_db;

DROP user solo_lectura@floreria;
DROP user lectura_insercion_modificacion@floreria;

-- Verificar usuario si fue creado anteriormente
SELECT user FROM mysql.user WHERE user = 'solo_lectura' AND host = 'floreria';
-- Usuario solo_lectura con permisos de solo lectura
CREATE USER solo_lectura@floreria IDENTIFIED BY '9273@]=maow';

-- Conceder permisos de solo lectura en todas las tablas del marketplace_db. No se permite eliminar registros
GRANT SELECT ON marketplace_db.* TO solo_lectura@floreria;
SHOW GRANTS FOR solo_lectura@floreria ;


-- Verificar usuario si fue creado anteriormente
SELECT user FROM mysql.user WHERE user = 'lectura_insercion_modificacion' AND host = 'floreria';
-- Usuario lectura_insercion_modificacion con permisos de lectura, inserción y modificación
CREATE USER 'lectura_insercion_modificacion'@floreria IDENTIFIED BY 'j28jw157h#';

-- Conceder permisos de lectura, inserción y modificación en todas las tablas del marketplace_db. No se permite eliminar registros
GRANT SELECT, INSERT, UPDATE ON marketplace_db.* TO 'lectura_insercion_modificacion'@floreria;
SHOW GRANTS FOR lectura_insercion_modificacion@floreria;

-- Eliminar la capacidad de eliminar registros para ambos usuarios y que se aplica a nivel global
REVOKE DELETE ON *.* FROM solo_lectura@floreria ;
REVOKE DELETE ON *.* FROM lectura_insercion_modificacion@floreria;

