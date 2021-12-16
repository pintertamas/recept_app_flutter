import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/model/ingredient.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/provider/navigation_provider.dart';
import 'package:recipe_app/widgets/ingredient_card.dart';

class IngredientScreen extends StatefulWidget {
  const IngredientScreen();

  @override
  _IngredientScreenState createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  Recipe? recipe;

  _IngredientScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var provider = Provider.of<NavigationProvider>(context);
    Recipe? recipe = provider.currentRecipe;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  recipe!.image,
                  //height: 2 * _width / 3,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Center(
              child: Text(
                recipe.label,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),//TODO: itt valamiért nem enged görgetni 
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                Ingredient ingredient = recipe.ingredients[index];
                return IngredientCard(
                  ingredient: ingredient,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
