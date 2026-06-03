import 'package:test_bloc/data/product.dart';

class ProductRepository {
  final List<Product> productList = [
    Product(
      productID: 1,
      name: 'iPhone 15',
      description: 'Apple Smart Phone',
      price: 350000,
    ),
    Product(
      productID: 2,
      name: 'Samsung Galaxy S24',
      description: 'Samsung Flagship Phone',
      price: 300000,
    ),
    Product(
      productID: 3,
      name: 'Google Pixel 9',
      description: 'Google Android Phone',
      price: 280000,
    ),
    Product(
      productID: 4,
      name: 'OnePlus 12',
      description: 'Premium Android Smartphone',
      price: 250000,
    ),
    Product(
      productID: 5,
      name: 'Xiaomi 14',
      description: 'High Performance Smartphone',
      price: 220000,
    ),
    Product(
      productID: 6,
      name: 'MacBook Air M3',
      description: 'Apple Laptop',
      price: 550000,
    ),
    Product(
      productID: 7,
      name: 'Dell XPS 13',
      description: 'Premium Windows Laptop',
      price: 480000,
    ),
    Product(
      productID: 8,
      name: 'HP Spectre x360',
      description: 'Convertible Laptop',
      price: 450000,
    ),
    Product(
      productID: 9,
      name: 'iPad Pro',
      description: 'Apple Tablet',
      price: 320000,
    ),
    Product(
      productID: 10,
      name: 'Samsung Galaxy Tab S9',
      description: 'Android Tablet',
      price: 270000,
    ),
    Product(
      productID: 11,
      name: 'Apple Watch Series 10',
      description: 'Smart Watch',
      price: 180000,
    ),
    Product(
      productID: 12,
      name: 'Samsung Galaxy Watch 7',
      description: 'Android Smart Watch',
      price: 150000,
    ),
    Product(
      productID: 13,
      name: 'AirPods Pro 2',
      description: 'Wireless Earbuds',
      price: 85000,
    ),
    Product(
      productID: 14,
      name: 'Sony WH-1000XM5',
      description: 'Noise Cancelling Headphones',
      price: 120000,
    ),
    Product(
      productID: 15,
      name: 'JBL Flip 6',
      description: 'Portable Bluetooth Speaker',
      price: 45000,
    ),
    Product(
      productID: 16,
      name: 'Logitech MX Master 3S',
      description: 'Wireless Mouse',
      price: 35000,
    ),
    Product(
      productID: 17,
      name: 'Mechanical Keyboard',
      description: 'RGB Gaming Keyboard',
      price: 25000,
    ),
    Product(
      productID: 18,
      name: 'Samsung 27 Monitor',
      description: '4K UHD Monitor',
      price: 110000,
    ),
    Product(
      productID: 19,
      name: 'PlayStation 5',
      description: 'Gaming Console',
      price: 260000,
    ),
    Product(
      productID: 20,
      name: 'Xbox Series X',
      description: 'Microsoft Gaming Console',
      price: 240000,
    ),
  ];

  List<Product> getAllProducts() {
    return productList;
  }
}
