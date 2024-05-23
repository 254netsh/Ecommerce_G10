import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeasy/providers/cart_provider.dart';
import 'providers/cart_provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String category = arguments['category'];
    final Map<String, String> product = arguments['product'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category - ${product['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['image']!),
            const SizedBox(height: 16),
            Text(
              product['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset('images/electric.png'),
            Text(
              product['price']!,
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text(
              product['stock']!,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              product['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['name']} added to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
