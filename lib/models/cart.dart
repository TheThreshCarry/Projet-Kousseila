import 'package:pharmalitech/models/cart_item.dart';

class Cart {
  static double totalPrice;
  static List<CartItem> items = [];
  static bool containsCheck = false;
  static void addItem(CartItem item) {
    containsCheck = false;
    items.forEach((element) {
      if (element.item.name == item.item.name) {
        print("Found match at :" + items.indexOf(element).toString());
        items[items.indexOf(element)].addQuantity();
        print("Added Quantity");
        containsCheck = true;
      }
    });
    if (!containsCheck) {
      //print("Came here");
      items.add(item);
    }

    /* if (contains(item)) {
      items[getIndex(item)].addQuantity();
      print("Added Quantity Instead");
    } else {
      items.add(item);
      print("Added " + item.item.name + " Succecufully");
    }*/
  }

  static bool contains(CartItem item) {
    int matches = 0;
    items.forEach((element) {
      if (element.item.name == item.item.name) {
        print("Im true");
        matches++;
        return true;
      }
    });
    print("hello" + matches.toString());
    return false;
  }

  /* static int getIndex(CartItem item) {
    items.forEach((element) {
      if (element.item.name == item.item.name) {
        return items.indexOf(element);
      }
    });
  }*/

  static void removeItem(CartItem item) {
    if (items.contains(item)) {
      items.remove(item);
    }
    print("Removed " + item.item.name + " Succecufully");
  }

  static double getPrice() {
    totalPrice = 0;
    items.forEach((element) {
      totalPrice += element.price;
    });
    return totalPrice;
  }
}
