import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../widgets/character_card_carousel.dart';
import '../widgets/drink_card_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> characters = [];
  late List<Map<String, dynamic>> drinks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/data/mock_data.json');
    final data = jsonDecode(jsonString);
    setState(() {
      characters = List<Map<String, dynamic>>.from(data['characters']);
      drinks = List<Map<String, dynamic>>.from(data['drinks']);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Talk Companion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Characters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CharacterCardCarousel(characters: characters),
            const SizedBox(height: 24),
            const Text(
              'Drinks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: DrinkCardGrid(drinks: drinks),
            ),
          ],
        ),
      ),
    );
  }
}
