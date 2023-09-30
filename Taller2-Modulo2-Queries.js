db = connect( 'mongodb://localhost/taller2' );

/*
 *
 * PARTE 2: Uso de cursores
 *
 */
 
// Obtener todos los usuarios cuya edad sea mayor a 30 anios
var cursor = db.usuarios.find({edad:{$gt:30}});
while(cursor.hasNext()){
	print(tojson(cursor.next()));
}

// Obtener todas las peliculas cuyo pais de procedencia sea Japon o China
var cursor = db.peliculas.find({$or: [ {pais:'Japan'}, {pais:'China'}]});
while(cursor.hasNext()){
	var dato = cursor.next();
	print("Pelicula: " +  dato.nombre + " Pais: " + dato.pais);
}

// Obtener la lista de animales cuya fecha de registro estuvo entre
// 1950 al 2000
var cursor = db.animales.find({anioRegistro: {$gte: 1950, $lte: 2000}});
while(cursor.hasNext()){
	var dato = cursor.next();
	print("Nombre: " +  dato.nombreComun + " Anio Registro: " + dato.anioRegistro);
}


/*
 *
 * PARTE 3: Creacion de indices
 *
 */

//Crea indices para cada coleccion

// Usuarios
db.usuarios.createIndex({"nombres": 1});
db.usuarios.createIndex({"apellidos": 1});
db.usuarios.getIndexes();

// peliculas
db.peliculas.createIndex({"pais": 1});
db.peliculas.createIndex({"genero": 1});
db.peliculas.getIndexes();

// animales
db.animales.createIndex({"nombreCientifico": 1});
db.animales.createIndex({"anioRegistro": 1});
db.peliculas.getIndexes();

// tarjetasCredito
db.tarjetasCredito.createIndex({"tipo": 1});
db.tarjetasCredito.createIndex({"empresa": 1});
db.tarjetasCredito.getIndexes();

// carros
db.carros.createIndex({"fabricante": 1});
db.carros.createIndex({"modeloAnio": 1});
db.carros.getIndexes();

// compañias
db.compañias.createIndex({"nombreComp": 1});
db.compañias.getIndexes();


/*
 *
 * PARTE 4: Uso de limit
 *
 */
 
// metodo limit

// Obtener todas las peliculas cuyo pais de procedencia sea Japon o China
// ordenados por pais, obteniendo los primeros 100
db.peliculas.find({$or: [ {pais:'Japan'}, {pais:'China'}]}).sort({pais:1}).limit(100);

// Obtener todos los usuarios cuya edad sea mayor a 30 anios, ordenados
// por edad descendentemente, saltandose los primeros 100, tomando los
// siguientes 100
db.usuarios.find({edad:{$gt:30}}).sort({edad: -1}).skip(100).limit(100);

// Obtener la lista de animales cuya fecha de registro estuvo entre
// 1950 al 2000, a traves de aggregate, ordenar por anio registro
// descendentemente, y tomar los primeros 100 registros
db.animales.aggregate([
	{$match: {anioRegistro: {$gte: 1950, $lte: 2000}}},
	{$sort: {anioRegistro: -1}},
	{$limit: 100}
]);


/*
 *
 * PARTE 5: Uso de validadores
 *
 */

// Ejemplo: Crear una coleccion usuarios, donde, el usuario y contraseña
// no puedan ser nulos, la contraseña tenga un minimo de 10 caracteres
// y contenga caracteres especiales, numeros, alfanumericos
db.createCollection("empleados", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "usuario", "password", "tipo" ],
         properties: {
            usuario: {
               bsonType: "string",
               description: "debe ser una cadena de caracteres (requerido)"
            },
            password: {
               bsonType: "string",
               minLength: 8,
			   pattern: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$",
               description: "debe ser una cadena de caracteres de por lo menos 8 caracteres, que contenga letras, numeros, caracteres especiales"
            },
			tipo: {
				bsonType: "string",
				enum: ['Admin','Usuario'],
				description: "Solo 2 tipos aceptados: Admin o Usuario"
			}
         }
      }
   }
} );


// Registro malo (password menor a 8 caracteres, sin cumplir condicion
// de 1 letra, 1 numero, 1 caracter especial como minimo
db.empleados.insertMany([
	{usuario: "allanpoe", password: "123", tipo: "Admin"}
]);

db.empleados.insertMany([
	{usuario: "allanpoe", password: "admin123$", tipo: "Admin"}
]);



/*
 *
 * PARTE 6: Uso de explain
 *
 */

db.peliculas.explain().find({$or: [ {pais:'Japan'}, {pais:'China'}]});
