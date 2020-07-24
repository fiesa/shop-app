import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.price,
      this.isFavorite = false});

  void _isFavStatus(bool newStatus) {
    isFavorite = newStatus;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    var oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = 'https://flutter-update-c6abe.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
        _isFavStatus(oldStatus);
      }
    } catch (error) {
      _isFavStatus(oldStatus);
      notifyListeners();
    }
  }
}
