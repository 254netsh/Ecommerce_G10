import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'catalogue.dart';
import 'products.dart';
import 'SingUpPage.dart';
import 'cart.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shopeasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignupPage(),
        '/catalogue': (context) => CataloguePage(),
        '/products': (context) => ProductsPage(
            category: '', products: []), // This won't be used directly
        '/cart': (context) => CartPage(),
      },
    );
  }
}
