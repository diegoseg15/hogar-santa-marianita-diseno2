CREATE TABLE EMPRESAS (
    CODEMP VARCHAR(2) NOT NULL PRIMARY KEY,
    NOMEMP VARCHAR(150) NOT NULL,
    NOMREP VARCHAR(100) NOT NULL,
    CARREP VARCHAR(50),
    DIRECC VARCHAR(50),
    NOMCIU VARCHAR(50),
    CODUSU VARCHAR(30) NOT NULL,
    FECULT DATE,
    RUCREP VARCHAR(25) NOT NULL,
    ESTADO BIT,
    EMAIL VARCHAR(50)
);

-- CODUS1 => CODIGO DEL USUARIO
CREATE TABLE USUARIOS (
    CODUS1 VARCHAR(25) NOT NULL PRIMARY KEY,
    CODEMP VARCHAR(2) NOT NULL,
    TIPUSU VARCHAR(2),
    CLAUSU VARCHAR(150) NOT NULL,
    NOMUSU VARCHAR(100) NOT NULL,
    FECING DATE,
    FECEXP DATE,
    ESTADO BIT,
    EMAIL VARCHAR(50),
    FOREIGN KEY (CODEMP) REFERENCES EMPRESAS(CODEMP)
);

CREATE TABLE EMPLEADOS (
    CODEPL VARCHAR(25) NOT NULL PRIMARY KEY,
    NOMEPL VARCHAR(2) NOT NULL,
    DIREPL VARCHAR(2),
    TELEPL VARCHAR(150) NOT NULL,
    CODUS1 VARCHAR(100) NOT NULL,
    FECULT DATE,
    FOREIGN KEY (CODUS1) REFERENCES USUARIOS(CODUS1)
);

CREATE TABLE CLASE_ARTICULOS (
    CODCLA VARCHAR(20) NOT NULL PRIMARY KEY,
    NOMCLA VARCHAR(150) NOT NULL,
    CODUS1 VARCHAR(25) NOT NULL,
    FECULT DATE,
    FOREIGN KEY (CODUS1) REFERENCES USUARIOS(CODUS1)
);

CREATE TABLE IVA_ARTICULOS (
    CODIVA VARCHAR(10) NOT NULL PRIMARY KEY,
    NOMIVA VARCHAR(60) NOT NULL,
    PORIVA NUMERIC(25) NOT NULL,
    CODUS1 VARCHAR(25) NOT NULL,
    FECULT DATE,
    FOREIGN KEY (CODUS1) REFERENCES USUARIOS(CODUS1)
);

CREATE TABLE UNIDADESM_ARTICULOS (
    CODUNI VARCHAR(10) NOT NULL PRIMARY KEY,
    NOMUNI VARCHAR(60) NOT NULL,
    CODUS1 VARCHAR(25) NOT NULL,
    FECULT DATE,
    FOREIGN KEY (CODUS1) REFERENCES USUARIOS(CODUS1)
);

CREATE TABLE ARTICULOS (
    CODART VARCHAR(10) NOT NULL PRIMARY KEY,
    NOMART VARCHAR(60) NOT NULL,
    CODCLA VARCHAR(20) NOT NULL,
    CODUNI VARCHAR(10) NOT NULL,
    EXIACT NUMERIC(20, 4),
    COSPRO NUMERIC(20, 4),
    ULTCOS NUMERIC(20, 4),
    CODUCO BIT,
    FOREIGN KEY (CODCLA) REFERENCES CLASE_ARTICULOS(CODCLA),
    FOREIGN KEY (CODUNI) REFERENCES UNIDADESM_ARTICULOS(CODUNI)
);

CREATE TABLE tIPO_tRANSACCION (
    CODTRA VARCHAR(10) NOT NULL PRIMARY KEY,
    NOMTRA VARCHAR(60) NOT NULL,
    signo VARCHAR(1)
);

CREATE TABLE KARDEX (
    CODART VARCHAR(10) NOT NULL PRIMARY KEY,
    NOMART VARCHAR(150) NOT NULL,
    CODCLA VARCHAR(20) NOT NULL PRIMARY KEY,
    CODUNI VARCHAR(10) NOT NULL PRIMARY KEY,
    EXIACT NUMBER(20, 4) COSPRO NUMBER(20, 4),
    ULTCOS NUMBER(20, 4),
    COSTUNI NUMBER(20, 2),
    CODUCO BIT,
    FOREIGN KEY (CODART) REFERENCES ARTICULOS(CODART),
    FOREIGN KEY (CODCLA) REFERENCES CLASE_ARTICULOS(CODCLA),
    FOREIGN KEY (CODUNI) REFERENCES UNIDADESM_ARTICULOS(CODUNI),
);