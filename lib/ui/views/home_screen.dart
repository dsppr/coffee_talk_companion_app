import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/character_viewmodel.dart';
import '../../viewmodels/drink_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final characterViewModel = context.read<CharacterViewModel>();
      final drinkViewModel = context.read<DrinkViewModel>();
      characterViewModel.fetchCharacters();
      drinkViewModel.fetchDrinks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final characterViewModel = context.watch<CharacterViewModel>();
    final drinkViewModel = context.watch<DrinkViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Talk Companion'),
        centerTitle: true,
      ),
      body: characterViewModel.isLoading || drinkViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : characterViewModel.errorMessage != null ||
                  drinkViewModel.errorMessage != null
              ? Center(
                  child: Text(
                    characterViewModel.errorMessage ??
                        drinkViewModel.errorMessage ??
                        'Unknown error',
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Characters',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: characterViewModel.characters.length,
                          itemBuilder: (context, index) {
                            final character =
                                characterViewModel.characters[index];
                            return Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Image.network(character.image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                                  Text(character.name),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Drinks',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: drinkViewModel.drinks.length,
                        itemBuilder: (context, index) {
                          final drink = drinkViewModel.drinks[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: Image.network(drink.image,
                                  width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(drink.name),
                              subtitle: Text(
                                  'Ingredients: ${drink.ingredients.join(', ')}'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
