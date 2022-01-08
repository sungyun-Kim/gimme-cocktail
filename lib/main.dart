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
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'HeirofLight',
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
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
            actions: const [
              IconButton(onPressed: null, icon: Icon(Icons.call)),
            ],
            title: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Kim",
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.05)),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reload,
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
