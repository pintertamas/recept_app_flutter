import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "ingredient.g.dart";

@JsonSerializable()
class Ingredient {
  @required
  final String? text;
  @required
  final double? quantity;
  @required
  final String? measure;
  @required
  final String? food;
  @required
  final String? image;

  Ingredient(
      this.text,
      this.quantity,
      this.measure,
      this.food, this.image,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
