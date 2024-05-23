import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, String> product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
