import 'package:flutter/material.dart';
import 'package:gimme_cocktail/page/main_page.dart';
import 'package:gimme_cocktail/page/random_cocktail_page.dart';
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
      title: 'seongyeon kim',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'HeirofLight',
      ),
      home: const MyHomePage(title: 'seongyeon kim'),
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
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: const [
            DrawerHeader(child: Text("ksy Drawer")),
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: mediaQuery.size.height * 0.05,
                backgroundColor: Colors.black,
                pinned: true,
                floating: true,
                snap: true,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('sykim playground'),
                ),
              ),
            ];
          },
          body: PageView(
            controller: pageController,
            children: const [MainPage(), RandomCocktailPage()],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _reload,
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  final pageController = PageController(
    initialPage: 0,
  );
}
