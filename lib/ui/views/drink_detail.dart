import 'package:flutter/material.dart';
import 'brewing_simulation.dart';

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
            Center(
              // Membuat gambar berada di tengah
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  '${drink['image']}',
                  fit: BoxFit
                      .contain, // Menyesuaikan ukuran gambar tanpa memotong
                ),
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
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BrewingSimulation(),
                    ),
                  );
                },
                child: const Text("Start Brewing"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
