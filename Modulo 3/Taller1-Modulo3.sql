CREATE KEYSPACE laboratorio1 WITH REPLICATION = { 'class':'SimpleStrategy','replication_factor':'1'};
/* Creacion de las tablas */
CREATE TABLE laboratorio1.usuarios (
	id bigint,
	nombres text,
	apellidos text,
	username text,
	email text,
	genero varchar,
	edad int,
	"fechaNacimiento" date,
	nacionalidad text,
	PRIMARY KEY (id)
);

CREATE TABLE laboratorio1.peliculas (
	id bigint,
	nombres text,
	"fechaEstreno" date,
	director text,
	genero text,
	pais varchar,
	empresa text,
	PRIMARY KEY (id)
);

CREATE TABLE laboratorio1.animales (
	id bigint,
	"nombreComun" text,
	"nombreCientifico" text,
	pais text,
	"anioRegistro" bigint,
	extinto boolean,
	"enPeligro" boolean,
	rescatado boolean,
	PRIMARY KEY (id)
);

CREATE TABLE laboratorio1.carros (
	id bigint,
    modelo text,
	"nombreComp" text,
	vim varchar,
	anio bigint,
    precio float,
	PRIMARY KEY (id)
);

CREATE TABLE laboratorio1.compania (
	id bigint,
	"nombreComp" text,
	pais text,
	"carroId" bigint,
	PRIMARY KEY (id)
);

/* Insercion de datos */
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (1, 'Harmony', 'Bernli', 'hbernli0', 'hbernli0@furl.net', 'F', 84, '2003-08-17', 'China');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (2, 'Tyrus', 'Soutar', 'tsoutar1', 'tsoutar1@businesswire.com', 'M', 55, '1956-10-06', 'Russia');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (3, 'Dyana', 'Conaghy', 'dconaghy2', 'dconaghy2@yahoo.com', 'F', 28, '2001-10-26', 'China');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (4, 'Shell', 'Bigley', 'sbigley3', 'sbigley3@amazon.co.jp', 'M', 47, '2001-10-12', 'China');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (5, 'Leelah', 'Biasioni', 'lbiasioni4', 'lbiasioni4@globo.com', 'F', 19, '2007-08-08', 'Sri Lanka');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (6, 'Cinnamon', 'Jorczyk', 'cjorczyk5', 'cjorczyk5@lycos.com', 'F', 99, '1984-10-28', 'Peru');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (7, 'Wiatt', 'Seacroft', 'wseacroft6', 'wseacroft6@networkadvertising.org', 'M', 47, '2018-04-27', 'China');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (8, 'Cedric', 'Simoncelli', 'csimoncelli7', 'csimoncelli7@flickr.com', 'M', 15, '1951-02-05', 'Indonesia');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (9, 'Nessa', 'Haccleton', 'nhaccleton8', 'nhaccleton8@freewebs.com', 'F', 67, '1972-12-24', 'China');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (10, 'Kerwin', 'Clapison', 'kclapison9', 'kclapison9@bloomberg.com', 'M', 13, '2023-03-24', 'Brazil');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (11, 'Alli', 'Rizzone', 'arizzonea', 'arizzonea@wordpress.com', 'F', 76, '1984-06-19', 'Ukraine');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (12, 'Olia', 'Rosenzwig', 'orosenzwigb', 'orosenzwigb@simplemachines.org', 'F', 57, '1973-02-13', 'Brazil');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (13, 'Sheelagh', 'Geldeford', 'sgeldefordc', 'sgeldefordc@whitehouse.gov', 'F', 93, '1994-08-24', 'Brazil');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (14, 'Huntington', 'Stain', 'hstaind', 'hstaind@sakura.ne.jp', 'M', 17, '2018-02-16', 'Denmark');
insert into usuarios (id, nombres, apellidos, username, email, genero, edad, "fechaNacimiento", nacionalidad) values (15, 'Herbert', 'Treneer', 'htreneere', 'htreneere@indiegogo.com', 'M', 32, '1982-09-03', 'Nicaragua');

insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (1, 'Thaw, The', '1993-10-17', 'Tallie Rudolph', 'Horror|Sci-Fi|Thriller', 'Portugal', 'American Health Packaging');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (2, 'Kramer vs. Kramer', '1974-03-14', 'Paulina Markwelley', 'Drama', 'Indonesia', 'Van Tibolli Beauty Corp.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (3, 'Let Sleeping Corpses Lie (Non si deve profanare il sonno dei morti)', '1928-02-24', 'Rosemonde Lavens', 'Horror', 'China', 'Cosmetica Laboratories Inc.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (4, 'Without a Paddle: Nature''s Calling', '1976-06-22', 'Annice Marion', 'Adventure|Comedy', 'Thailand', 'MAKEUP ART COSMETICS');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (5, 'Bestiaire', '1989-05-01', 'Lammond Fredi', 'Documentary', 'Czech Republic', 'BluePoint Laboratories');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (6, 'Adrift (Choi Voi)', '1917-12-11', 'Noel Haymes', 'Drama', 'China', 'REMEDYREPACK INC.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (7, 'Glue', '2016-11-05', 'Lanita McEwen', 'Drama', 'Portugal', 'HART Health');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (8, 'Run Silent Run Deep', '1933-12-15', 'Brook Larrad', 'War', 'France', 'Jubilant HollisterStier LLC');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (9, 'Posse', '2006-12-04', 'Ulrica Conaghan', 'Western', 'Malaysia', 'Apotex Corp.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (10, 'The Grump', '2015-03-01', 'Timi Butland', 'Comedy', 'Argentina', 'Lupin Pharmaceuticals, Inc.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (11, 'Fearless Hyena, The (Xiao quan guai zhao)', '2000-07-12', 'Rasla Dickerson', 'Action|Comedy', 'Portugal', 'Empire Stationery Distributors Inc.');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (12, 'A Spell to Ward Off the Darkness', '1999-05-13', 'Blakelee Hardesty', 'Documentary', 'Palestinian Territory', 'NCS HealthCare of KY, Inc dba Vangard Labs');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (13, 'Higher Learning', '2022-02-26', 'Germaine Billett', 'Drama', 'China', 'Ventura International LTD');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (14, 'My Best Friend''s Wife', '1957-02-24', 'Marten Liddiard', 'Comedy', 'China', 'Choice Laboratories Limited');
insert into peliculas (id, nombres, "fechaEstreno", director, genero, pais, empresa) values (15, 'House of Cards', '1960-01-04', 'Nora Tydd', 'Drama', 'China', 'Blue Cross Laboratories, Inc.');

insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (1, 'Siskin, yellow-rumped', 'Carduelis uropygialis', 'Central African Republic', 2000, false, true, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (2, 'Collared lizard', 'Crotaphytus collaris', 'Sweden', 2009, false, false, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (3, 'Seal, northern fur', 'Callorhinus ursinus', 'China', 2007, false, true, true);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (4, 'Vine snake (unidentified)', 'Oxybelis sp.', 'Peru', 2006, true, true, true);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (5, 'Paradoxure', 'Paradoxurus hermaphroditus', 'Slovenia', 2002, true, true, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (6, 'Red-necked wallaby', 'Macropus rufogriseus', 'China', 2005, false, false, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (7, 'Chacma baboon', 'Papio ursinus', 'China', 1988, true, true, true);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (8, 'Steller sea lion', 'Eumetopias jubatus', 'Russia', 2006, false, false, true);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (9, 'Australian brush turkey', 'Alectura lathami', 'Vietnam', 1990, false, false, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (10, 'Spur-winged goose', 'Plectopterus gambensis', 'Portugal', 2007, true, true, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (11, 'Butterfly (unidentified)', 'unavailable', 'Vietnam', 1999, true, true, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (12, 'Komodo dragon', 'Varanus komodensis', 'Ukraine', 2010, true, true, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (13, 'African porcupine', 'Hystrix cristata', 'Armenia', 1988, false, false, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (14, 'Red-billed buffalo weaver', 'Bubalornis niger', 'France', 2008, true, false, false);
insert into animales (id, "nombreComun", "nombreCientifico", pais, "anioRegistro", extinto, "enPeligro", rescatado) values (15, 'Red-billed tropic bird', 'Phaethon aethereus', 'China', 1998, true, false, false);

insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (1, 'xA', 'Scion', '5TDDW5G16FS782001', 2006, 489.976);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (2, 'Santa Fe', 'Hyundai', 'KNADH4A30A6029889', 2003, 3836.224);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (3, 'tC', 'Scion', 'KNAFT4A20A5320428', 2009, 6610.627);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (4, 'GX', 'Lexus', 'WAU3VAFR2CA834244', 2005, 1801.685);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (5, 'Allroad', 'Audi', '1FTWW3B50AE278093', 2005, 9300.289);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (6, 'SLR McLaren', 'Mercedes-Benz', 'WAUNF78P96A085564', 2007, 6125.451);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (7, 'Grand Am', 'Pontiac', 'JM1CW2BL2E0326338', 1989, 7867.394);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (8, 'Seville', 'Cadillac', 'WAUMF98P46A356084', 1995, 6710.399);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (9, 'A4', 'Audi', 'WBABS53493E667538', 2001, 314.817);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (10, 'New Beetle', 'Volkswagen', '3VWA17AU6FM291148', 1998, 9516.244);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (11, 'Liberty', 'Jeep', '2T1BU4EE6BC678821', 2006, 5026.307);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (12, 'NSX', 'Acura', '1N6AD0CWXFN324770', 1992, 9585.026);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (13, '300', 'Chrysler', 'JTEBU4BF4CK300229', 2012, 2102.182);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (14, 'Grand Vitara', 'Suzuki', 'WBADS334X1G064130', 2000, 3426.655);
insert into carros (id, modelo, "nombreComp", vim, anio, precio) values (15, 'S6', 'Audi', 'WBABD534X6P200292', 2010, 6670.672);

insert into compania (id, "nombreComp", pais, "carroId") values (1, 'Photospace', 'Brazil', 5);
insert into compania (id, "nombreComp", pais, "carroId") values (2, 'Browsedrive', 'China', 7);
insert into compania (id, "nombreComp", pais, "carroId") values (3, 'Tanoodle', 'Indonesia', 3);
insert into compania (id, "nombreComp", pais, "carroId") values (4, 'Wikibox', 'South Africa', 5);
insert into compania (id, "nombreComp", pais, "carroId") values (5, 'Realmix', 'China', 15);
insert into compania (id, "nombreComp", pais, "carroId") values (6, 'Blogpad', 'Indonesia', 5);
insert into compania (id, "nombreComp", pais, "carroId") values (7, 'Oloo', 'Russia', 14);
insert into compania (id, "nombreComp", pais, "carroId") values (8, 'Twinder', 'Cuba', 4);
insert into compania (id, "nombreComp", pais, "carroId") values (9, 'Trilith', 'China', 4);
insert into compania (id, "nombreComp", pais, "carroId") values (10, 'Yata', 'Iran', 5);
insert into compania (id, "nombreComp", pais, "carroId") values (11, 'Katz', 'Philippines', 5);
insert into compania (id, "nombreComp", pais, "carroId") values (12, 'Gabspot', 'Kazakhstan', 4);
insert into compania (id, "nombreComp", pais, "carroId") values (13, 'Quamba', 'Russia', 8);
insert into compania (id, "nombreComp", pais, "carroId") values (14, 'Feedfire', 'Czech Republic', 6);
insert into compania (id, "nombreComp", pais, "carroId") values (15, 'Jetpulse', 'China', 5);