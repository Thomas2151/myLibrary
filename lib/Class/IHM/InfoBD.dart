import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Class/Livres/Livre.dart';


class InfoBD extends StatefulWidget {
  @override
  _InfoBDState createState() => _InfoBDState();
}

class _InfoBDState extends State<InfoBD> {
  int _counterPlus = 0;
  int _counterMinus = 0;

  var book = new Livre();

  void _incrementCounter() {
    //setState(() {
    _counterPlus++;
    //});
  }

  void _decreaseCounter() {
    //setState(() {
    _counterMinus--;
    //});
  }

  Future<int> _bar;

  @override
  void initState() {
    super.initState();
    _bar = getBD();
  }

  void _retry() {
    setState(() {
      _bar = getBD();
    });
  }

  Future<int> getBD() async {
    await book.getABook();
    return 42;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //return Text('data chargée${book.title}');
              return Image.network(
                book.urlCover_Taille_M,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              );
            } else {
              return LinearProgressIndicator(
                backgroundColor: Colors.grey,
              );
            }
          },
        ),
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //return Text('data chargée${book.title}');
              return Text("${book.title}",
                  style: Theme.of(context).textTheme.headline4);
            } else {
              return Text("");
            }
          },
        ),
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //return Text('data chargée${book.title}');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: book.editor
                    .map((item) => new Text(item + " ",
                        style: Theme.of(context).textTheme.headline4))
                    .toList(),
              );
            } else {
              return Text("");
            }
          },
        ),
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //return Text('data chargée${book.title}');
              return Text(
                "${book.date}",
                style: Theme.of(context).textTheme.headline4,
              );
            } else {
              return Text("");
            }
          },
        ),
        FutureBuilder<int>(
          future: _bar,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //return Text('data chargée${book.title}');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Like : $_counterPlus  ', //book.like
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Disslike : $_counterMinus', //book.disslike
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                    ),
                  ),
                ],
              );
            } else {
              return Text("");
            }
          },
        ),
        ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: Text('Retour liste'),
        ),
      ],
    );
  }
}
