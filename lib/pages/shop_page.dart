import 'package:flutter/material.dart';
import 'package:minima/components/my_list_tile.dart';
import 'package:minima/components/my_product_tile.dart';
import 'package:minima/models/product.dart';
import 'package:minima/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(child: const Text('Shop Page')),
        actions: [
          //go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          //shop title
          Center(
            child: Text(
              'Teejays Shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),

          SizedBox(height: 15),

          //shop subtitle
          Center(
            child: Text(
              'Select from our list of products',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                //get products in shop
                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //drawer header logo
                DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),

                //logo
                SizedBox(height: 25),

                //shop title
                MyListTile(
                  icon: Icons.home,
                  text: 'Shop',
                  onTap: () => Navigator.pop(context),
                ),
                //cart title
                MyListTile(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  },
                ),
              ],
            ),

            //exit button tile
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                icon: Icons.logout,
                text: 'Exit',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intro_page',
                  (route) => false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
