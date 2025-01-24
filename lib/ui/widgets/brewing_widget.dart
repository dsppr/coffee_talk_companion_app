import 'package:flutter/material.dart';

class BrewingWidget extends StatelessWidget {
  final List<String> ingredients;
  final VoidCallback onBrew;

  const BrewingWidget({
    super.key,
    required this.ingredients,
    required this.onBrew,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Brewing Simulation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Ingredients:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            ...ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check, size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        ingredient,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: onBrew,
                child: const Text("Brew"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
