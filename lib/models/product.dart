import 'dart:ffi';

class Product {
  final int id;
  final double price;
  final String name;
  final String description;
  final String img_url;
  final bool available;
  final int category_id;

  Product(this.id, this.name, this.price, this.description, this.img_url,
      this.available, this.category_id);
}
