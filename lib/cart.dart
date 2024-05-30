import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>().cartItems;
    var totalPrice = context.watch<CartProvider>().calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust as needed
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          cart[index]['image']!,
                          height: 200, // Adjust as needed
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8.0),
                        Text(cart[index]['name']!),
                        Text('Price: ${cart[index]['price']}'),
                        Text('Quantity: ${cart[index]['quantity']}'),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .incrementQuantity(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .decrementQuantity(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeFromCart(cart[index]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total Price: \$${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
