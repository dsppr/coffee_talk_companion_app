import 'package:flutter/material.dart';

class BrewingViewModel extends ChangeNotifier {
  final List<String> _selectedIngredients = [];
  List<String> get selectedIngredients => _selectedIngredients;

  void addIngredient(String ingredient) {
    if (_selectedIngredients.length < 3) {
      _selectedIngredients.add(ingredient);
      notifyListeners();
    }
  }

  void resetIngredients() {
    _selectedIngredients.clear();
    notifyListeners();
  }

  bool isCorrectRecipe(List<String> recipe) {
    if (_selectedIngredients.length != recipe.length) return false;
    for (int i = 0; i < recipe.length; i++) {
      if (_selectedIngredients[i] != recipe[i]) return false;
    }
    return true;
  }
}
