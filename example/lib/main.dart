import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget card(String label) => Card(
    child: Container(
      width: 100,
      height: 100,
      child: Center(child: Text(label, style: TextStyle(fontSize: 16),)),
    )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Entry(
                delay: Duration(seconds: 1),
                child: card("Entry()")
              ),
              Entry.alpha(
                delay: Duration(seconds: 1),
                child: card("Entry.alpha()")
              ),
              Entry.scale(
                delay: Duration(seconds: 1),
                child: card("Entry.scale()")
              ),
              Entry.offset(
                delay: Duration(seconds: 1),
                child: card("Entry.offset()")
              ),
            ]
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () async {
                // Re-initializes the whole page to show the animations again
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
              }
            );
          }
        ),
      ),
    );
  }
}
