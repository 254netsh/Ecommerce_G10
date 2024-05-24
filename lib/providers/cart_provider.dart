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

  void incrementQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      int currentQuantity = int.tryParse(_cartItems[index]['quantity'] ?? '0') ?? 0;
      currentQuantity++;
      _cartItems[index]['quantity'] = currentQuantity.toString();
      notifyListeners();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      int currentQuantity = int.tryParse(_cartItems[index]['quantity'] ?? '0') ?? 0;
      if (currentQuantity > 0) {
        currentQuantity--;
        _cartItems[index]['quantity'] = currentQuantity.toString();
        notifyListeners();
      }
    }
  }
}
