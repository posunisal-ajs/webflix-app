CREATE SEQUENCE seqUsuario
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;
  
CREATE TABLE usuario
(
  id bigint NOT NULL DEFAULT nextval('seqUsuario'::regclass),
  nome character varying(100),
  email character varying(100),
  login character varying(100),
  senha character varying(100),
  uuid character varying(150),
  CONSTRAINT usuario_pkey PRIMARY KEY (id)
)


CREATE SEQUENCE seqFilme
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
CREATE TABLE filme
(
  id bigint NOT NULL DEFAULT nextval('seqFilme'::regclass),
  nome character varying(100),
  genero character varying(100),
  lancamento character varying(100),
  informacoes character varying(255),
  img   character varying(255),
  uuid character varying(150),
  CONSTRAINT usuario_pkey PRIMARY KEY (id)
)