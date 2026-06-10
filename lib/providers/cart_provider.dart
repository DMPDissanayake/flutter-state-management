import 'package:flutter/material.dart';

import '../data/cart_item.dart';
import '../data/product.dart';
import '../repository/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository _repository = CartRepository();

  List<CartItem> get cartItems => _repository.cartItems;

  void addToCart(Product product) {
    _repository.addToCart(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _repository.removeFromCart(product);
    notifyListeners();
  }

  int get totalItems {
    return cartItems.length;
  }

  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }

    return total;
  }
}
