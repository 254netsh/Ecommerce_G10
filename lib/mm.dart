import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopeasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 85, 85, 62),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> categories = [
    {'name': 'Electronics', 'image': 'https://tinyurl.com/5d5bwe8a'},
    {'name': 'Clothing', 'image': 'https://tinyurl.com/2y3hc96z'},
    {'name': 'Shoes', 'image': 'https://tinyurl.com/3b5reu78'},
    {'name': 'Books', 'image': 'https://tinyurl.com/56ketjmw'},
    {'name': 'Home & Kitchen', 'image': 'https://tinyurl.com/4edk89yx'},
    {'name': 'Toys', 'image': 'https://tinyurl.com/mbdc4nt9'},
  ];

  List<Map<String, String>> displayedCategories = [];

  @override
  void initState() {
    super.initState();
    displayedCategories = List.from(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopeasy'),
        actions: <Widget>[
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Categories...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: _filterCategories,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: displayedCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(
                    category: displayedCategories[index]['name']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      displayedCategories[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      displayedCategories[index]['name']!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
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

  void _filterCategories(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedCategories = List.from(categories);
      });
      return;
    }
    final filtered = categories.where((category) {
      final categoryName = category['name']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return categoryName.contains(searchLower);
    }).toList();

    setState(() {
      displayedCategories = filtered;
    });
  }
}

class CategoriesScreen extends StatelessWidget {
  final String category;

  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {
        'name': 'Product 1',
        'price': '\$100',
        'stock': 'In Stock',
        'description': 'Description 1',
        'image': 'https://tinyurl.com/4v8b97rt'
      },
      {
        'name': 'Product 2',
        'price': '\$150',
        'stock': 'In Stock',
        'description': 'Description 2',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Product 3',
        'price': '\$200',
        'stock': 'Out of Stock',
        'description': 'Description 3',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Product 4',
        'price': '\$250',
        'stock': 'In Stock',
        'description': 'Description 4',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Product 5',
        'price': '\$300',
        'stock': 'In Stock',
        'description': 'Description 5',
        'image': 'https://via.placeholder.com/150'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _addToCart(context, products[index]);
            },
            child: Card(
              elevation: 3.0,
              child: Column(
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
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          products[index]['price']!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          products[index]['stock']!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
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

  void _addToCart(BuildContext context, Map<String, String> product) {
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
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('User Profile Screen'),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Shopping Cart Screen'),
      ),
    );
  }
}
