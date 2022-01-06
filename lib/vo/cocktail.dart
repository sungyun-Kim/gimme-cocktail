class Cocktail {
  String name = "";
  String isAlcoholic = "";
  String instructions = "";
  String drinkThumb = "";
  String ingredient1 = "";
  String ingredient2 = "";
  String ingredient3 = "";
  String measure1 = "";
  String measure2 = "";
  String measure3 = "";

  Cocktail();

  void setTest() {
    name = "Whitecap Margarita";
    isAlcoholic = "Alcoholic";
    instructions =
        "Place all ingredients in a blender and blend until smooth. This makes one drink.";
  }

  Cocktail.fromJson(Map<String, dynamic> json)
      : name = json['strDrink'],
        isAlcoholic = json['strAlcoholic'],
        instructions = json['strInstructions'],
        drinkThumb = json['strDrinkThumb'],
        ingredient1 = json['strIngredient1'],
        ingredient2 = json['strIngredient2'],
        ingredient3 = json['strIngredient3'],
        measure1 = json['strMeasure1'],
        measure2 = json['strMeasure2'],
        measure3 = json['strMeasure3'];
}
