import 'package:flutter/material.dart';
import 'package:minima/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: 'Goblin glow',
      price: 36.98,
      description: 'sports wear, low friction',
      imagePath: 'assets/green.jpg',
    ),
    //product 1
    Product(
      name: 'Neon',
      price: 399.94,
      description: 'high quality water resistant',
      imagePath: 'assets/neon.jpg',
    ),
    //product 1
    Product(
      name: 'Nike',
      price: 700.40,
      description: 'get a random nike shoe after a spin',
      imagePath: 'assets/nike.png',
    ),
    //product 1
    Product(
      name: 'Obsidian glare',
      price: 129.5,
      description: 'Elite wear for summer and autumn',
      imagePath: 'assets/one_black.jpg',
    ),
    //product 1
    Product(
      name: 'La fleeze',
      price: 909.9,
      description: 'gym foot wear, light weight and comes in 3 colors',
      imagePath: 'assets/orange.jpg',
    ),
    //product 1
    Product(
      name: 'panther 3',
      price: 400.97,
      description: 'casual footwears for work',
      imagePath: 'assets/pinky.png',
    ),
    //product 1
    Product(
      name: 'bleach',
      price: 535.29,
      description:
          'clean soft stain resistant sport and outdoor footwear in 3 colors',
      imagePath: 'assets/white.jpg',
    ),
  ];

  //user cart
  List<Product> _cart = [];

  //get prduct List
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to user cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //delete item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
