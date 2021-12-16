import 'package:flutter/material.dart';
import 'package:recipe_app/screen/start_with_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartWithProvider(),
    );
  }
}