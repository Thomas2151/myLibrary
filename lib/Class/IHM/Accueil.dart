import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Ouvrir une bd'),
            // Within the `FirstScreen` widget
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/second');

            }),
      ),
    );
  }
}
