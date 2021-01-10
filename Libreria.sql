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
  telefono varchar(20) not null,
  sitioweb varchar(300) not null
);

create table idioma(
  idIdioma int not null primary key,
  idioma varchar(15) not null
);

create table formato(
  idFormato int not null primary key,
  tipoformato nvarchar(50) not null
);

create table datos(
  idDatos int not null primary key,
  idIdioma int not null,
  nombre varchar(50) not null,
  anio int not null,
  portada blob,
  precio decimal(10, 2) not null,
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
  sku varchar(50) not null primary key,
  idDatos int not null,
  edicion int not null,
  disponibilidad int not null,
  foreign key (idDatos) references datos(idDatos)
);

create table audiolibro(
  sku varchar(50) not null primary key,
  idDatos int not null,
  duracion int not null,
  narradornombres varchar(50) not null,
  narradorpaterno varchar(50) not null,
  narradormaterno varchar(50) not null,  
  foreign key (idDatos) references datos(idDatos)
);

create table ebook(
  sku varchar(50) not null primary key,
  idDatos int not null,
  skuLibro varchar(50) not null,
  idFormato int not null,
  anioDigitalizacion int not null,
  foreign key (idDatos) references datos(idDatos),
  foreign key (skuLibro) references libro(sku),
  foreign key (idFormato) references formato(idFormato)
);

create table escribe(
  idAutor int not null,
  sku varchar(50) not null,
  primary key (idAutor, sku),
  foreign key (idAutor) references autor(idAutor),
  foreign key (sku) references libro(sku)
);

create table redacta(
  idAutor int not null,
  sku varchar(50) not null,
  primary key (sku, idAutor),
  foreign key (sku) references audiolibro(sku),
  foreign key (idAutor) references autor(idAutor)
);

create table consulta(
  idCliente int not null,
  sku varchar(50) not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references libro(sku)
);

create table compraAudiolibro(
  idCliente int not null,
  sku varchar(50) not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references audiolibro(sku)
);

create table compraEbook(
  idCliente int not null,
  sku varchar(50) not null,
  primary key (idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references ebook(sku)
);


/*===============inserts===========================================================*/
insert into cliente values(1,'Juan','Perez','Rodriguez','juan0809@gmail.com','gG3tXcEYXuC'),
						  (2,'Alfredo','Gutierrez','Jimenez','alfGui64@gmail.com','hCDpsqGqceq'),
                          (3,'Veronica','Rubio','Sanchez','veroRu_45@gmail.com','VhGuNCdmzJ3'),
                          (4,'Andrea','Garcia','Palacios','andyGaP04@gmail.com','pHEnTerEaRY'),
                          (5,'Roberto','Ramos','Almeda','robertRamAl35@gmail.com','itIonaMaNtI'),
                          (6,'Gabriel','Juarez','Aguirre','Gabr_JA58@gmail.com','QUenDainGid'),
                          (7,'Karla','Cruz','Alexanderson','Karly_Cruz15@gmail.com','rItErIONoXi'),
                          (8,'Estefania','Rosas','Guzman','EstRosesG@gmail.com','OleustIniGi'),
                          (9,'Ricardo','Valdes','Pizano','RichieVP@gmail.com','ToRtCaBUble'),
                          (10,'Isaac','Alcantar','Funes','IsaacAFu36@gmail.com','GaWkYLEGaim'),
                          (11,'Vannesa','Aguilar','Saldaña','Vane.Agui58@outlook.com','NImIcAtevIs'),
                          (12,'Erika','Viveros','Villa','kayViveros27@hotmail.com','UnEsTEnsCon'),
                          (13,'Caleb','Martinez','Cisneros','calebMG.prog@outlook.com','eMeWOmIThoL'),
                          (14,'Axel','Perez','Villalobos','kido_Pervi46@outlook.com','MiNCTOrnkin'),
                          (15,'Teresa','Aguilar','Campos','tereAguiC@hotmail.com','RhewAStrONs'),
                          (16,'Maria Fernanda','Alvarado','Sanchez','maferAlv96@outlook.com','HonvERsomSO'),
                          (17,'Edgar','Angeles','Padilla','Edgar_crack36@hotmail.com','biRwiNfELaY'),
                          (18,'Gerardo','Avalos','Blanchet','Gera_AvBlan69@hotmail.com','CLAuGIshWAY'),
                          (19,'Judith','Herrera','Garduño','juditHG09@outlook.com','aRaBLeCTiOU'),
                          (20,'Dennis','Barragan','Hernandez','DenniB.Her24@outlook.com','pICAthWELon'),
                          (21,'Antonio','Becker','Vargas','tony_Beck45@yahoo.com','TRAcePoldbl'),
                          (22,'Eduardo','Beltran','Castañeda','lalo.beltran04@yahoo.com','UnDERaRKMec'),
                          (23,'Kimberly','Correa','Gracidueñas','kimCorry15@yahoo.com','mOtORhoLdeM'),
                          (24,'Jennifer','De la Fuente','Navarro','jennyFN@yahoo.com','aDIctRATatI'),
                          (25,'Aldo','Diaz','Valle','AldoDi.Valle@yahoo.com','everiuMpROs'),
                          (26,'Miguel','Fernandez','Brito','MiguFdz@yahoo.com','ogyptuBtERk'),
                          (27,'Sara','Flores','Ruiz','saraFlz23@yahoo.com','CablenOngib'),
                          (28,'Belen','Perez','Rodriguez','belen_Prz7@yahoo.com','cQUAYDRoACe'),
                          (29,'Pancrasio','Iglesias','Chan','PancriChurch25@yahoo.com','orNOVOTEtoR'),
                          (30,'Bryan','Clark','Flisser','ElBryanFliss25@yahoo.com','TeLfWayTHoT');

insert into idioma values(1,'Español'),
						 (2,'Ingles'),
                         (3,'Frances'),
                         (4,'Portugues'),
                         (5,'Italiano');

insert into editorial values (1,'GRIJALBO','S/N','https://grijalbo.com.mx/');
insert into editorial values (2,'Paidos Mexico','S/N','https://www.planetadelibros.com.mx/editorial/paidos-/99');
insert into editorial values (3,'DEBOLSILLO','S/N','https://www.megustaleer.mx/editoriales/debolsillo/BOL');
insert into editorial values (4,'Penguin Random House Grupo Editorial México','S/N','https://www.penguinrandomhousegrupoeditorial.com/equipos-directivos/mexico/');
insert into editorial values (5,'AGUILAR','S/N','https://www.megustaleer.mx/editoriales/aguilar/AGU');
insert into editorial values (6,'PLANETA DEAGOSTINI','S/N','https://www.planetadeagostini.com.mx/');
insert into editorial values (7,'MONTENA','S/N','https://www.megustaleer.mx/editoriales/montena/MTN');
insert into editorial values (8,'MARTINEZ ROCA MEXICO','S/N','https://www.planetadelibros.com/editorial/ediciones-martinez-roca/11');
insert into editorial values (9,'SELECTOR','51340570 ','https://selector.com.mx/');
insert into editorial values (10,'EDITORIAL HIPERLIBRO','55462037','https://editorialhiperlibro.com/');

insert into autor values(1, "Paulo", "Coelho", "de Souza");
insert into autor values(2, "Peniley", "Ramírez", "");
insert into autor values(3, "Martín", "Berasategui", "Olazábal");
insert into autor values(4, "Stephen", "Richards", "Covey");
insert into autor values(5, "Keri", "Smith", "");
insert into autor values(6, "George", "Soros", "");
insert into autor values(7, "Stephen", "King", "");
insert into autor values(8, "Mónica", "Salmón", "");
insert into autor values(9, "José", "Carlos", "Carmona");
insert into autor values(10, "Federico", "Navarrete", "Linares");
insert into autor values(11, "John", "Gibler", "");
insert into autor values(12, "Alejandro", "Basañez", "Loyola");
insert into autor values(13, "Fabrizio", "Mejía", "Madrid");
insert into autor values(14, "Francisco Javier", "Leon", "Herrera");
insert into autor values(15, "Joshua", "A", "Aguilar");
insert into autor values(16, "Alan", "Moore", "");
insert into autor values(17, "Gail", "Simone", "");
insert into autor values(18, "Andre", "Chastel", "");
insert into autor values(19, "Oscar", "De Muriel", "");
insert into autor values(20, "Claudia", "Gray", "");
insert into autor values(21, "Sebastián", "García", "Mouret");
insert into autor values(22, "José Ramón", "Ayllon", "Vega");
insert into autor values(23, "Auron", "Play", "");
insert into autor values(24, "Agustin", "Sánchez", "González");
insert into autor values(25, "Franz", "Kafka", "");
insert into autor values(26, "Sergio", "Hernández", "Valdes");
insert into autor values(27, "Luis", "González", "Aspuru");
insert into autor values(28, "Juan Antonio", "Razo", "García");
insert into autor values(29, "Martin", "Gardner", "");
insert into autor values(30, "Raymond", "Blum", "");

insert into formato values(1,'EPUB');
insert into formato values(2,'MOBI');
insert into formato values(3,'AZW');
insert into formato values(4,'AZW3');
insert into formato values(5,'IBA');
insert into formato values(6,'FB2');
insert into formato values(7,'DJVU');
insert into formato values(8,'PDF');

select * from autor;
select * from editorial;
select LOAD_FILE('alq.jpg');

insert into datos values(1, 1, "EL ALQUIMISTA", 2020, null, 399);
insert into libro values("9786073199445", 1, 1, 50);
#para asignarle autor al libro
insert into escribe values(1, "9786073199445");
#para asignarle editorial y numero de paginas al libro
insert into edita values(1, 1, 208);

select * from datos;

/*===============views=============================================================*/

/*===============stored procedures=================================================*/
drop procedure if exists spRegistrarCliente;
delimiter |
create procedure spRegistrarCliente(in nom varchar(50), in pat varchar(50), in mat varchar(50), in corr varchar(50), contra nvarchar(50))
begin
	declare existe, idCli int;
    declare msj nvarchar(200);
    
    set existe = (select count(*) from cliente where correo = corr);
    if(existe = 0) then
		set idCli = (select ifnull(max(idCliente),0)+1 from cliente);
        insert into cliente values(idCli, nom, pat, mat, corr, md5(contra));
        set msj = "ok";
    else
		set msj = "Ya existe un usuario asociado con el correo electrónico, proporciona uno distinto";
	end if;
    select msj, idCli;
end; |
delimiter ;
#call spRegistrarCliente("Caleb", "Bolaños", "Ramos", "bolanos.c@hotmail.com", "contra1234");
