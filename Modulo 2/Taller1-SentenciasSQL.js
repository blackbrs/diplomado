db = connect( 'mongodb://localhost/laboratorio1' );

db.animales.find({ pais: 'China' });
db.animales.find({ nombreCientifico: /Odocoileus.*/ });


db.tarjetasCredito.aggregate([
    {"$group" : {_id: "$tipo", count:{$sum:1}}}
]);

db.tarjetasCredito.aggregate([
    {"$group" : 
		{
			_id: {tipo: "$tipo", pais: "$pais"}, 
			count:{$sum:1}
		}
	},
	{ $sort:{"_id.tipo":1} }
]);


db.peliculas.find({ genero: /.*Drama.*/ }).count();
db.peliculas.distinct("director");


db.usuarios.aggregate(
	{
		"$group": {_id:"$edad", fullDocument:{$push:"$$ROOT"}, count:{$sum:1}}
	},
	{
		$sort:{"_id":-1}
	},
	{
		$limit:1
	}
);

db.usuarios.aggregate(
	{
		"$group": { _id: "$genero", mediaEdad: {$avg: "$edad"} }
	}
);


db.carros.find({ fabricante: "Dodge" }).distinct("modelo");
db.carros.distinct("modelo", { fabricante: "Dodge" });