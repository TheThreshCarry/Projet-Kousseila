import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmalitech/models/cart.dart';
import 'package:pharmalitech/models/cart_item.dart';
import 'package:pharmalitech/models/product.dart';
import 'package:pharmalitech/views/product_view.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductView(
                      product: product,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(-1, 1),
                      color: Color.fromRGBO(56, 110, 152, 0.37))
                ]),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Image(
                      image: AssetImage("assets/" + product.img_url),
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      product.name,
                      maxLines: 1,
                      minFontSize: 5,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 25.0,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          product.description,
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blue[100]),
                          minFontSize: 10.0,
                          overflow: TextOverflow.fade,
                        )),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        //(product.price.toString() + " €"),
                        new NumberFormat("##0.00", "en_US")
                                .format(product.price)
                                .toString() +
                            " €",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Cart.addItem(new CartItem(product, 1));
                          /*Scaffold.of(context).showSnackBar(SnackBar(
                              content: Center(
                                  child: Text("Produit Ajoutez Au Panier !"))));*/
                        },
                        child: Container(
                          height: 20.0,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Center(
                              child: Text(
                            "Ajoutez Au Panier",
                            style: TextStyle(
                                fontSize: 7.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
