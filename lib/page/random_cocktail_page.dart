import 'package:flutter/material.dart';
import 'package:gimme_cocktail/vo/cocktail.dart';
import 'package:gimme_cocktail/network/network_connection.dart'
    as network_connection;
import 'package:gimme_cocktail/widget/cocktail_card.dart';

class RandomCocktailPage extends StatefulWidget {
  const RandomCocktailPage({Key? key}) : super(key: key);

  @override
  _RandomCocktailPageState createState() => _RandomCocktailPageState();
}

class _RandomCocktailPageState extends State<RandomCocktailPage> {
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
    return Center(
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
          ),
        ],
      ),
    );
  }
}
