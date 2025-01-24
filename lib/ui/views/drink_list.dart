import 'package:flutter/material.dart';
import '../widgets/drink_card.dart';

class DrinkList extends StatelessWidget {
  final List<Map<String, dynamic>> drinks;

  const DrinkList({super.key, required this.drinks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 4,
        ),
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return DrinkCard(
            name: drink['name'],
            image: 'lib/assets/images/${drink['image']}',
            ingredients: List<String>.from(drink['ingredients']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrinkDetail(
                    drink: drink,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DrinkDetail extends StatelessWidget {
  final Map<String, dynamic> drink;

  const DrinkDetail({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'lib/assets/images/${drink['image']}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              drink['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...List<String>.from(drink['ingredients']).map(
              (ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      ingredient,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
