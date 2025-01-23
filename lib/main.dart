import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/character_viewmodel.dart';
import 'viewmodels/drink_viewmodel.dart';
import 'viewmodels/brewing_viewmodel.dart';
import '../data/repositories/character_repository.dart';
import '../data/repositories/drink_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterViewModel(CharacterRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => DrinkViewModel(DrinkRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => BrewingViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Talk Companion',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const Scaffold(
        body: Center(child: Text('Coffee Talk Companion App')),
      ),
    );
  }
}
