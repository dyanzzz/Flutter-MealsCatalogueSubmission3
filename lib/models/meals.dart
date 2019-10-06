class Meals {
  final String idMeal, strMeal, strMealThumb, strInstructions, 
  strCategory, strArea, strTags,
  strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
  strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5;

  Meals({
    this.idMeal, 
    this.strMeal, 
    this.strMealThumb, 
    this.strInstructions,
    this.strCategory,
    this.strArea,
    this.strTags,

    this.strIngredient1,this.strIngredient2,this.strIngredient3,
    this.strIngredient4,this.strIngredient5,

    this.strMeasure1,this.strMeasure2,this.strMeasure3,
    this.strMeasure4,this.strMeasure5
  });

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'] as String,
        strInstructions: json['strInstructions'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strTags: json['strTags'],

        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strIngredient4: json['strIngredient4'],
        strIngredient5: json['strIngredient5'],

        strMeasure1: json['strMeasure1'],
        strMeasure2: json['strMeasure2'],
        strMeasure3: json['strMeasure3'],
        strMeasure4: json['strMeasure4'],
        strMeasure5: json['strMeasure5']
        
    );
  }
}
