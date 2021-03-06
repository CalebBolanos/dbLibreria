#SET SQL_SAFE_UPDATES = 0; #por si lo llegamos a utilizar
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
  nombre varchar(100) not null,
  anio int not null,
  portada varchar(500) not null,
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
  skuLibro varchar(50),
  idFormato int not null,
  anioDigitalizacion int not null,
  precio decimal(10, 2) not null,
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
  idConsulta int not null,
  idCliente int not null,
  sku varchar(50) not null,
  fechaConsulta datetime not null,
  primary key (idConsulta, idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references libro(sku)
);

create table compraAudiolibro(
  idCompra int not null,
  idCliente int not null,
  sku varchar(50) not null,
  cantidad int not null,
  total decimal(10, 2) not null,
  fechaCompra datetime not null,
  primary key (idCompra, idCliente, sku),
  foreign key (idCliente) references cliente(idCliente),
  foreign key (sku) references audiolibro(sku)
);

create table compraEbook(
  idCompra int not null,
  idCliente int not null,
  sku varchar(50) not null,
  cantidad int not null,
  total decimal(10, 2) not null,
  fechaCompra datetime not null,
  primary key (idCompra, idCliente, sku),
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
insert into editorial values (11,'Brilliance Audio','S/N','https://www.brilliancepublishing.com/');

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
insert into autor values(31, "Victoria", "Blue", "");
insert into autor values(32, "Taylor", "Adams", "");
insert into autor values(33, "Marion", "Debruyne", "");
insert into autor values(34, "John", "Saul", "");
insert into autor values(35, "Susan", "Mallery", "");
insert into autor values(36, "Jorge", "Baradit", "");
insert into autor values(37, "Sally", "Rooney", "");
insert into autor values(38, "Carlos", "Peña", "");
insert into autor values(39, "Sophie", "Cunningham", "");
insert into autor values(40, "Yassmin ", "Abdel-Magied", "");
insert into autor values(41, "Mario", "Guerra", "");
insert into autor values(42, "Gabriel", "Zaid", "");
insert into autor values(43, "Andrés", "Gomberoff", "");
insert into autor values(44, "Jorge", "Cuevas", "");
insert into autor values(45, "Valerio", "Massimo", "Manfredi");
insert into autor values(46, "Thomas", "Mann", "");
insert into autor values(47, "Javier", "Cercas", "");
insert into autor values(48, "Vanessa", "Springora", "");
insert into autor values(49, "Fiódor", "Dostoievski", "");
insert into autor values(50, "Adrián", "Paenza", "");
insert into autor values(51, "Danielle", "Steel", "");
insert into autor values(52, "Charles", "Dickens", "");
insert into autor values(53, "Fern", "Michaels", "");
insert into autor values(54, "Eric", "Jerome", "Dickey");
insert into autor values(55, "Laurence", "Minski", "");
insert into autor values(56, "Daniel", "Defoe", "");
insert into autor values(57, "Nora", "Roberts", "");
insert into autor values(58, "Angel", "Payne", "");
insert into autor values(59, "Ferns", "Michaels", "");
insert into autor values(60, "Stephen", "Coonts", "");
 
insert into formato values(1,'EPUB');
insert into formato values(2,'MOBI');
insert into formato values(3,'AZW');
insert into formato values(4,'AZW3');
insert into formato values(5,'IBA');
insert into formato values(6,'FB2');
insert into formato values(7,'DJVU');
insert into formato values(8,'PDF');


insert into datos values(1, 1, "EL ALQUIMISTA", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786073199445.jpg", 399);
insert into libro values("9786073199445", 1, 1, 50);
#para asignarle autor al libro
insert into escribe values(1, "9786073199445");
#para asignarle editorial y numero de paginas al libro
insert into edita values(1, 1, 208);

insert into datos values(2, 1, "LOS MILLONARIOS DE LA GUERRA", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786073199421.jpg", 299);
insert into libro values("9786073199421", 2, 1, 50);
insert into escribe values(2, "9786073199421");
insert into edita values(2, 1, 368);

insert into datos values(3, 1, "COCINA EN CASA CON MARTIN BERASATEGUI", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9788417338589.jpg", 599);
insert into libro values("9788417338589", 3, 1, 50);
insert into escribe values(3, "9788417338589");
insert into edita values(3, 1, 368);

insert into datos values(4, 1, "LOS 7 HABITOS DE LA GENTE ALTAMENTE EFECTIVA TD", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786075690254.jpg", 472);
insert into libro values("9786075690254", 4, 2, 50);
insert into escribe values(4, "9786075690254");
insert into edita values(4, 2, 472);

insert into datos values(5, 1, "COMO SER UN EXPLORADOR DEL MUNDO", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786075690186.jpg", 229);
insert into libro values("9786075690186", 5, 2, 50);
insert into escribe values(5, "9786075690186");
insert into edita values(5, 2, 208);

insert into datos values(6, 1, "EN DEFENSA DE LA SOCIEDAD ABIERTA", 2020,
"https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786077479796.jpg",
249);
insert into libro values("9786077479796", 6, 2, 50);
insert into escribe values(6, "9786077479796");
insert into edita values(6, 2, 208);

insert into datos values(7, 1, "CUJO", 2012,
"https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_72965.jpg",
319);
insert into libro values("9786073112444", 7, 3, 50);
insert into escribe values(7, "9786073112444");
insert into edita values(7, 3, 400);

insert into datos values(8, 1, "CUIDAME DE TI", 2019,
"https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_34059.jpg",
299);
insert into libro values("9786073175845", 8, 1, 50);
insert into escribe values(8, "9786073175845");
insert into edita values(8, 1, 304);

insert into datos values(9, 1, "SABOR A CHOCOLATE", 2015,
"https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_285601.jpg",
159);
insert into libro values("9786073136198", 9, 3, 50);
insert into escribe values(9, "9786073136198");
insert into edita values(9, 3, 160);

insert into datos values(10, 1, "MEXICO RACISTA", 2016,
"https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_291182.jpg",
229);
insert into libro values("9786073143325", 10, 1, 50);
insert into escribe values(10, "9786073143325");
insert into edita values(10, 1, 192);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(11,1,'UNA HISTORIA ORAL DE LA INFAMIA',2016,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_289916.jpg',189);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786073141574',11,1,30);
-- insert into escribe values(idautor,sku);
insert into escribe values(11,'9786073141574');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(11,1,232);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(12,1,'Tiaztlán',2013,'https://kbimages1-a.akamaihd.net/Images/7d6ae5ca-c52c-4757-b7db-e80be3eedd3a/300/300/False/image.jpg',449);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786074805222',12,1,35);
-- insert into escribe values(idautor,sku);
insert into escribe values(12,'9786074805222');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(12,4,672);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(13,1,'ESA LUZ QUE NOS DESLUMBRA',2018,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_26109.jpg',249);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786073167116',13,1,14);
-- insert into escribe values(idautor,sku);
insert into escribe values(13,'9786073167116');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(13,1,304);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(14,1,'HOMBRES G. NUNCA HEMOS SIDO LOS GUAPOS DEL BARRIO',2020,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786073197878.jpg',399);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786073197878',14,1,10);
-- insert into escribe values(idautor,sku);
insert into escribe values(14,'9786073197878');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(14,5,512);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(15,1,'DIARIO EMPRENDEDOR',2014,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_92550.jpg',319);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786071131690',15,1,2);
-- insert into escribe values(idautor,sku);
insert into escribe values(15,'9786071131690');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(15,5,320);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(16,1,'THE LEAGUE OF EXTRAORDINARY GENTLEMEN Nº 01 (EDICION TRAZADO)',2018,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9788416543625.jpg',398);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9788416543625',16,1,2);
-- insert into escribe values(idautor,sku);
insert into escribe values(16,'9788416543625');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(16,6,192);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(17,1,'TCONAN Y RED SONJA',2017,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9788416693160_1.jpg',398);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9788416693160',17,1,42);
-- insert into escribe values(idautor,sku);
insert into escribe values(17,'9788416693160');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(17,6,104);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(18,1,'LEONARDO DA VINCI',2005,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_11057.jpg',59);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9788467413717',18,1,2);
-- insert into escribe values(idautor,sku);
insert into escribe values(18,'9788467413717');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(18,6,100);

-- insert into datos values(iddatos,ididioma,nombre,año,portada,precio);
insert into datos values(19,1,'LA SONATA DEL DIABLO',2017,'https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_15474.jpg',379);
-- insert into libro values(sku,iddatos,edcion,disponibilidad);
insert into libro values('9786073157483',19,2,200);
-- insert into escribe values(idautor,sku);
insert into escribe values(19,'9786073157483');
-- insert into edita values(iddatos,ideditorial,numpagina,);
insert into edita values(19,7,432);

insert into datos values(20, 1, "Contra las estrellas", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786073154772.jpg", 109);
insert into libro values("9786073154772", 20, 7, 50);
insert into escribe values(20, "9786073154772");
insert into edita values(20, 7,416);

insert into datos values(21, 1, "Nuestro ultimo verano", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786073196611.jpg", 299);
insert into libro values("9786073196611", 21, 7, 50);
insert into escribe values(21, "9786073196611");
insert into edita values(21, 7, 432);

insert into datos values(22, 1, "555 joyas de la sabiduria", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_64971.jpg", 398);
insert into libro values("9788427035904", 22, 8, 50);
insert into escribe values(22, "9788427035904");
insert into edita values(22, 8, 256);

insert into datos values(23, 1, "DE LO PEOR, LO MEJOR: LOS CONSEJOS DE AURON", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/9/7/9786070730931.jpg", 49);
insert into libro values("9786070730931", 23, 8, 50);
insert into escribe values(23, "9786070730931");
insert into edita values(23, 8, 160);

insert into datos values(24, 1, "Un dulce sabor a muerte", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_212759.jpg", 29);
insert into libro values("9786070701412", 24, 8, 50);
insert into escribe values(24, "9786070701412");
insert into edita values(24, 8, 196);

insert into datos values(25, 1, "Carta al padre", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_15689.jpg", 99);
insert into libro values("9786074534535", 25, 9, 50);
insert into escribe values(25, "9786074534535");
insert into edita values(25, 9, 96);

insert into datos values(26, 1, "Porfavor sea feliz en pareja", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_294831.jpg", 159);
insert into libro values("9786074534023", 26, 9, 50);
insert into escribe values(26, "9786074534023");
insert into edita values(26, 9,168);

insert into datos values(27, 1, "El talento", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_5886616_2019-07-04_07_07_36_000.jpg", 295);
insert into libro values("9786074536461", 27, 9, 50);
insert into escribe values(27, "9786074536461");
insert into edita values(27, 9, 208);

insert into datos values(28, 1, "Una historia puede cambiar tu vida", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_68716.jpg",269);
insert into libro values("9786079043117", 28, 10, 50);
insert into escribe values(28, "9786079043117");
insert into edita values(28, 10, 382);

insert into datos values(29, 1, "Matematicas para divertirse", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_165802.jpg", 139);
insert into libro values("9786079534806", 29, 10, 50);
insert into escribe values(29, "9786079534806");
insert into edita values(29, 10, 158);

insert into datos values(30, 1, "Festival de ingenio matematico", 2020, "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_1165_1_275736.jpg", 89);
insert into libro values("9786079043230", 30, 10, 50);
insert into escribe values(30, "9786079043230");
insert into edita values(30, 10, 96);


/*
insert into datos values(idDatos, idIdioma, "titulo", 2020, "portada", precio);
insert into libro values("sku", idDatos, idEditorial, disp);
insert into escribe values(idAutor, "sku");
insert into edita values(idDatos, idEditorial, pag);

*/

insert into ebook values("70bf50cb-5ec7-4b29-8491-ba720617c79d", 1, "9786073199445", 1, "2012", 79);
insert into ebook values("238d50bf-8dc2-39e7-848d-de33e8ad7b8b", 2, "9786073199421", 1, "2020", 179);
insert into ebook values("e1c98eb7-bfe1-3584-9b0a-a58356a3e2d1", 3, "9788417338589", 1, "2020", 149);
insert into ebook values("452382a5-3e63-3468-83fb-a8bc48665869", 4, "9786075690254", 1, "2020", 139);
insert into ebook values("6df1b72e-d074-3583-bd73-050a6a687f1c", 6, "9786077479796", 1, "2020", 169);
insert into ebook values("f8629543-9a65-31e9-8912-df6cecb5ef89", 7, "9786073112444", 1, "2020", 89);
insert into ebook values("8b4b608d-d2ae-4557-9bbc-48416a44caa2", 8, "9786073175845", 1, "2019", 79);
insert into ebook values("5720b89e-b0b5-39b1-9a72-b1962638ee0b", 9, "9786073136198", 1, "2020", 69);
insert into ebook values("58a1aad0-8685-38b2-ae0c-0378e56e9ab3", 10, "9786073143325", 1, "2017", 149);
insert into ebook values("da9b6d67-0010-36fd-b7a8-38df94f0d25c",11,"9786073143325",1,2016,109);
insert into ebook values("775224b9-4e42-3dbe-81fe-706595645a3a",12,"9786074805222",1,2013,65);
insert into ebook values("7230cf05-06de-3f63-9b19-ac7ccb896a99",13,"9786073167116",1,2018,129);
insert into ebook values("f1f087a1-c068-3456-acaf-3e5c9604c65c",14,"9786073197878",1,2020,159);
insert into ebook values("f8def83d-5e1a-3025-af80-e93afc5df6eb",15,"9786071131690",1,2014,35);
insert into ebook values("c98fd9ec-4011-34aa-a676-56e5e64fba10",19,"9786073157483",1,2017,149);
insert into ebook values("a50199a2-a7f8-35a6-954d-64baf5559cd8",20,"9786073154772",1,2020,119);
insert into ebook values("b3a57ae3-4528-3ce8-abc7-2a208da95628",21,"9786073196611",1,2020,119);
insert into ebook values("40401fd3-b8cc-486d-bee1-9d85988d1322",22,"9788427035904",1,2020,129);
insert into ebook values("8a875a86-ec73-3738-bf85-29e5f8fbc018",24,"9786070701412",1,2020,79);
insert into ebook values("0848082f-3d9b-3c15-9199-0075baa33a93",25,"9786074534535",1,2020,99);
insert into ebook values("6ead92c3-26a7-37d2-b66b-f221c0104e2f",26,"9786074534023",1,2020,88);
insert into ebook values("54464cf7-a394-3682-abed-d2bbde82ff7f",27,"9786074536461",1,2020,227);

-- insert into ebook values("skuEbook", idDatos, "skuLibro", idFormato, "añoDig", precioEbook);

insert into datos values(31, 2, "Misadventures at City Hall", 2020, "https://kbimages1-a.akamaihd.net/Images/60463135-66f3-4904-bcfc-10c7d29d082c/300/300/False/image.jpg", 552);
insert into audiolibro values("9781799744917", 31, 356, "Savannah", "Richards", "");
insert into redacta values(31, "9781799744917");
insert into edita values(31, 11, 0);

insert into datos values(32, 2, "No Exit", 2020, "https://kbimages1-a.akamaihd.net/Images/8422b28f-8827-4b2f-b562-656683917682/300/300/False/image.jpg", 331);
insert into audiolibro values("9781543666168", 32, 480, "Sarah", "Naughton", "");
insert into redacta values(32, "9781543666168");
insert into edita values(32, 11, 0);

insert into datos values(33, 2, "Customer Innovation", 2020, "https://kbimages1-a.akamaihd.net/Images/61c17903-0f3c-428f-85c1-78c8d94e498a/300/300/False/image.jpg", 552);
insert into audiolibro values("9781978629219", 33, 494, "Teri", "Schnaubelt", "");
insert into redacta values(33, "9781978629219");
insert into edita values(33, 11, 0);

insert into datos values(34, 2, "Black Lightning", 2020, "https://kbimages1-a.akamaihd.net/Images/37c43135-93e4-4104-8e82-b41322dced4b/300/300/False/image.jpg", 331);
insert into audiolibro values("9781423355854", 34, 770, "Phil", "Gigante", "");
insert into redacta values(34, "9781423355854");
insert into edita values(34, 11, 0);

insert into datos values(35, 2, "The Friends We Keep", 2020, "https://kbimages1-a.akamaihd.net/Images/0329a86d-1a9d-4966-982b-801640dcbbd2/300/300/False/image.jpg", 221);
insert into audiolibro values("9781491504369", 35, 665, "Tanya", "Eby", "");
insert into redacta values(35, "9781491504369");
insert into edita values(35, 11, 0);

insert into datos values(36, 1, "Rebelión", 2020, "https://kbimages1-a.akamaihd.net/Images/a0a25785-0f2f-409e-9091-360816277fc1/300/300/False/image.jpg", 109);
insert into audiolibro values("9789562626026", 36, 78, "Sebastián", "Fernández", "Robles");
insert into redacta values(36, "9789562626026");
insert into edita values(36, 4, 0);

insert into datos values(37, 1, "Gente normal", 2020, "https://kbimages1-a.akamaihd.net/Images/33378962-a764-4633-aec8-0d7e3828f9b4/300/300/False/image.jpg", 249);
insert into audiolibro values("9788439738794", 37, 495, "Sara", "Heras", "");
insert into redacta values(37, "9788439738794");
insert into edita values(37, 4, 0);

insert into datos values(38, 1, "La mentira noble", 2020, "https://kbimages1-a.akamaihd.net/Images/68da339a-6c9d-4682-8497-1187af34e4c8/300/300/False/image.jpg", 199);
insert into audiolibro values("9789569635526", 38, 543, "Lucas", "Medina", "");
insert into redacta values(38, "9789569635526");
insert into edita values(38, 4, 0);

insert into datos values(39, 2, "Fire Flood Plague", 2020, "https://kbimages1-a.akamaihd.net/Images/68d0d104-7b49-4979-81a6-6bc390ff20ab/300/300/False/image.jpg", 443);
insert into audiolibro values("9781761042515", 39, 481, "Rupert", "Degas", "");
insert into redacta values(39, "9781761042515");
insert into edita values(39, 4, 0);

insert into datos values(40, 2, "Listen, Layla", 2020, "https://kbimages1-a.akamaihd.net/Images/b6572583-4e96-4230-93d7-0138447f9f88/300/300/False/image.jpg", 364);
insert into audiolibro values("9781761042812", 40, 120, "Amy", "Jones", "");
insert into redacta values(40, "9781761042812");
insert into edita values(40, 4, 0);

insert into datos values(41, 1, "No te compliques", 2020, "https://kbimages1-a.akamaihd.net/Images/6105fc77-cb9c-4aad-849c-4b699935bf25/300/300/False/image.jpg", 229);
insert into audiolibro values("9786073165945", 41, 360, "Mario", "Guerra", "");
insert into redacta values(41, "9786073165945");
insert into edita values(41, 4, 0);

insert into datos values(42, 1, "Cronología del progreso", 2020, "https://kbimages1-a.akamaihd.net/Images/c3821a04-45e5-4dcb-b1bf-1076fc0f740e/300/300/False/image.jpg", 199);
insert into audiolibro values("9786073180238", 42, 337, "Mario", "Díaz", "Mercado");
insert into redacta values(42, "9786073180238");
insert into edita values(42, 4, 0);

insert into datos values(43, 1, "Einstein para perplejos", 2020, "https://kbimages1-a.akamaihd.net/Images/1124c1e5-e9de-48c4-81c0-1736bc8b643c/300/300/False/image.jpg", 95);
insert into audiolibro values("9789569545979", 43, 475, "Wenceslao", "Corral", "");
insert into redacta values(43, "9789569545979");
insert into edita values(43, 4, 0);

insert into datos values(44, 1, "Liderazgo quántico", 2020, "https://kbimages1-a.akamaihd.net/Images/f33375e3-4e49-42d0-9cdf-4797703fbbf1/300/300/False/image.jpg", 199);
insert into audiolibro values("9786073194907", 44, 241, "Rod", "González", "");
insert into redacta values(44, "9786073194907");
insert into edita values(44, 4, 0);

insert into datos values(45, 1, "Imperio", 2020, "https://kbimages1-a.akamaihd.net/Images/a5a6a6d7-9765-4b8f-800c-c5b1282e8151/300/300/False/image.jpg", 249);
insert into audiolibro values("9788466348454", 45, 572, "Jordi", "Salas", "");
insert into redacta values(45, "9788466348454");
insert into edita values(45, 4, 0);

insert into datos values(46, 1, "La muerte en Venecia", 2020, "https://kbimages1-a.akamaihd.net/Images/58e37340-73f2-4ca0-96dd-780097712d48/300/300/False/image.jpg", 229);
insert into audiolibro values("9788466352581", 46, 197, "Pablo", "Derqui", "");
insert into redacta values(46, "9788466352581");
insert into edita values(46, 4, 0);

insert into datos values(47, 1, "El impostor", 2020, "https://kbimages1-a.akamaihd.net/Images/854f364d-771a-484a-99f7-c33d0fc5c845/300/300/False/image.jpg", 279);
insert into audiolibro values("9788439732754", 47, 865, "Sergio", "Capelo", "");
insert into redacta values(47, "9788439732754");
insert into edita values(47, 4, 0);

insert into datos values(48, 1, "El consentimiento", 2020, "https://kbimages1-a.akamaihd.net/Images/8b2dc674-7b2e-4a7f-ad9f-69db35ac9a0d/300/300/False/image.jpg", 299);
insert into audiolibro values("9788426409355", 48, 205, "Elsa", "Veiga", "");
insert into redacta values(48, "9788426409355");
insert into edita values(48, 4, 0);

insert into datos values(49, 1, "Crimen y castigo", 2020, "https://kbimages1-a.akamaihd.net/Images/f80e1c90-7215-4103-b3f3-fcdd173238c9/300/300/False/image.jpg", 329);
insert into audiolibro values("9788491054580", 49, 42, "Luis", "García", "Márquez");
insert into redacta values(49, "9788491054580");
insert into edita values(49, 4, 0);

insert into datos values(50, 1, "Matemática... te encontré", 2020, "https://kbimages1-a.akamaihd.net/Images/392b1b75-baa5-47dd-9c58-05971ca5cce1/300/300/False/image.jpg", 159);
insert into audiolibro values("9789500763615", 50, 460, "Adrián", "Paenza", "");
insert into redacta values(50, "9789500763615");
insert into edita values(50, 4, 0);

insert into datos values(51, 2, "The award", 2020, "https://kbimages1-a.akamaihd.net/Images/c08bfe42-27fa-4622-b058-bc16b25f9239/300/300/False/image.jpg", 221);
insert into audiolibro values("9781455834136", 51, 421, "Adam", "Verner", "");
insert into redacta values(51, "9781455834136");
insert into edita values(51,11, 0);

insert into datos values(52, 2, "Great expectations", 2020, "https://kbimages1-a.akamaihd.net/Images/8969d5fb-0905-498a-a597-cd2f95579fe0/300/300/False/image.jpg", 221);
insert into audiolibro values("9781491586174", 52, 1098, "Michael", "Page", "");
insert into redacta values(52, "9781491586174");
insert into edita values(52, 11, 0);

insert into datos values(53, 2, "The jury", 2020, "https://kbimages1-a.akamaihd.net/Images/9e3693a9-a2bc-4f88-a0b4-90afa65858da/300/300/False/image.jpg", 442);
insert into audiolibro values("9781597375665", 53, 424, "Laural", "Merlington", "");
insert into redacta values(53, "9781597375665");
insert into edita values(53, 11, 0);

insert into datos values(54, 2, "Pleasure", 2020, "https://kbimages1-a.akamaihd.net/Images/83647147-60fa-4ae3-a5e0-007f4cb8ff78/300/300/False/image.jpg", 442);
insert into audiolibro values("9781423345626", 54, 901, "Susan", "Spain", "");
insert into redacta values(54, "9781423345626");
insert into edita values(54, 11, 0);

insert into datos values(55, 2, "Audio Branding", 2020, "https://kbimages1-a.akamaihd.net/Images/b7781d8d-93c7-43bc-824b-b05075a846ad/300/300/False/image.jpg", 552);
insert into audiolibro values("9781721387731", 55, 477, "Jamie", "Renell", "");
insert into redacta values(55, "9781721387731");
insert into edita values(55, 11, 0);

insert into datos values(56, 2, "Moll Flanders", 2020, "https://kbimages1-a.akamaihd.net/Images/4a966f7b-154b-40f0-9a93-ef1d4f8445c1/300/300/False/image.jpg", 221);
insert into audiolibro values("9781491586822", 56, 805, "Laural", "Merligton", "");
insert into redacta values(56, "9781491586822");
insert into edita values(56,11, 0);

insert into datos values(57, 2, "Irish Thoroughbred", 2020, "https://kbimages1-a.akamaihd.net/Images/719e8b59-084a-4c30-8908-ff6eb216200a/300/300/False/image.jpg", 221);
insert into audiolibro values("9781501245077", 57, 294, "Emy", "Rubinate", "");
insert into redacta values(57, "9781501245077");
insert into edita values(57, 11, 0);

insert into datos values(58, 2, "Sharks edge", 2020, "https://kbimages1-a.akamaihd.net/Images/63f049ed-edd3-4565-9039-9f6dc0a812a6/300/300/False/image.jpg", 552);
insert into audiolibro values("9781799745006", 58, 493, "Erin", "Mallon", "");
insert into redacta values(58, "9781799745006");
insert into edita values(58, 11, 0);

insert into datos values(59, 2, "The blossom sisters", 2020, "https://kbimages1-a.akamaihd.net/Images/b485e903-b25e-4214-a4d3-e0fcdc5986c9/300/300/False/image.jpg",331 );
insert into audiolibro values("9781455812790", 59, 476, "Jeff ", "Crawford", "");
insert into redacta values(59, "9781455812790");
insert into edita values(59, 11, 0);

insert into datos values(60,2, "Cuba", 2020, "https://kbimages1-a.akamaihd.net/Images/8a2c0667-0c0e-4c6a-9f66-848237c17398/300/300/False/image.jpg", 331);
insert into audiolibro values("9781480515444", 60, 884, "Benjamin", "Darcie", "");
insert into redacta values(60, "9781480515444");
insert into edita values(60, 11, 0);
 
/** 
insert into datos values(idDatos, idIdioma, "titulo", 2020, "portada", precio);
insert into audiolibro values("sku", idDatos, duracion, "narrador", "paterno", "materno");
insert into redacta values(idAutor, "sku");
insert into edita values(idDatos, idEditorial, pag);
**/


/*===============selects=============================================================*/

/*1: consulta usando ||group by|| para mostrar el numero de libros 
fisicos que tiene cada editorial*/
select e.nombre as "Editorial", count(l.sku) as "Libros"
from editorial e, libro l, datos d, edita ed where
l.idDatos = d.idDatos and d.idDatos = ed.idDatos 
and e.idEditorial = ed.idEditorial group by 1;

/*2: consulta usando ||count|| para mostrar cuantos libros y 
ebook existen cada uno de los idiomas*/
select i.idioma as "Idioma", count(l.sku) as "Libro", 
count(eb.sku) as "Ebook" from idioma i, datos d, ebook eb,
libro l where i.idIdioma = d.idIdioma and l.sku = eb.skuLibro
and d.idDatos = l.idDatos group by 1;

/*3: consulta usando ||sum|| para mostrar cuantos libros, paginas
totales y precio total corresponden a cada editorial en años
inferiores a 2019*/
select edi.nombre as "Editorial", count(l.sku) as "Libros",
sum(ed.numeroPaginas) as "Num pags total", sum(d.precio) as 
"Precio total" from editorial edi, edita ed, datos d, libro l
where edi.idEditorial = ed.idEditorial and ed.idDatos = d.idDatos
and d.idDatos = l.idDatos and d.anio < 2019 group by 1;

/*4: consulta usando ||count, sum y group by|| para saber cuantos
libros tiene cada autor asi como las paginas totales*/
select a.nombres "Autor", count(l.sku) as "Libros", 
sum(ed.numeroPaginas) as "Pags totales" from libro l, autor a,
escribe es, datos d, edita ed where a.idAutor = es.idAutor and
es.sku = l.sku and l.idDatos = d.idDatos and d.idDatos = ed.idDatos
group by 1;

/*5: consulta para revisar los libros, disponibilidad, edicion de
aquellos autores sin apellido materno*/
select a.nombres as "Nombre autor", a.paterno as "Apellido",
d.nombre as "Nombre libro", l.edicion as "Edicion", 
l.disponibilidad as "Disponibilidad" from autor a, escribe es,
libro l, datos d where a.idAutor = es.idAutor and es.sku = l.sku
and l.idDatos = d.idDatos and a.materno = "" order by 1;

/*6: consulta para ver los audiolibros, su duracion, el idioma y
que editorial lo edito asi como el tel de esta ultima*/
select d.nombre as "Audiolibro", ad.duracion as "Duracion",
i.idioma as "Idioma", edi.nombre as "Editorial", 
edi.telefono as "Tel." from editorial edi, edita ed, datos d, 
idioma i, audiolibro ad where edi.idEditorial = ed.idEditorial
and ed.idDatos = d.idDatos and d.idIdioma = i.idIdioma and
d.idDatos = ad.idDatos order by Editorial;

/*7: consulta para mostrar el nombre, formato y año de digitalizacion
de los ebook creados a partir de los libros de los autores donde 
su nombre inicie con A*/
select d.nombre as "Ebook", f.tipoformato as "Formato",
eb.anioDigitalizacion as "Anio digitalizacion" from formato f,
ebook eb, libro l, datos d, escribe es, autor a where
a.idAutor = es.idAutor and es.sku = l.sku and l.idDatos = d.idDatos
and l.sku = eb.skuLibro and eb.idFormato = f.idFormato and
a.nombres like "A%" order by 1;

/*8: consulta para ver la portada de los libros asi como que
editorial lo edito y el sitio web de esta ultima*/
select d.nombre as "Libros", d.portada as "Portada",
edi.nombre as "Editorial", edi.sitioweb as "WEB" from
editorial edi, edita ed, datos d where edi.idEditorial = ed.idEditorial
and ed.idDatos = d.idDatos; 

/*9: consulta para ver el idioma, tipo de formato y el nombre de 
libro*/
select i.idioma as "Idioma", f.tipoformato as "Formato",
d.nombre as "Nombre lib" from idioma i, datos d, libro l, ebook eb,
formato f where i.idIdioma = d.idIdioma and d.idDatos = l.idDatos
and l.sku = eb.skuLibro and eb.idFormato = f.idFormato;

/*10: consulta para mostrar el nombre del audiolibro, asi como el 
autor y el nombre del narrador para los audiolibros del año 2020*/
select d.nombre as "Audiolibro", a.nombres as "Autor",
ad.narradornombres as "Narrador" from autor a, redacta r,
audiolibro ad, datos d where a.idAutor = r.idAutor and
r.sku = ad.sku and ad.idDatos = d.idDatos and d.anio = 2020;


/*===============views=============================================================*/

/*View para mostrar el nombre, la edicion y editorial de los 
libros con precio menor a 500*/
create view LibroPrecio as select d.nombre as "Libro", 
l.edicion as "Edicion", e.nombre as "Editorial",
d.precio as "Precio" from editorial e, edita ed, datos d,
libro l where l.idDatos = d.idDatos and d.idDatos = ed.idDatos
and e.idEditorial = ed.idEditorial and d.precio < 500 order by Precio;

/*View para mostrar cuantos libros cuestan menos de 500 y 
cuanto seria el total en caso de comprarlos*/
create view CuentaLi as select count(l.sku) as "Numero de libros",
sum(d.precio) as "Precio total" from editorial e, edita ed, 
datos d, libro l where l.idDatos = d.idDatos and 
d.idDatos = ed.idDatos and e.idEditorial = ed.idEditorial 
and d.precio < 500;

/*View para mostrar el autor, el nombre del libro y la 
duracion de los audiolibtos que salieron despues de 20010*/
create view DuraAudi as select d.nombre as "Audiolibro",
a.nombres as "Autor", ad.duracion as "Duracion" from autor a,
redacta r, audiolibro ad, datos d where d.idDatos = ad.idDatos
and ad.sku = r.sku and r.idAutor = a.idAutor and d.anio > 2010
order by Duracion;

/*View para mostrar cuantos audiolibros hay en español asi 
como su duracion total*/
create view AudiIdio as select count(ad.sku) as "Numero de audios",
i.idioma as "Idioma", sum(ad.duracion) from idioma i, datos d,
audiolibro ad where i.idIdioma = d.idIdioma and 
d.idDatos = ad.idDatos and i.idioma = "Español" group by 2;

/*View para mostrar el nombre de libro, idioma y numero de pags
que fueron digitalizados despues de 2010*/
create view DigiEb as select d.nombre as "Nombre ebook",
i.idioma as "Idioma", eb.anioDigitalizacion as "AnioDigita",
ed.numeroPaginas as "Paginas" from edita ed, datos d, idioma i,
ebook eb, libro l where eb.skuLibro = l.sku and l.idDatos = d.idDatos
and i.idIdioma = d.idIdioma and eb.anioDigitalizacion > 2010
group by 1 order by 1;


/*View para mostrar cuantos ebook y el numero da paginas totales
existen en formato MOBI con precio menor a 200*/
create view NumDigi as select f.tipoformato as "Formato",
count(eb.sku) as "Num de ebook's", sum(e.numeroPaginas) as
"Numero de pags total" from formato f, ebook eb, datos d, 
edita e, libro l where f.idFormato = eb.idFormato and
eb.skuLibro = l.sku and l.idDatos = d.idDatos and
d.idDatos = e.idDatos and d.precio < 200 
and f.tipoformato = "MOBI" group by 1;

/*consulta usando ||group by|| para mostrar el numero de libros 
fisicos que tiene cada editorial*/
select e.nombre as "Editorial", count(l.sku) as "Libros"
from editorial e, libro l, datos d, edita ed where
l.idDatos = d.idDatos and d.idDatos = ed.idDatos 
and e.idEditorial = ed.idEditorial group by 1;

drop view if exists vwlibros;
create view vwlibros as select l.sku as "sku", 1 as "tipoProducto",
d.nombre as "Nombre", concat(a.nombres, " ", a.paterno, " ", a.materno) as "Autor", d.portada as "Portada", 
edi.nombre as "Editorial", d.precio as "Precio", d.anio as "Anio", i.idioma as "Idioma", l.edicion as "Edicion", 
ed.numeroPaginas as "Paginas", l.disponibilidad as "Disponibilidad"
from datos d, libro l, escribe es, autor a, edita ed, editorial edi, idioma i 
where edi.idEditorial = ed.idEditorial 
and ed.idDatos = d.idDatos and d.idDatos = l.idDatos and l.sku = es.sku 
and es.idAutor = a.idAutor and d.idIdioma = i.idIdioma order by 3;
select * from vwlibros;

drop view if exists vwebook;
create view vwebook as select eb.sku as "sku", 2 as "tipoProducto",
d.nombre as "Nombre", concat(a.nombres, " ", a.paterno, " ", a.materno) as "Autor",
d.portada as "Portada", edi.nombre as "Editorial", eb.precio as "Precio", d.anio as "Anio", 
i.idioma as "Idioma", eb.anioDigitalizacion as "AnioDigitalizacion", f.tipoformato as "Formato"
from datos d, libro l, ebook eb, escribe es, autor a, edita ed, editorial edi, formato f, idioma i  
where edi.idEditorial = ed.idEditorial and ed.idDatos = d.idDatos 
and d.idDatos = l.idDatos and l.sku = es.sku and es.idAutor = a.idAutor 
and l.sku = eb.skuLibro and eb.idFormato = f.idFormato and d.idIdioma = i.idIdioma order by 3;
select * from vwebook;

drop view if exists vwAudiolibro;
create view vwAudiolibro as select ad.sku as "sku", 3 as "tipoProducto",
d.nombre as "Nombre", concat(a.nombres, " ", a.paterno, " ", a.materno) as "Autor", 
d.portada as "Portada", edi.nombre as "Editorial", d.precio as "Precio", d.anio as "Anio", i.idioma as "Idioma",
ad.duracion as "Duracion", concat(ad.narradornombres, " ", ad.narradorpaterno, " ", ad.narradormaterno) as "Narrador"  
from  datos d, audiolibro ad, autor a, redacta r, edita ed, editorial edi, idioma i 
where edi.idEditorial = ed.idEditorial 
and ed.idDatos = d.idDatos and d.idDatos = ad.idDatos and ad.sku = r.sku 
and r.idAutor = a.idAutor and d.idIdioma = i.idIdioma order by 3;
select * from vwAudiolibro;

drop view if exists vwproductos;
create view vwproductos as
select sku, tipoProducto, Nombre, Autor, Portada, Editorial, Precio, Anio, Idioma from vwlibros 
union 
select sku, tipoProducto, Nombre, Autor, Portada, Editorial, Precio, Anio, Idioma from vwebook 
union 
select sku, tipoProducto, Nombre, Autor, Portada, Editorial, Precio, Anio, Idioma from vwAudiolibro 
order by 3;

select * from vwproductos;  

drop view if exists vwCompraEbook;
create view vwCompraEbook as select ce.idCompra, ce.idCliente, ce.sku, 
d.nombre, e.precio, ce.cantidad, ce.total, ce.fechaCompra 
from compraEbook ce, ebook e, datos d
where ce.sku = e.sku and e.idDatos = d.idDatos;
select * from vwCompraEbook;

drop view if exists vwCompraAudiolibro;
create view vwCompraAudiolibro as select ca.idCompra, ca.idCliente, ca.sku, 
d.nombre, d.precio, ca.cantidad, ca.total, ca.fechaCompra 
from compraAudiolibro ca, audiolibro a, datos d
where ca.sku = a.sku and a.idDatos = d.idDatos;
select * from vwCompraAudiolibro;

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
call spRegistrarCliente("Caleb", "Bolaños", "Ramos", "bolanos.c@hotmail.com", "contra1234");


drop procedure if exists spIniciarSesion;
delimiter |
create procedure spIniciarSesion(in usr varchar(50), contra nvarchar(50))
begin
	declare existe, idCli int;
    declare nom, pat, mat, corr nvarchar(50);
    declare msj nvarchar(200);
    
    set existe = (select count(*) from cliente where correo = usr and contrasena = md5(contra));
    if(existe = 1) then
		select idCliente, nombres, paterno, materno, correo into idCli, nom, pat, mat, corr from cliente where correo = usr;
        set msj = "ok";
    else
		set msj = "Usuario o contraseña incorrecta";
	end if;
    select msj, idCli, nom, pat, mat, corr;
end; |
delimiter ;

call spIniciarSesion("bolanos.c@hotmail.com", "contra1234");

#sp para calcular la compra de varios ebooks en especifico
drop procedure if exists spComprarEbook;
delimiter |
create procedure spComprarEbook(in idCli int, idSku varchar(50), in cantidad int)
begin
	declare existe, existeCliente, idComp int;
    declare prec, total decimal(10,2);
    declare msj nvarchar(200);
    
    set existeCliente = (select count(*) from cliente where idCliente = idCli); 
    if(existeCliente = 1) then
		#para verificar si el ebook existe
		set existe = (select count(*) from ebook where sku = idSku);
		if(existe = 1) then
            set prec = (select precio from ebook where sku = idSku);
			set total = (prec * cantidad);
			set idComp = (select ifnull(max(idCompra),0)+1 from compraEbook);
			insert into compraEbook values(idComp, idCli, idSku, cantidad, total, NOW());
			set msj = "Compra exitosa";
		else
			set msj = "El ebook que quieres comprar no existe";
		end if;
    else
		set msj = "El cliente no existe";
    end if;

    select msj, idCli;
end; |
delimiter ;

call spComprarEbook(31, "8b4b608d-d2ae-4557-9bbc-48416a44caa2", 3);


#sp para calcular la compra de audiolibros ebooks en especifico
drop procedure if exists spComprarAudiolibro;
delimiter |
create procedure spComprarAudiolibro(in idCli int, idSku varchar(50), in cantidad int)
begin
	declare existe, existeCliente, idComp, idDat int;
    declare prec, total decimal(10,2);
    declare msj nvarchar(200);
    
    set existeCliente = (select count(*) from cliente where idCliente = idCli); 
    if(existeCliente = 1) then
		#para verificar si el ebook existe
		set existe = (select count(*) from audiolibro where sku = idSku);
		if(existe = 1) then
			set idDat = (select idDatos from audiolibro where sku = idSku);
            set prec = (select precio from datos where idDatos = idDat);
			set total = (prec * cantidad);
			set idComp = (select ifnull(max(idCompra),0)+1 from compraAudiolibro);
			insert into compraAudiolibro values(idComp, idCli, idSku, cantidad, total, NOW());
			set msj = "Compra exitosa";
		else
			set msj = "El audiolibro que quieres comprar no existe";
		end if;
    else
		set msj = "El cliente no existe";
    end if;

    select msj, idCli;
end; |
delimiter ;
call spComprarAudiolibro(31, "9781423345626", 1);


drop procedure if exists spBusqueda;
delimiter |
create procedure spBusqueda(in productoABuscar int, in filtro nvarchar(50), in busqueda nvarchar(200))
begin
	case
		when productoABuscar = 0 then 
			select * from vwproductos where case filtro
				when 'Titulo' then LOWER(Nombre)
                when 'Autor' then LOWER(Autor)
                when 'Editorial' then LOWER(Editorial)
                when 'Año' then Anio
                when 'Idioma' then Idioma
                when 'Precio' then Precio
                else null
                end
				like concat("%", busqueda, "%");
        when productoABuscar >= 1 then 
			select * from vwproductos where tipoProducto = productoABuscar and case filtro
				when 'Titulo' then LOWER(Nombre)
                when 'Autor' then LOWER(Autor)
                when 'Editorial' then LOWER(Editorial)
                when 'Año' then Anio
                when 'Idioma' then Idioma
                when 'Precio' then Precio
                else null
                end
				like concat("%", busqueda, "%");
	end case;
end; |
delimiter ;

-- call spBusqueda(0, "Precio", "199");


-- insert into cliente values(33,'Borrar','Borrar','Borrar','borrar@gmail.com', md5('borrar'));

drop procedure if exists spBr;
delimiter |
create procedure spBr(in idBr int)
begin
	declare existe int;
    declare msj varchar(200);
    
    set existe = (select count(*) from cliente where idCliente=idBr);
	if(existe = 1)then
		DELETE from compraEbook where idCliente = idBr;
        DELETE from consulta where idCliente = idBr;
        DELETE from compraAudiolibro where idCliente = idBr;
        DELETE from cliente where idCliente = idBr;
        set msj="Cliente eliminado";
	else
		set msj="El usuario no existe";
	end if;
    select msj;
end; |
delimiter ;

-- call spBr(33);

drop procedure if exists Cambiocon;
delimiter |
create procedure Cambiocon(in idCli int,viejacon nvarchar(50),nuevacon nvarchar(50))
begin
declare msj varchar(200);
declare existeCliente int;

set existeCliente = (select count(*) from cliente where idCliente = idCli); 
if(existeCliente = 1) then

if(md5(viejacon) = (select contrasena from cliente where idCliente = idCli))then
update cliente set contrasena = md5(nuevacon) where idCliente = idCli;
-- update contrasena set contrasena=md5(nuevacon);
set msj="Cambio de contrasena correcto";
else 
set msj="contrasena incorrecta";
end if;
else 
set msj="Cliente no esta registrado";
end if;
select msj;
end; |
delimiter ;

-- call Cambiocon(30,"si","no");

select * from cliente;