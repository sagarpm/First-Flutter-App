import 'package:flutter/material.dart';
import 'package:unesco_heritage/place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget
{
  final ValueChanged<Place> onTapHandle;

  const HomePage({Key key, this.onTapHandle}) : super(key: key);

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
            children: List.generate(places.length, (index){
              final place = places[index];
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