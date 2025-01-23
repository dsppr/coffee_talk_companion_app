import 'package:flutter/material.dart';
import '../data/models/character_model.dart';
import '../data/repositories/character_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharacterRepository _repository;

  CharacterViewModel(this._repository);

  List<Character> _characters = [];
  List<Character> get characters => _characters;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      _characters = await _repository.fetchCharacters();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
