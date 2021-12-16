import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/navigation_provider.dart';
import 'package:recipe_app/screen/recipe_app.dart';

class StartWithProvider extends StatelessWidget {
  StartWithProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationProvider>(
      create: (context) => NavigationProvider(),
      child: MaterialApp(home: RecipeApp()),
    );
  }
}
