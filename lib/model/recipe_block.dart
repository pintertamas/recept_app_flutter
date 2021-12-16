import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/model/recipe.dart';

part 'recipe_block.g.dart';

@JsonSerializable()
class RecipeBlock {
  @JsonKey(name: "recipe")
  Recipe? recipe;

  RecipeBlock();

  factory RecipeBlock.fromJson(Map<String, dynamic> json) =>
      _$RecipeBlockFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeBlockToJson(this);
}