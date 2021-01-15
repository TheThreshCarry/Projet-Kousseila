import 'package:pharmalitech/models/cart.dart';
import 'package:pharmalitech/models/product.dart';

class CartItem {
  Product item;
  int quantity;
  double get price {
    return item.price * quantity;
  }

  CartItem(Product item, int quantity) {
    this.item = item;
    this.quantity = quantity;
  }
  /*double getPrice() {
    double temp = item.price * quantity;
    return temp;
  }*/

  void addQuantity() {
    this.quantity++;
    print("Added 1 in Quantity");
  }

  void removeQuantity() {
    if (quantity == 1) {
      if (Cart.items.contains(this)) {
        Cart.items.remove(this);
        print("Removed Item Because Quantity is 1, now Cart has : " +
            Cart.items.length.toString() +
            " Items!");
      }
    } else {
      this.quantity--;
      print("Removed 1 in Quantity");
    }
  }
}
