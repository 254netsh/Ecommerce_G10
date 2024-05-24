import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> product) {
    product['quantity'] = '1'; // Set quantity to 1 when adding a new product
      // Retrieve the price value from the product and ensure it's in the correct format
    double price = double.tryParse(product['price']?.replaceAll('\$', '') ?? '0.0') ?? 0.0;
    product['price'] = price.toStringAsFixed(2);

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

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      double price = double.tryParse(item['price'] ?? '0.0') ?? 0.0;
      int quantity = int.tryParse(item['quantity'] ?? '0') ?? 0;
        double itemTotal = price * quantity;
    print('Price: $price, Quantity: $quantity, Item Total: $itemTotal');
    totalPrice += itemTotal;
    }
     print('Total Price: $totalPrice');
    return totalPrice;
  }
}
