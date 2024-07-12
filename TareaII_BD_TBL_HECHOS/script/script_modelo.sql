-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-07-12 12:55:03 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ciudad (
    id_ciudad       INT NOT NULL,
    id_departamento INT NOT NULL,
    ciudad          VARCHAR2(100 BYTE)
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE clientes (
    id_cliente   INT NOT NULL,
    id_direccion INT NOT NULL,
    nombre       VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE clientes ADD CONSTRAINT tbl_clientes_pk PRIMARY KEY ( id_cliente );

CREATE TABLE departamento (
    id_departamento INT NOT NULL,
    departamento    VARCHAR2(100 BYTE)
);

ALTER TABLE departamento ADD CONSTRAINT tbl_departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE direccion (
    id_direccion INT NOT NULL,
    id_ciudad    INT NOT NULL,
    colonia      VARCHAR2(100 BYTE)
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( id_direccion );

CREATE TABLE empleados (
    id_empleado INT NOT NULL,
    nombre_emp  VARCHAR2(100 BYTE),
    id_tienda   INT NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE tbl_hechos (
    id_hechos            INT NOT NULL,
    id_cliente           INT NOT NULL,
    id_tiempo            INT NOT NULL,
    id_empleado          INT NOT NULL,
    monto_total_producto INT,
    cantidad             INTEGER
);

ALTER TABLE tbl_hechos ADD CONSTRAINT tbl_hechos_pk PRIMARY KEY ( id_hechos );

CREATE TABLE tiempo (
    id_tiempo  INT NOT NULL,
    anio       VARCHAR2(10 BYTE),
    dia        VARCHAR2(10 BYTE),
    semana     VARCHAR2(2 BYTE),
    trimestre  VARCHAR2(1 BYTE),
    dia_semana VARCHAR2(20 BYTE)
);

ALTER TABLE tiempo ADD CONSTRAINT pagos_pk PRIMARY KEY ( id_tiempo );

CREATE TABLE tienda (
    id_tienda    INT NOT NULL,
    tienda       VARCHAR2(100 BYTE),
    id_direccion INT NOT NULL
);

ALTER TABLE tienda ADD CONSTRAINT tienda_pk PRIMARY KEY ( id_tienda );

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_departamento_fk FOREIGN KEY ( id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE clientes
    ADD CONSTRAINT clientes_direccion_fk FOREIGN KEY ( id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_ciudad_fk FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_tienda_fk FOREIGN KEY ( id_tienda )
        REFERENCES tienda ( id_tienda );

ALTER TABLE tbl_hechos
    ADD CONSTRAINT tbl_hechos_clientes_fk FOREIGN KEY ( id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE tbl_hechos
    ADD CONSTRAINT tbl_hechos_empleados_fk FOREIGN KEY ( id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE tbl_hechos
    ADD CONSTRAINT tbl_hechos_tiempo_fk FOREIGN KEY ( id_tiempo )
        REFERENCES tiempo ( id_tiempo );

ALTER TABLE tienda
    ADD CONSTRAINT tienda_direccion_fk FOREIGN KEY ( id_direccion )
        REFERENCES direccion ( id_direccion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
