import 'dart:convert';

import 'package:gimme_cocktail/vo/cocktail.dart';
import 'package:http/http.dart' as http;

Future<Cocktail> getCocktail() async {

  print("Log: network");

  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    String temp = response.body;
    return Cocktail.fromJson(jsonDecode(temp.substring(11,temp.length-2)));
  } else {
    throw Exception("failed to connect");
  }
}
