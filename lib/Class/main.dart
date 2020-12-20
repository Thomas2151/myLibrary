import 'package:flutter/material.dart';
import 'IHM/Accueil.dart';
import 'IHM/InfoBD.dart';

void main() async {
  runApp(
    MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Accueil(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => InfoBD(),
      },
    ),
  );
}
