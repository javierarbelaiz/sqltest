-- ============================================================================
-- CLGLO-1827: Creacion de Tabla de Relacion CARROUSEL_CONTENTS
-- Script 1/5: DDL - Tabla CARROUSEL_CONTENTS, FK, Indices
-- Esquema: APP_ESDC81
-- Ambiente: Oracle 11g (PREUAT)
-- Dependencia: Requiere que la tabla CARROUSELS (CLGLO-1826) exista.
-- ============================================================================

-- Tabla de relacion entre carrouseles y contenidos
CREATE TABLE APP_ESDC81.CARROUSEL_CONTENTS (
    CARROUSEL_ID   NUMBER(19)     NOT NULL,
    CONTENT_ID     VARCHAR2(38)   NOT NULL,
    CONSTRAINT CARROUSEL_CONTENTS_PK PRIMARY KEY (CARROUSEL_ID, CONTENT_ID),
    CONSTRAINT CARROUSEL_CONTENTS_FK_CARR FOREIGN KEY (CARROUSEL_ID)
        REFERENCES APP_ESDC81.CARROUSELS (ID)
);

-- Comentarios descriptivos
COMMENT ON TABLE APP_ESDC81.CARROUSEL_CONTENTS IS 'Relacion N:M entre carrouseles y contenidos externos';
COMMENT ON COLUMN APP_ESDC81.CARROUSEL_CONTENTS.CARROUSEL_ID IS 'FK al carrousel (CARROUSELS.ID)';
COMMENT ON COLUMN APP_ESDC81.CARROUSEL_CONTENTS.CONTENT_ID IS 'ID externo del contenido (UUID o ID de CMS)';

-- Indice para busquedas por CONTENT_ID (la PK ya cubre CARROUSEL_ID)
CREATE INDEX APP_ESDC81.IDX_CC_CONTENT_ID
    ON APP_ESDC81.CARROUSEL_CONTENTS (CONTENT_ID);
