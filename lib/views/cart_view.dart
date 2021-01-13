import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pharmalitech/Data.dart';
import 'package:pharmalitech/Widgets/CartItemCard.dart';
import 'package:pharmalitech/Widgets/ProductCard.dart';
import 'package:pharmalitech/models/cart.dart';
import 'package:intl/intl.dart';

class CartView extends StatefulWidget {
  CartView({Key key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Votre Panier"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue[200],
              ),
              title: Text(
                "Acceuil",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.blue[200],
              ),
              title: Text(
                "Votre Panier",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/cart");
              },
            )
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "")
        ],
      ),*/
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.blue,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Votre Panier",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                width: MediaQuery.of(context).size.width,
                child: Cart.items.length != 0
                    ? ListView.builder(
                        itemCount: Cart.items.length,
                        itemBuilder: (context, index) {
                          return /*CartItemCard(
                        item: Cart.items[index],
                      );*/
                              Container(
                            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            height: 110.0,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Image(
                                      image: AssetImage("assets/" +
                                          Cart.items[index].item.img_url),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              Cart.items[index].item.name,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              /*Cart.items[index].item.price
                                                      .toString() +
                                                  "\$",*/
                                              new NumberFormat(
                                                          "##0.00", "en_US")
                                                      .format(Cart.items[index]
                                                          .item.price)
                                                      .toString() +
                                                  " €",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Cart.items[index].addQuantity();
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.blue,
                                          size: 25.0,
                                        ),
                                      ),
                                      Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                        child: Center(
                                          child: Text(
                                            Cart.items[index].quantity
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Cart.items[index].removeQuantity();
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.blue,
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: AutoSizeText(
                          "Vous N'avez Pas De Produits Dans Votre Panier",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 0, 0, 0.3)),
                        ),
                      ),
              ),
            ]),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 20.0,
                  offset: Offset(0, 1),
                ),
              ], color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  AutoSizeText(
                    /*"Total : " + Cart.getPrice().toString() + "€",*/
                    "Total : " +
                        new NumberFormat("##0.00", "en_US")
                            .format(Cart.getPrice())
                            .toString() +
                        "€",
                    maxFontSize: 20.0,
                    minFontSize: 5.0,
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(45.0)),
                    child: Center(
                      child: AutoSizeText(
                        "Commandez",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
