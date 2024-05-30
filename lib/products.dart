import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class ProductsPage extends StatelessWidget {
  final String category;
  final List<Map<String, String>> products;

  const ProductsPage({
    Key? key,
    required this.category,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 50),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      category: category,
                      product: products[index],
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      products[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          products[index]['price']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String category;
  final Map<String, String> product;

  const ProductDetailPage({
    Key? key,
    required this.category,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category - ${product['name']}'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 50),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 16),
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