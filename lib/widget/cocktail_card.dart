import 'package:flutter/material.dart';
import 'package:gimme_cocktail/vo/cocktail.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailCard({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Text(cocktail.name),
            Text(cocktail.isAlcoholic),
            Image.network(cocktail.drinkThumb,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
