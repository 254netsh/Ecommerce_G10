import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>().cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : Column(
              children: cart.map((item) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(item['image']!),
                        SizedBox(height: 8.0),
                        Text(item['name']!),
                        Text('Price: ${item['price']}'),
                        Text('Quantity: ${item['quantity']}'),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                context.read<CartProvider>().incrementQuantity(cart.indexOf(item));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                context.read<CartProvider>().decrementQuantity(cart.indexOf(item));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context.read<CartProvider>().removeFromCart(item);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
