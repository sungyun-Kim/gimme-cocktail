import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gimme_cocktail/vo/cocktail.dart';
import 'package:gimme_cocktail/widget/cocktail_card.dart';
import 'package:gimme_cocktail/network/network_connection.dart'
    as networkConnection;

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
  late Future<Cocktail> cocktail;

  void _reload() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cocktail = networkConnection.getCocktail();
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
            Column(
              children: [
                FutureBuilder<Cocktail>(
                  future: cocktail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CocktailCard(cocktail: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reload,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
