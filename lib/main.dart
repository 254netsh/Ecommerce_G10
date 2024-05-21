// Importing the necessary Flutter material package
import 'package:flutter/material.dart';

void main() {
  // Entry point of the application, runApp function starts the app
  runApp(const MyApp());
}

// MyApp class which is the root of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides the structure for the app
    return MaterialApp(
      title: 'Shopeasy', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color theme
        scaffoldBackgroundColor: const Color(0xFFF5F5DC), // Background color
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: const MyHomePage(), // Set the home page
    );
  }
}

// MyHomePage class representing the home page of the app
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController(); // Controller for search input

  // List of categories with names and image URLs
  List<Map<String, String>> categories = [
    {'name': 'Electronics', 'image': 'https://tinyurl.com/5d5bwe8a'},
    {'name': 'Clothing', 'image': 'https://cdn.pixabay.com/photo/2019/03/01/02/48/store-4027251_640.jpg'},
    {'name': 'Shoes', 'image': 'https://tinyurl.com/3b5reu78'},
    {'name': 'Books', 'image': 'https://tinyurl.com/56ketjmw'},
    {'name': 'Home & Kitchen', 'image': 'https://cdn.pixabay.com/photo/2019/09/18/17/19/village-shop-4487285_640.jpg'},
    {'name': 'Toys', 'image': 'https://tinyurl.com/mbdc4nt9'},
  ];

  List<Map<String, String>> displayedCategories = []; // List of categories to display

  @override
  void initState() {
    super.initState();
    displayedCategories = List.from(categories); // Initialize displayed categories
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopeasy'), // Title of the app bar
        actions: <Widget>[
          // Search bar
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Categories...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: _filterCategories, // Filter categories as the user types
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person), // Profile icon
            onPressed: () {
              // Navigate to profile screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart), // Cart icon
            onPressed: () {
              // Navigate to cart screen
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
      // GridView to display categories
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0), // Padding for the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 1.0, // Aspect ratio of each tile (width / height)
        ),
        itemCount: displayedCategories.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          // GestureDetector to handle taps on the category tiles
          return GestureDetector(
            onTap: () {
              // Navigate to category screen with the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(category: displayedCategories[index]['name']!),
                ),
              );
            },
            child: Card(
              elevation: 3.0, // Elevation of the card
              child: Column(
                children: [
                  Expanded(
                    // Display category image
                    child: Image.network(
                      displayedCategories[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Padding around the text
                    child: Text(
                      displayedCategories[index]['name']!, // Display category name
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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

  // Function to filter categories based on search input
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

// Screen to display the products of a specific category
class CategoriesScreen extends StatelessWidget {
  final String category;

  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of products with details
    List<Map<String, String>> electronicsProducts = [
      {'name': 'Laptop', 'price': '\$1000', 'stock': 'High performance laptop', 'image': 'https://cdn.pixabay.com/photo/2017/11/27/21/31/computer-2982270_640.jpg'},
      {'name': 'Smartphone', 'price': '\$800', 'stock': 'Latest model smartphone', 'image': 'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png'},
      {'name': 'Headphones', 'price': '\$150', 'stock': 'Noise-cancelling headphones', 'image': 'https://cdn.pixabay.com/photo/2018/09/17/14/27/headphones-3683983_640.jpg'},
      {'name': 'Camera', 'price': '\$500', 'stock': 'High resolution camera', 'image': 'https://cdn.pixabay.com/photo/2023/11/14/15/46/nikon-8388022_640.jpg'},
      {'name': 'Smartwatch', 'price': '\$200', 'stock': 'Huawei smartwatch', 'image': 'https://cdn.pixabay.com/photo/2018/10/02/11/44/huawei-3718609_640.jpg'},
    ];

    List<Map<String, String>> clothingProducts = [
      {'name': 'T-Shirt', 'price': '\$20', 'stock': 'Comfortable cotton t-shirt', 'image': 'https://cdn.pixabay.com/photo/2019/07/27/21/42/t-shirt-4367577_640.jpg'},
      {'name': 'Jeans', 'price': '\$40', 'stock': 'Stylish blue jeans', 'image': 'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_1280.jpg'},
      {'name': 'Jacket', 'price': '\$60', 'stock': 'Warm leather jacket', 'image': 'https://cdn.pixabay.com/photo/2015/07/12/19/23/clothing-842338_640.jpg'},
      {'name': 'Scarfs', 'price': '\$50', 'stock': 'Beautiful scarfs', 'image': 'https://cdn.pixabay.com/photo/2017/08/20/14/02/colorful-scarves-2661828_640.jpg'},
      {'name': 'Cowboy Hats', 'price': '\$15', 'stock': 'Quality cowboy hats', 'image': 'https://cdn.pixabay.com/photo/2016/09/16/18/02/for-sale-1674726_640.jpg'},
    ];

    List<Map<String, String>> shoesProducts = [
      {'name': 'Running Shoes', 'price': '\$120', 'stock': 'Comfortable running shoes', 'image': 'https://cdn.pixabay.com/photo/2015/02/09/13/40/shoe-629643_640.jpg'},
      {'name': 'Sneakers', 'price': '\$80', 'stock': 'Stylish sneakers', 'image': 'https://cdn.pixabay.com/photo/2017/09/20/22/22/sneakers-2770092_640.png'},
      {'name': 'Formal Shoes', 'price': '\$150', 'stock': 'Elegant formal shoes', 'image': 'https://cdn.pixabay.com/photo/2017/11/11/18/45/fashion-2939996_640.jpg'},
      {'name': 'Sandals', 'price': '\$40', 'stock': 'Comfortable summer sandals', 'image': 'https://cdn.pixabay.com/photo/2014/05/30/05/00/shoes-357897_640.jpg'},
      {'name': 'Boots', 'price': '\$180', 'stock': 'Durable boots', 'image': 'https://cdn.pixabay.com/photo/2017/05/07/18/34/cowboy-boots-2293164_640.jpg'},
    ];

    List<Map<String, String>> booksProducts = [
      {'name': 'Novel', 'price': '\$10', 'stock': 'Bestselling novels', 'image': 'https://cdn.pixabay.com/photo/2018/11/13/18/04/books-3813612_640.jpg'},
      {'name': 'Biography', 'price': '\$15', 'stock': 'Inspiring biography', 'image': 'https://cdn.pixabay.com/photo/2018/04/16/10/02/flea-market-3324131_640.jpg'},
      {'name': 'Science Fiction', 'price': '\$12', 'stock': 'Exciting sci-fi book', 'image': 'https://cdn.pixabay.com/photo/2021/09/14/10/18/books-6623568_640.jpg'},
      {'name': 'Cookbook', 'price': '\$20', 'stock': 'Popular cookbook', 'image': 'https://cdn.pixabay.com/photo/2015/04/29/19/33/cookbook-746005_640.jpg'},
      {'name': 'Children\'s Book', 'price': '\$8', 'stock': 'Colorful children\'s book', 'image': 'https://cdn.pixabay.com/photo/2013/05/02/10/53/picture-108539_640.jpg'},
    ];

    List<Map<String, String>> homeKitchenProducts = [
      {'name': 'Blender', 'price': '\$50', 'stock': 'High-speed blender', 'image': 'https://cdn.pixabay.com/photo/2011/12/05/14/30/blender-10932_640.jpg'},
      {'name': 'Microwave', 'price': '\$100', 'stock': 'Compact microwave oven', 'image': 'https://cdn.pixabay.com/photo/2020/05/08/09/23/appliance-5144884_640.jpg'},
      {'name': 'Wooden utensils', 'price': '\$80', 'stock': 'Quality wooden utensils', 'image': 'https://cdn.pixabay.com/photo/2021/11/26/19/25/wooden-kitchen-utensils-6826540_640.jpg'},
      {'name': 'Coffee Maker', 'price': '\$60', 'stock': 'Coffee maker', 'image': 'https://cdn.pixabay.com/photo/2017/04/11/02/00/kettle-2220369_640.jpg'},
      {'name': 'Vacuum Cleaner', 'price': '\$150', 'stock': 'Powerful vacuum cleaner', 'image': 'https://cdn.pixabay.com/photo/2015/03/03/18/39/vacuum-cleaner-657719_640.jpg'},
    ];

    List<Map<String, String>> toysProducts = [
      {'name': 'Lego Set', 'price': '\$40', 'stock': 'Creative Lego blocks', 'image': 'https://cdn.pixabay.com/photo/2017/06/30/15/53/lego-blocks-2458575_640.jpg'},
      {'name': 'Action Figure', 'price': '\$25', 'stock': 'Popular action figure', 'image': 'https://cdn.pixabay.com/photo/2022/08/23/13/52/toys-7405811_640.jpg'},
      {'name': 'Board Game', 'price': '\$30', 'stock': 'Family board game', 'image': 'https://cdn.pixabay.com/photo/2021/11/27/21/09/bunny-kingdom-6828907_640.jpg'},
      {'name': 'Doll', 'price': '\$20', 'stock': 'Beautiful doll', 'image': 'https://cdn.pixabay.com/photo/2016/12/20/23/47/doll-1921810_640.jpg'},
      {'name': 'Puzzle', 'price': '\$15', 'stock': 'Challenging puzzle', 'image': 'https://cdn.pixabay.com/photo/2015/03/01/16/52/puzzle-654957_640.jpg'},
    ];

    List<Map<String, String>> products;

    switch (category) {
      case 'Electronics':
        products = electronicsProducts;
        break;
      case 'Clothing':
        products = clothingProducts;
        break;
      case 'Shoes':
        products = shoesProducts;
        break;
      case 'Books':
        products = booksProducts;
        break;
      case 'Home & Kitchen':
        products = homeKitchenProducts;
        break;
      case 'Toys':
        products = toysProducts;
        break;
      default:
        products = [];
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category), // Title of the app bar
        centerTitle: true, // Center the title
      ),
      // GridView to display products
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0), // Padding for the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 1.0, // Aspect ratio of each tile (width / height)
        ),
        itemCount: products.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          // GestureDetector to handle taps on the product tiles
          return GestureDetector(
            onTap: () {
              // Add the product to the cart
              _addToCart(context, products[index]);
            },
            child: Card(
              elevation: 3.0, // Elevation of the card
              child: Column(
                children: [
                  Expanded(
                    // Display product image
                    child: Image.network(
                      products[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Padding around the text
                    child: Text(
                      products[index]['name']!, // Display product name
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    products[index]['price']!, // Display product price
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    products[index]['stock']!, // Display product stock status
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to add the product to the cart
  void _addToCart(BuildContext context, Map<String, String> product) {
    // Implement logic to add the product to the cart
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Added to Cart'), // Alert dialog title
          content: Text('${product['name']} has been added to your cart.'), // Alert dialog content
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'), // OK button
            ),
          ],
        );
      },
    );
  }
}

// Dummy ProfileScreen class to represent the user profile
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), // Title of the app bar
        centerTitle: true, // Center the title
      ),
      body: const Center(
        child: Text('User Profile Screen'), // Text content of the profile screen
      ),
    );
  }
}

// Dummy CartScreen class to represent the shopping cart
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'), // Title of the app bar
        centerTitle: true, // Center the title
      ),
      body: const Center(
        child: Text('Shopping Cart Screen'), // Text content of the shopping cart screen
      ),
    );
  }
}
