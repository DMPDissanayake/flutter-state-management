import 'package:flutter/material.dart';
import 'package:test_bloc/data/product.dart';
import 'package:test_bloc/repository/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();
  List<Product> _products = [];

  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //Load all products
  void loadProducts() {
    _isLoading = true;
    notifyListeners();
    _products = _repository.productList;
    _isLoading = false;
    notifyListeners();
  }
}
