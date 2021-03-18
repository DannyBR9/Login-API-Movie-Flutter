import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        ),
      body: Center(
        child: MaterialButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
        },
        child: Text("Cerrar Sesion"),
        ),
        )
    );
  }
}