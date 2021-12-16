// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeBlock _$RecipeBlockFromJson(Map<String, dynamic> json) {
  return RecipeBlock()
    ..recipe = json['recipe'] == null
        ? null
        : Recipe.fromJson(json['recipe'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RecipeBlockToJson(RecipeBlock instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
    };
