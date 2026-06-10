import '../data/cart_item.dart';
import '../data/product.dart';

class CartRepository {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    int index = _cartItems.indexWhere(
      (item) => item.product.productID == product.productID,
    );

    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere(
      (item) => item.product.productID == product.productID,
    );
  }
}
