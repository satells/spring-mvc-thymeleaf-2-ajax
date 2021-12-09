DROP TABLE IF EXISTS promocoes;

DROP TABLE IF EXISTS categorias;






CREATE TABLE categorias (
  id bigserial not null ,
  titulo varchar(255) not null,
  PRIMARY KEY (id),
  UNIQUE (titulo)
);





CREATE TABLE promocoes (
  id bigserial not null,
  descricao varchar(255),
  data_cadastro timestamp,
  total_likes int DEFAULT '0',
  link_imagem varchar(255),
  link_promocao varchar(255) not null,
  preco_promocao decimal(19,2) not null,
  site_promocao varchar(255) not null,
  titulo varchar(255) not null,
  categoria_fk bigint not null,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_fk) REFERENCES categorias(id)
);


INSERT INTO categorias (titulo) VALUES ('Informatica');
INSERT INTO categorias (titulo) VALUES ('Cursos');
INSERT INTO categorias (titulo) VALUES ('Eletrodomésticos');
INSERT INTO categorias (titulo) VALUES ('Eletronicos');
INSERT INTO categorias (titulo) VALUES ('Livros');
INSERT INTO categorias (titulo) VALUES ('Móveis');
INSERT INTO categorias (titulo) VALUES ('Cama, Mesa e Banho');







