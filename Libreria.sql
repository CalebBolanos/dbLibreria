#SET SQL_SAFE_UPDATES = 0; #por si lo llegamos a utilizar

drop database if exists libreria;
create database libreria;

use libreria;

/*===============tablas============================================================*/
create table autor(
  idAutor int not null,
  nombres int not null,
  paterno int not null,
  materno int not null,
  primary key (idAutor)
);

create table editorial(
  idEditorial int not null,
  nombre int not null,
  telefono int not null,
  sitioweb int not null,
  primary key (idEditorial)
);

create table paginas(
  idPaginas int not null,
  numeroPaginas int not null,
  primary key (idPaginas)
);

create table correo(
  idCorreo int not null,
  correo int not null,
  primary key (idCorreo)
);

create table idioma(
  idIdioma int not null,
  idioma int not null,
  primary key (idIdioma)
);

create table cliente(
  idCliente int not null,
  nombres int not null,
  paterno int not null,
  materno int not null,
  idCorreo int not null,
  primary key (idCliente),
  foreign key (idCorreo) references correo(idCorreo)
);

create table datos(
  idDatos int not null,
  nombre int not null,
  anio int not null,
  portada int not null,
  idIdioma int not null,
  primary key (idDatos),
  foreign key (idIdioma) references idioma(idIdioma)
);

create table contrasena(
  idContraseña int not null,
  idCliente int not null,
  contrasena int not null,
  primary key (idContraseña),
  foreign key (idCliente) references cliente(idCliente)
);

create table edita(
  idDatos int not null,
  idEditorial int not null,
  primary key (idDatos, idEditorial),
  foreign key (idDatos) references datos(idDatos),
  foreign key (idEditorial) references editorial(idEditorial)
);

create table libro(
  sku int not null,
  edicion int not null,
  disponibilidad int not null,
  idDatos int not null,
  idPaginas int not null,
  primary key (sku),
  foreign key (idDatos) references datos(idDatos),
  foreign key (idPaginas) references paginas(idPaginas)
);

create table audiolibro(
  sku int not null,
  duracion int not null,
  narradorNombres int not null,
  narradorPaterno int not null,
  narradorMaterno int not null,
  idDatos int not null,
  primary key (sku),
  foreign key (idDatos) references datos(idDatos)
);

create table ebook(
  sku int not null,
  anioDigitalizacion int not null,
  formato int not null,
  idDatos int not null,
  idPaginas int not null,
  primary key (sku),
  foreign key (idDatos) references datos(idDatos),
  foreign key (idPaginas) references paginas(idPaginas)
);

create table escribeLibro(
  sku int not null,
  idAutor int not null,
  primary key (idAutor, sku),
  foreign key (idAutor) references autor(idAutor),
  foreign key (sku) references libro(sku)
);

create table escribeAudiolibro(
  sku int not null,
  idAutor int not null,
  primary key (sku, idAutor),
  foreign key (sku) references audiolibro(sku),
  foreign key (idAutor) references autor(idAutor)
);

create table escribeEbook(
  sku int not null,
  idAutor int not null,
  primary key (sku, idAutor),
  foreign key (sku) references ebook(sku),
  foreign key (idAutor) references autor(idAutor)
);

#hmmm quiza esta tabla no la usemos
create table consultaLibro(
  idCliente int not null,
  sku int not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references libro(sku)
);

create table compraAudiolibro(
  idCliente int not null,
  sku int not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references audiolibro(sku)
);

create table compraEbook(
  idCliente int not null,
  sku int not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references ebook(sku)
);


/*===============inserts===========================================================*/

/*===============views=============================================================*/

/*===============stored procedures=================================================*/
