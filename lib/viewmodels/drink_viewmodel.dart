import 'package:flutter/material.dart';
import '../data/models/drink_model.dart';
import '../data/repositories/drink_repository.dart';

class DrinkViewModel extends ChangeNotifier {
  final DrinkRepository _repository;

  DrinkViewModel(this._repository);

  List<Drink> _drinks = [];
  List<Drink> get drinks => _drinks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDrinks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _drinks = await _repository.fetchDrinks();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
