#SET SQL_SAFE_UPDATES = 0; #por si lo llegamos a utilizar
-- hola lalo
drop database if exists libreria;
create database libreria;

use libreria;

/*===============tablas============================================================*/
create table cliente(
  idCliente int not null primary key,
  nombres varchar(50) not null,
  paterno varchar(50) not null,
  materno varchar(50) not null,
  correo varchar(50) not null,
  contrasena nvarchar(50) not null
);

create table autor(
  idAutor int not null primary key,
  nombres varchar(50) not null,
  paterno varchar(50) not null,
  materno varchar(50) not null
);

create table editorial(
  idEditorial int not null primary key,
  nombre varchar(50) not null,
  telefono int not null,
  sitioweb varchar(50) not null
);

create table idioma(
  idIdioma int not null primary key,
  idioma varchar(15) not null
);

create table formato(
  idFormato int not null primary key,
  tipoformato int not null
);

create table datos(
  idDatos int not null primary key,
  idIdioma int not null,
  nombre varchar(50) not null,
  anio int not null,
  portada varchar(50) not null,
  precio float not null,
  foreign key (idIdioma) references idioma(idIdioma)
);

create table edita(
  idDatos int not null,
  idEditorial int not null,
  numeroPaginas int not null,
  primary key (idDatos, idEditorial),
  foreign key (idDatos) references datos(idDatos),
  foreign key (idEditorial) references editorial(idEditorial)
);

create table libro(
  sku int not null primary key,
  idDatos int not null,
  edicion int not null,
  disponibilidad int not null,
  foreign key (idDatos) references datos(idDatos)
);

create table audiolibro(
  sku int not null primary key,
  idDatos int not null,
  duracion int not null,
  narradornombres varchar(50) not null,
  narradorpaterno varchar(50) not null,
  narradormaterno varchar(50) not null,  
  foreign key (idDatos) references datos(idDatos)
);

create table ebook(
  sku int not null primary key,
  idDatos int not null,
  skuLibro int not null,
  idFormato int not null,
  anioDigitalizacion int not null,
  foreign key (idDatos) references datos(idDatos),
  foreign key (skuLibro) references libro(sku),
  foreign key (idFormato) references formato(idFormato)
);

create table escribe(
  idAutor int not null,
  sku int not null,
  primary key (idAutor, sku),
  foreign key (idAutor) references autor(idAutor),
  foreign key (sku) references libro(sku)
);

create table redacta(
  idAutor int not null,
  sku int not null,
  primary key (sku, idAutor),
  foreign key (sku) references audiolibro(sku),
  foreign key (idAutor) references autor(idAutor)
);

create table consulta(
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
