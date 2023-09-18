import 'package:flutter/material.dart';

import '../models/quotes_model.dart';

class Favorite with ChangeNotifier {
  final List<Quotes> _favorites = [];
  List<Quotes> get favorites => _favorites;


  void addToFavorites(Quotes quotes) {
    _favorites.add(quotes);
    notifyListeners();
  }

  void removeFromFavorites(Quotes quotes) {
    _favorites.remove(quotes);
    notifyListeners();
  }
}
