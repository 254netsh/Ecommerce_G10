import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Dummy data for cart items
  List<Map<String, dynamic>> _cartItems = [
    {'name': 'Product 1', 'price': 100, 'image': 'https://example.com/product1.jpg', 'quantity': 1},
    {'name': 'Product 2', 'price': 150, 'image': 'https://example.com/product2.jpg', 'quantity': 2},
    // Add more items as needed
  ];

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartItems.add(product);
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Added to Cart'),
          content: Text('${product['name']} has been added to your cart.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(item['image']),
                    title: Text(item['name']),
                    subtitle: Text('Price: \$${item['price']} x ${item['quantity']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () => _removeFromCart(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement payment functionality
              },
              child: Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}
