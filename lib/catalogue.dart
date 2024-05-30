import 'package:flutter/material.dart';
import 'products.dart';

class CataloguePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of categories with products
    List<Map<String, dynamic>> categories = [
      {
        'name': 'Electronics',
        'image': 'https://tinyurl.com/5d5bwe8a',
        'products': [
          {
            'name': 'Laptop',
            'price': '\$1000',
            'stock': 'In Stock',
            'description': 'High performance laptop',
            'image':
                'https://cdn.pixabay.com/photo/2017/11/27/21/31/computer-2982270_640.jpg'
          },
          {
            'name': 'Smartphone',
            'price': '\$850',
            'stock': 'In Stock',
            'description': 'Latest model smartphone',
            'image':
                'https://cdn.pixabay.com/photo/2017/04/03/15/52/mobile-phone-2198770_640.png'
          },
          {
            'name': 'Headphones',
            'price': '\$250',
            'stock': 'In Stock',
            'description': 'Noise-cancelling headphones',
            'image':
                'https://cdn.pixabay.com/photo/2018/09/17/14/27/headphones-3683983_640.jpg'
          },
          {
            'name': 'Camera',
            'price': '\$750',
            'stock': 'In Stock',
            'description': 'High resolution camera',
            'image':
                'https://cdn.pixabay.com/photo/2023/11/14/15/46/nikon-8388022_640.jpg'
          },
          {
            'name': 'SmartWatch',
            'price': '\$150',
            'stock': 'In Stock',
            'description': 'Huawei smartwatch',
            'image':
                'https://cdn.pixabay.com/photo/2018/10/02/11/44/huawei-3718609_640.jpg'
          },
        ],
      },
      {
        'name': 'Clothing',
        'image':
            'https://cdn.pixabay.com/photo/2019/03/01/02/48/store-4027251_640.jpg',
        'products': [
          {
            'name': 'T-shirt',
            'price': '\$200',
            'stock': 'Out of Stock',
            'description': 'Comfortable cotton t-shirt',
            'image':
                'https://cdn.pixabay.com/photo/2019/07/27/21/42/t-shirt-4367577_640.jpg'
          },
          {
            'name': 'Jeans',
            'price': '\$250',
            'stock': 'In Stock',
            'description': 'Stylish blue jeans',
            'image':
                'https://cdn.pixabay.com/photo/2014/08/26/21/49/jeans-428614_1280.jpg'
          },
          {
            'name': 'Jackets',
            'price': '\$350',
            'stock': 'In Stock',
            'description': 'Warm leather jacket',
            'image':
                'https://cdn.pixabay.com/photo/2015/07/12/19/23/clothing-842338_640.jpg'
          },
          {
            'name': 'Scarfs',
            'price': '\$150',
            'stock': 'In Stock',
            'description': 'Beautiful scarfs',
            'image':
                'https://cdn.pixabay.com/photo/2017/08/20/14/02/colorful-scarves-2661828_640.jpg'
          },
          {
            'name': 'Hats',
            'price': '\$250',
            'stock': 'In Stock',
            'description': 'Quality cowboy hats',
            'image':
                'https://cdn.pixabay.com/photo/2016/09/16/18/02/for-sale-1674726_640.jpg'
          },
        ],
      },
      {
        'name': 'Home & Kitchen',
        'image':
            'https://cdn.pixabay.com/photo/2019/09/18/17/19/village-shop-4487285_640.jpg',
        'products': [
          {
            'name': 'Blender',
            'price': '\$300',
            'stock': 'In Stock',
            'description': 'High-speed blender',
            'image':
                'https://cdn.pixabay.com/photo/2011/12/05/14/30/blender-10932_640.jpg'
          },
          {
            'name': 'Microwave',
            'price': '\$300',
            'stock': 'In Stock',
            'description': 'Compact microwave oven',
            'image':
                'https://cdn.pixabay.com/photo/2020/05/08/09/23/appliance-5144884_640.jpg'
          },
          {
            'name': 'Coffee maker',
            'price': '\$400',
            'stock': 'In Stock',
            'description': 'Coffee maker',
            'image':
                'https://cdn.pixabay.com/photo/2017/04/11/02/00/kettle-2220369_640.jpg'
          },
          {
            'name': 'Utensils',
            'price': '\$100',
            'stock': 'In Stock',
            'description': 'Quality wooden utensils',
            'image':
                'https://cdn.pixabay.com/photo/2021/11/26/19/25/wooden-kitchen-utensils-6826540_640.jpg'
          },
          {
            'name': 'Vacuum cleaner',
            'price': '\$500',
            'stock': 'In Stock',
            'description': 'Powerful vacuum cleaner',
            'image':
                'https://cdn.pixabay.com/photo/2015/03/03/18/39/vacuum-cleaner-657719_640.jpg'
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
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
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPage(
                    category: categories[index]['name'],
                    products: categories[index]['products'],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    categories[index]['image']!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      categories[index]['name'],
                      style: TextStyle(
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
}
