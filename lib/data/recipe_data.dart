import 'package:dio/dio.dart';
import 'package:recipe_app/model/recipes.dart';

Future<Recipes> fetchRecipeData(String query) async {
  const BASE_URL = 'https://api.edamam.com';

  Map<String, dynamic> queryParameters = {
    'type': 'public',
    'q': query,
    'app_id': 'ffbbb5aa',
    'app_key': '1ee0cf15ac95e59c16bc20417cee73e9',
    'random': 'true',
  };

  var options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    queryParameters: queryParameters,
  );
  Dio dio = Dio(options);

  try {
    var response = await dio.get('/api/recipes/v2');
    final statusCode = response.statusCode;
    if (statusCode != 200) {
      print("status code:$statusCode");
    }
    print(response.realUri);
    Recipes recipes = Recipes.fromJson(response.data);
    print(recipes.recipeBlock.length);
    return recipes;
  } on Exception catch (e) {
    print("RecipeList exception for the following query: " +
        query +
        "\n" +
        e.toString());
    return Recipes();
  }
}
