import 'package:flutter/material.dart';
import 'package:unesco_heritage/place.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'place_database.db'),
      onCreate: (db, version) {
  return db.execute(
  "CREATE TABLE places(name TEXT PRIMARY KEY, state TEXT, rating DOUBLE, description TEXT, image TEXT, card_image TEXT)",
  );
  },
  version: 1,
  );

  Future<void> insertPlace(Place place) async{
  final Database db=await database;

  await db.insert(
  'places',
  place.toMap(),
  conflictAlgorithm: ConflictAlgorithm.replace,
  );
  }

  Future <List<Place>> placesList() async {
  final Database db =await database;
  final List<Map<String, dynamic>> maps = await db.query('places');

  return List.generate(maps.length, (i) {
  return Place(
  name: maps[i]['name'],
  state: maps[i]['state'],
  rating: maps[i]['rating'],
  description: maps[i]['description'],
  image: maps[i]['image'],
  card_image: maps[i]['card_image'],
  );
  });
  }

  /*List.generate(places.length, (index) async {
    await insertPlace(places[index]);
  });*/

  /*var place1 = Place(name: 'Group of Monuments, Hampi',
  state: 'Karnataka',
  rating: 0.0,
  description: 'Hampi was the capital of the Vijayanagara Empire in the 14th century.',
  image: 'images/hampi.jpg',
  card_image: 'images/hampi_card.jpg',
  );*/

  final List<Place> placesDB = await placesList();  //now that the we have stored the places in the places table in the database.
                          //there is no need of the place.dart because now the data will persist in the database and every time we want to add a new place will will insert directly to it.
  //await insertPlace(place1);
  //print(await placesList());

  runApp(MyApp(placesDB: placesDB));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<Place> placesDB;

  const MyApp({Key key, this.placesDB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(placesDB: placesDB,),
    );
  }
}

class HomePage extends StatelessWidget
{
  final List<Place> placesDB;

  final ValueChanged<Place> onTapHandle;

  const HomePage({Key key, this.onTapHandle, this.placesDB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: true,
              snap: false,
              pinned: false,//try false after 6 cards
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('UNESCO Heritage Sites', style: TextStyle(color: Colors.white),),
                background: Image.asset('images/sliver_image.jpg', fit: BoxFit.cover,),
              ),
            ),
          ];
        },
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 48/78,
            shrinkWrap: true,
            children: List.generate(placesDB.length, (index){
              final place = placesDB[index];
              return GridCard(place: place,);
            }),
          )
        ),
      ),
    );
  }
}

class GridCard extends StatelessWidget
{
  final Place place;
  const GridCard({Key key, this.place}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetails(place: place,)));
    },
      child: Card(
        elevation: 10.0,
        child: Image.asset(place.card_image, fit: BoxFit.cover,),
      )
    );
  }
}

class PlaceDetails extends StatelessWidget
{
  final Place place;

  const PlaceDetails({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name),),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(place.image, fit: BoxFit.cover,),
              ),
              Container(
                child: Text(place.description, textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }
}