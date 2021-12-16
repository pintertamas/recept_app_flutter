import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/model/recipe_block.dart';

part 'recipes.g.dart';

@JsonSerializable()
class Recipes {
  @JsonKey(name: 'hits')
  List<RecipeBlock> recipeBlock = [];

  Recipes();

  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}