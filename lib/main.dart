import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/views/splash_screen.dart';
import 'viewmodels/character_viewmodel.dart';
import 'viewmodels/drink_viewmodel.dart';
import 'data/repositories/character_repository.dart';
import 'data/repositories/drink_repository.dart';

void main() {
  runApp(const CoffeeTalkCompanionApp());
}

class CoffeeTalkCompanionApp extends StatelessWidget {
  const CoffeeTalkCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterViewModel(CharacterRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => DrinkViewModel(DrinkRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Talk Companion',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          fontFamily: 'Poppins',
        ),
        home: const SplashScreen(), // Set SplashScreen as the initial page.
      ),
    );
  }
}
