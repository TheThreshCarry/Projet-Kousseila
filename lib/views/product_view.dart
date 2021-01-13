import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmalitech/models/cart.dart';
import 'package:pharmalitech/models/cart_item.dart';
import 'package:pharmalitech/models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductPage(
        product: product,
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Entred " + product.name + " view");
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Image(
                    image: AssetImage("assets/" + product.img_url),
                    fit: MediaQuery.of(context).size.width > 1221
                        ? BoxFit.contain
                        : BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.blue,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: Platform.isWindows
                ? (MediaQuery.of(context).size.height * 0.6)
                : (MediaQuery.of(context).size.height * 0.6) - 24,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
            child: Stack(
              children: [
                Container(
                  height: Platform.isWindows
                      ? (MediaQuery.of(context).size.height * 0.6)
                      : (MediaQuery.of(context).size.height * 0.6) - 24,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Container(
                  height: Platform.isWindows
                      ? (MediaQuery.of(context).size.height * 0.6)
                      : (MediaQuery.of(context).size.height * 0.6) - 24,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      /* borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0)),*/
                      color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            product.name,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Médicaments",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              //(product.price.toString() + " €"),
                              new NumberFormat("##0.00", "en_US")
                                      .format(product.price)
                                      .toString() +
                                  "€",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            /*SizedBox(
                              width: 5.0,
                            ),*/
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Description Du Produit",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            product.description,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            minFontSize: 10.0,
                            maxFontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Cart.addItem(new CartItem(product, 1));
                      /*Scaffold.of(context).showSnackBar(SnackBar(
                          content: Center(
                              child: Text("Produit Ajoutez Au Panier !"))));*/
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                      height: 40.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurRadius: 20.0,
                                offset: Offset(-2, -2))
                          ]),
                      child: Center(
                        child: AutoSizeText(
                          "Ajoutez Au Panier",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
