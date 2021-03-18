import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:appfinal/style/theme.dart' as Style;
import 'package:appfinal/widgets/best_movies.dart';
import 'package:appfinal/widgets/genres.dart';
import 'package:appfinal/widgets/now_playing.dart';
import 'package:appfinal/widgets/persons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white),
        title: Text("Peliculas"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.searchOutline, color: Colors.white,)
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          BestMovies(),
          MaterialButton(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
            },
            child: Text("Cerrar Sesion", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 22)),

          )

        ],
      ),
      
    );
  }
}


