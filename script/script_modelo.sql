CREATE TABLE ciudad (
    id_ciudad       INT NOT NULL,
    id_departamento INT NOT NULL,
    ciudad          VARCHAR(100)
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY (id_ciudad);

CREATE TABLE clientes (
    id_cliente   INT NOT NULL,
    id_direccion INT NOT NULL,
    nombre       VARCHAR(100) NOT NULL
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY (id_cliente);

CREATE TABLE departamento (
    id_departamento INT NOT NULL,
    departamento    VARCHAR(100)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY (id_departamento);

CREATE TABLE direccion (
    id_direccion INT NOT NULL,
    id_ciudad    INT NOT NULL,
    colonia      VARCHAR(100)
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY (id_direccion);

CREATE TABLE empleados (
    id_empleado INT NOT NULL,
    nombre_emp  VARCHAR(100),
    id_tienda   INT NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY (id_empleado);

CREATE TABLE hechos (
    id_hechos            INT NOT NULL,
    id_cliente           INT NOT NULL,
    id_tiempo            INT NOT NULL,
    id_empleado          INT NOT NULL,
    monto_total_producto DECIMAL(18, 2)
);

ALTER TABLE hechos ADD CONSTRAINT hechos_pk PRIMARY KEY (id_hechos);

CREATE TABLE tiempo (
    id_tiempo  INT NOT NULL,
    anio       VARCHAR(10),
    dia        VARCHAR(10),
    semana     VARCHAR(2),
    trimestre  VARCHAR(1),
    dia_semana VARCHAR(20)
);

ALTER TABLE tiempo ADD CONSTRAINT tiempo_pk PRIMARY KEY (id_tiempo);

CREATE TABLE tienda (
    id_tienda INT NOT NULL,
    tienda    VARCHAR(100),
    id_ciudad INT NOT NULL
);

ALTER TABLE tienda ADD CONSTRAINT tienda_pk PRIMARY KEY (id_tienda);

ALTER TABLE ciudad
    ADD CONSTRAINT ciudad_departamento_fk FOREIGN KEY (id_departamento)
        REFERENCES departamento (id_departamento);

ALTER TABLE clientes
    ADD CONSTRAINT clientes_direccion_fk FOREIGN KEY (id_direccion)
        REFERENCES direccion (id_direccion);

ALTER TABLE direccion
    ADD CONSTRAINT direccion_ciudad_fk FOREIGN KEY (id_ciudad)
        REFERENCES ciudad (id_ciudad);

ALTER TABLE empleados
    ADD CONSTRAINT empleados_tienda_fk FOREIGN KEY (id_tienda)
        REFERENCES tienda (id_tienda);

ALTER TABLE hechos
    ADD CONSTRAINT hechos_clientes_fk FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente);

ALTER TABLE hechos
    ADD CONSTRAINT hechos_empleados_fk FOREIGN KEY (id_empleado)
        REFERENCES empleados (id_empleado);

ALTER TABLE hechos
    ADD CONSTRAINT hechos_tiempo_fk FOREIGN KEY (id_tiempo)
        REFERENCES tiempo (id_tiempo);

ALTER TABLE tienda
    ADD CONSTRAINT tienda_ciudad_fk FOREIGN KEY (id_ciudad)
        REFERENCES ciudad (id_ciudad);
