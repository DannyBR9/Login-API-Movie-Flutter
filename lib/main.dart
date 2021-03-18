
//import 'package:appfinal/pantallas/homepage.dart';
import 'package:appfinal/pantallas/loginpage.dart';
import 'package:appfinal/screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {

  final Future<FirebaseApp> _inicializacion = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _inicializacion,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error ${snapshot.error}"),)
          );
        }

        if (snapshot.connectionState==ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if (snapshot.connectionState==ConnectionState.active) {
                User user = snapshot.data;

                if (user==null) {
                  return LoginPage();
                }else{
                  return HomeScreen();
                }
              }
            },
          );
        }
        return Scaffold(
          body: Center(
            child: Text("Verificando a la base"),
          ),
        );
      },
    );
  }
}