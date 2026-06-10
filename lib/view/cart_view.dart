import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/cart_provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.r),
        height: 70.h,
        child: Text(
          "Total : Rs. ${cartProvider.totalPrice}",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      appBar: AppBar(title: const Text("Cart")),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text("Cart is Empty"))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];

                return Card(
                  margin: EdgeInsets.all(10.r),
                  child: ListTile(
                    title: Text(cartItem.product.name),
                    subtitle: Text("Qty : ${cartItem.quantity}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cartProvider.removeFromCart(cartItem.product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
