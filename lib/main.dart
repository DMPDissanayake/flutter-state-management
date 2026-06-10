import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bloc/app.dart';
import 'package:test_bloc/providers/cart_provider.dart';
import 'package:test_bloc/providers/product_peovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
