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
        title: Text('Cart'),
      ),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty.'))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust as needed
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
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
                        SizedBox(height: 8.0),
                        Text(cart[index]['name']!),
                        Text('Price: ${cart[index]['price']}'),
                        Text('Quantity: ${cart[index]['quantity']}'),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                context.read<CartProvider>().incrementQuantity(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                context.read<CartProvider>().decrementQuantity(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context.read<CartProvider>().removeFromCart(cart[index]);
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
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

