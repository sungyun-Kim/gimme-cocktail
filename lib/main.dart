import 'package:flutter/material.dart';
import 'package:gimme_cocktail/vo/cocktail.dart';
import 'package:gimme_cocktail/widget/cocktail_card.dart';
import 'package:gimme_cocktail/network/network_connection.dart'
    as network_connection;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GimmeCocktail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GimmeCocktail'),
      debugShowCheckedModeBanner: false,
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
    setState(() {
    cocktail = network_connection.getCocktail();
    });
  }

  @override
  void initState() {
    super.initState();
    cocktail = network_connection.getCocktail();
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
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
