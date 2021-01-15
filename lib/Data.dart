import 'dart:convert';

import 'models/product.dart';
import 'package:http/http.dart' as http;

class Data {
  static List<Product> products = [];
  static Future<void> getData() async {
    print("im here");
    print("hello");
    final response = await http.get("http://192.168.1.15:8000/json_list");

    if (response.statusCode == 200) {
      print("Succes in fetching data");
      products = [];
      List<dynamic> jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);
      jsonResponse.forEach((element) {
        print("Working on : " + element["fields"]["name"]);
        products.add(new Product(
            element["pk"],
            element["fields"]["name"],
            double.parse(element["fields"]["price"]),
            element["fields"]["description"],
            element["fields"]["image"],
            element["fields"]["available"],
            element["fields"]["category"]));
      });
      print("Added Item to Products, now products is " +
          products.length.toString() +
          " Long");
    } else {
      print("Failed To Load Data");
    }
  }
}
