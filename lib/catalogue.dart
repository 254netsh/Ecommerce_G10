import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class CataloguePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of categories with products
    List<Map<String, dynamic>> categories = [
      {
        'name': 'Electronics',
        'products': [
          {
            'name': 'Product 1',
            'price': '\$100',
            'stock': 'In Stock',
            'description': 'Description 1',
            'image': 'https://tinyurl.com/2p99cydf'
          },
          {
            'name': 'Product 2',
            'price': '\$150',
            'stock': 'In Stock',
            'description': 'Description 2',
            'image': 'https://tinyurl.com/2p99cydf'
          },
        ],
      },
      {
        'name': 'Clothing',
        'products': [
          {
            'name': 'Product 3',
            'price': '\$200',
            'stock': 'Out of Stock',
            'description': 'Description 3',
            'image': 'https://tinyurl.com/2p99cydf'
          },
          {
            'name': 'Product 4',
            'price': '\$250',
            'stock': 'In Stock',
            'description': 'Description 4',
            'image': 'https://tinyurl.com/2p99cydf'
          },
        ],
      },
      {
        'name': 'Home & Kitchen',
        'products': [
          {
            'name': 'Product 5',
            'price': '\$300',
            'stock': 'In Stock',
            'description': 'Description 5',
            'image': 'https://tinyurl.com/2p99cydf'
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(categories[index]['name']),
            children:
                (categories[index]['products'] as List<Map<String, String>>)
                    .map((product) {
              return ListTile(
                title: Text(product['name']!),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/products',
                    arguments: {
                      'category': categories[index]['name'],
                      'product': product,
                    },
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
