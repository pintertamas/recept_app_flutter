// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipes _$RecipesFromJson(Map<String, dynamic> json) {
  return Recipes()
    ..recipeBlock = (json['hits'] as List<dynamic>)
        .map((e) => RecipeBlock.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RecipesToJson(Recipes instance) => <String, dynamic>{
      'hits': instance.recipeBlock,
    };
