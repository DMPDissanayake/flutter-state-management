import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/providers/product_peovider.dart';

import '../providers/cart_provider.dart';
import 'cart_view.dart';

class AllProductView extends StatefulWidget {
  const AllProductView({super.key});

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartView()),
              );
            },
            icon: Badge(
              label: Text(cartProvider.totalItems.toString()),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];

                return Card(
                  margin: EdgeInsets.all(10.r),
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("Rs. ${product.price}"),
                    trailing: ElevatedButton(
                      onPressed: () {
                        cartProvider.addToCart(product);
                      },
                      child: const Text("Add"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
