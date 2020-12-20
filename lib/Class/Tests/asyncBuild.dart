import 'package:flutter/material.dart';


void main() async {
  runApp(
    MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FooWidget(),
      },
    ),
  );
}

class FooWidget extends StatefulWidget {
  @override
  _FooWidgetState createState() => _FooWidgetState();
}

class _FooWidgetState extends State<FooWidget> {
  Future<int> _bar;

  @override
  void initState() {
    super.initState();
    _bar = doSomeLongRunningCalculation();
  }

  void _retry() {
    setState(() {
      _bar = doSomeLongRunningCalculation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              return Text('The answer to everything is ${snapshot.data}');
            } else {
              return Text('Calculating answer...');
            }
          },
        ),
        RaisedButton(
          onPressed: _retry,
          child: Text('Retry'),
        )
      ],
    );
  }
}

Future<int> doSomeLongRunningCalculation() async {
  await Future.delayed(Duration(seconds: 5)); // wait 5 sec
  return 42;
}