import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Access CartProvider

    double totalPrice = cartProvider.calculateTotalPrice(); // Calculate total price

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length > 0 ? cartProvider.cartItems.length : 1, // Check if cart is empty
              itemBuilder: (context, index) {
                if (cartProvider.cartItems.isEmpty) {
                  // Display placeholder image and buttons if cart is empty
                  return Container(
                    height: 250, // Set height of the container
                    width: 150, // Set width of the container
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, size: 100), // Placeholder icon
                          Text('No items in cart', style: TextStyle(fontSize: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  // Implement logic to add item to cart
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  // Implement logic to remove item from cart
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  // Display actual product image and buttons if cart is not empty
                  final item = cartProvider.cartItems[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(item['image']), // Product image
                      title: Text(item['name']),
                      subtitle: Text('Price: \$${item['price']} x ${item['quantity']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () => cartProvider.removeFromCart(index), // Remove from cart
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle),
                            onPressed: () {
                              // Get the current quantity of the item
                              int currentQuantity = cartProvider.cartItems[index]['quantity'];
                              
                              // Increase the quantity by 1
                              int newQuantity = currentQuantity + 1;

                              // Call the updateQuantity method of CartProvider to update the quantity
                              cartProvider.updateQuantity(index, newQuantity);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Proceed to payment
              },
              child: const Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}