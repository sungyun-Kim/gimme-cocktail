class Cocktail {
  String _name = "";
  String _isAlcoholic = "";
  String _instructions = "";
  String _drinkThumb = "";
  String _ingredient1 = "";
  String _ingredient2 = "";

  get name {
    return _name;
  }

  get isAlcoholic {
    return _isAlcoholic;
  }

  get drinkThumb {
    return _drinkThumb;
  }

  Cocktail.fromJson(Map<String, dynamic> json)
      : _name = json['strDrink'],
        _isAlcoholic = json['strAlcoholic'],
        _instructions = json['strInstructions'],
        _drinkThumb = json['strDrinkThumb'],
        _ingredient1 = json['strIngredient1'],
        _ingredient2 = json['strIngredient2'],
}
