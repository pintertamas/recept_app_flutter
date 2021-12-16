import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'recipe.g.dart';

@JsonSerializable()
@JsonKey(name: 'recipe')
class Recipe {
  @required
  final String label;
  @required
  final String image;
  @required
  final String url;
  @required
  final double? totalTime;
  @required
  final List<Ingredient> ingredients;

  Recipe(
    this.label,
    this.image,
    this.url,
    this.ingredients,
    this.totalTime,
  );

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
