import 'package:flutter/cupertino.dart';
import 'package:recipe_app/model/recipe.dart';

class NavigationProvider with ChangeNotifier {
  Recipe? _currentRecipe;

  Recipe? get currentRecipe => _currentRecipe;

  set currentRecipe(Recipe? currentRecipe) {
    _currentRecipe = currentRecipe;
    notifyListeners();
  }
}
