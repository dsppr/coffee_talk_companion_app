import 'package:flutter/material.dart';

class BrewingSimulation extends StatelessWidget {
  const BrewingSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Brewing Simulation')),
      body: Center(
        child: Text(
          'Brewing Simulation Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
