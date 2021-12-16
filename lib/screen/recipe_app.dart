import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/model/recipe_block.dart';
import 'package:recipe_app/model/recipes.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class RecipeApp extends StatefulWidget {
  RecipeApp({Key? key}) : super(key: key);

  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  Recipes recipes = Recipes();
  late Future<Recipes>? recipesData;
  String query = "";
  final _searchController = TextEditingController();
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Recipe App');

  Future<Recipes> getData(String query) async {
    try {
      recipes = await fetchRecipeData(query);
      setState(() {});
      return recipes;
    } catch (e) {
      print(e);
      return recipes;
    }
  }

  @override
  void initState() {
    super.initState();
    recipesData = null;
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          query = _searchController.text;
                          recipesData = getData(query);
                          _searchController.clear();
                          customIcon = const Icon(Icons.search);
                          customSearchBar = const Text('Recipe App');
                        });
                      },
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Recipe App');
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Center(
                  child: Text(
                    "Results for " + query + ":",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: _width,
            height: _height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: recipesData == null
                  ? Center(
                      child: Text("search for recipes"),
                    )
                  : FutureBuilder<Recipes?>(
                      future: recipesData,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? snapshot.data!.recipeBlock.length > 0
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(10),
                                    itemCount:
                                        snapshot.data!.recipeBlock.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      RecipeBlock recipeBlock =
                                          snapshot.data!.recipeBlock[index];
                                      return RecipeCard(
                                        recipe: recipeBlock.recipe!,
                                      );
                                    })
                                : Center(
                                    child: Text(
                                        "I did not find any recipe matching your search :("),
                                  )
                            : Center(
                                child: Text('Loading'),
                              );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
