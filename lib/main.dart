import 'package:flutter/material.dart';
import 'login.dart';
import 'catalogue.dart';
import 'products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/catalogue': (context) => CataloguePage(),
        '/products': (context) => ProductsPage(),
      },
    );
  }
}
