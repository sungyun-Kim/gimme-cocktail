import 'package:flutter/material.dart';
import 'package:gimme_cocktail/vo/cocktail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Cocktail _cocktail = new Cocktail();

  void _getCocktail() {
    setState(() {
      _cocktail.setTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("yes"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCocktail,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
