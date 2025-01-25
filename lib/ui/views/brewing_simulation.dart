import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrewingSimulation extends StatefulWidget {
  const BrewingSimulation({super.key});

  @override
  State<BrewingSimulation> createState() => _BrewingSimulationState();
}

class _BrewingSimulationState extends State<BrewingSimulation> {
  static const Color textPrimary = Color(0xFF202124); // Warna teks utama

  final List<String> ingredients = [
    'Coffee',
    'Milk',
    'Honey',
    'Tea',
    'Ginger',
    'Chocolate',
    'Cinnamon',
    'Mint',
    'Green Tea',
  ];

  String? selectedIngredient1;
  String? selectedIngredient2;
  String? selectedIngredient3;

  String? resultMessage;

  final Map<String, String> recipes = {
    'Coffee-Coffee-Coffee': 'Espresso',
    'Milk-Ginger-Honey': 'STMJ',
    'Coffee-Mint-Honey': 'Black Magic',
    'Milk-Cinnamon-Honey': 'Bedchamber',
    'Coffee-Honey-Cinnamon': 'Sugar and Spice',
    'Chocolate-Chocolate-Chocolate': 'Dark Chocolate',
    'Green Tea-Milk-Milk': 'Green Tea Latte',
    'Coffee-Ginger-Cinnamon': 'Gingerbread Coffee',
    'Coffee-Coffee-Milk': 'Cappuccino with Latte Art',
    'Coffee-Ginger-Milk': 'Ginger Latte',
    'Chocolate-Ginger-Cinnamon': 'Bitter Heart',
    'Coffee-Honey-Honey': 'Honey Coffee',
    'Coffee-Coffee-Ginger': 'Jahe Tubruk',
    'Tea-Milk-Ginger': 'Gala Had',
    'Green Tea-Ginger-Ginger': 'Shin Genmaicha',
    'Tea-Lemon-Honey': 'Midsummer Nights Dream',
    'Milk-Honey-Honey': 'Honey Milk',
    'Milk-Milk-Milk': 'Shai Adeni',
    'Coffee-Milk-Milk': 'Caffé Latte',
    'Tea-Tea-Milk': 'Teh Tarik',
    'Chocolate-Honey-Milk': 'Chocobee Miruku',
    'Tea-Ginger-Cinnamon': 'Masala Chai',
    'Tea-Lemon-Cinnamon': 'Russian Tea',
    'Green Tea-Mint-Mint': 'Marrakech',
    'Coffee-Coffee-Lemon': 'Black Lemon',
    'Milk-Honey-Mint': 'Milky Way',
    'Chocolate-Milk-Ginger': 'Spanish Sahara',
  };

  void brewDrink() {
    if (selectedIngredient1 == null ||
        selectedIngredient2 == null ||
        selectedIngredient3 == null) {
      setState(() {
        resultMessage = 'Please select all ingredients!';
      });
      return;
    }

    final combination = [
      selectedIngredient1,
      selectedIngredient2,
      selectedIngredient3
    ].join('-');

    setState(() {
      resultMessage = recipes[combination] ?? 'Unknown Drink';
    });
  }

  void resetSelection() {
    setState(() {
      selectedIngredient1 = null;
      selectedIngredient2 = null;
      selectedIngredient3 = null;
      resultMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Brewing Simulation',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white, // Background putih tanpa gradient
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Ingredients:',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildDropdown('Slot 1', selectedIngredient1, (value) {
              setState(() {
                selectedIngredient1 = value;
              });
            }),
            const SizedBox(height: 16),
            _buildDropdown('Slot 2', selectedIngredient2, (value) {
              setState(() {
                selectedIngredient2 = value;
              });
            }),
            const SizedBox(height: 16),
            _buildDropdown('Slot 3', selectedIngredient3, (value) {
              setState(() {
                selectedIngredient3 = value;
              });
            }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Warna latar tombol "BREW"
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: brewDrink,
                  child: Text(
                    'BREW',
                    style: const TextStyle(
                        color: textPrimary), // Menggunakan textPrimary
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Warna latar tombol "RESET"
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: resetSelection,
                  child: Text(
                    'RESET',
                    style: const TextStyle(
                        color: textPrimary), // Menggunakan textPrimary
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (resultMessage != null)
              Center(
                child: Text(
                  resultMessage!,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: resultMessage == 'Unknown Drink' ||
                            resultMessage == 'Please select all ingredients!'
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, String? selectedValue, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: ingredients.map((ingredient) {
        return DropdownMenuItem(
          value: ingredient,
          child: Text(
            ingredient,
            style: TextStyle(color: textPrimary),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textPrimary),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
