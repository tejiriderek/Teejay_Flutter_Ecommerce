import 'package:flutter/material.dart';
import 'package:minima/components/my_button.dart';
import 'package:minima/models/product.dart';
import 'package:minima/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Top Up Wallet , Connect to Gateway"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    //remove item from cart method
    void removeItemFromCart(BuildContext context, Product product) {
      //show confirmation dialog box
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Remove this Item to your Cart?'),
          actions: [
            //cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),

            //yes button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeItemFromCart(product);
              },
              child: Text('Yes'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: Center(child: const Text('Cart Page')),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Your Cart Is Empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual ietm in cart
                      final item = cart[index];

                      //return as cart tile UI
                      return ListTile(
                        title: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                item.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.favorite),
                            //width sized box
                            SizedBox(width: 25),
                            Column(
                              children: [
                                Text(item.name),
                                Text(item.price.toStringAsFixed(2)),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(item.description),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
