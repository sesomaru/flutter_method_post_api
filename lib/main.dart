import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learning API"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null)
                ? postResult.id + " | " + postResult.name + " | "
                : "Tidak ada data"),
            RaisedButton(
              onPressed: () {
                PostResult.connectToAPI("Andan", "Kerja apa saja")
                    .then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("POST"),
            ),
          ],
        )),
      ),
    );
  }
}
