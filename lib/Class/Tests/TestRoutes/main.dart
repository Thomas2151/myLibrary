
import 'package:flutter/material.dart';
import 'package:flutter_app/Class/Tests/TestRoutes/FirstScreen.dart';

import 'FirstScreen.dart';
import 'SecondScreen.dart';

void main() async {
  runApp(
    MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    ),
  );
}
