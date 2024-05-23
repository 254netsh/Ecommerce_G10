import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
/*
  void updateQuantity(int index, int newQuantity) {
  if (index >= 0 && index < _cartItems.length) {
    _cartItems[index]['quantity'] = newQuantity;
    notifyListeners();
  } else {
    print('Invalid index');
  }
}


  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  double calculateTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }*/
}
