import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmalitech/models/cart_item.dart';

class CartItemCard extends StatefulWidget {
  final CartItem item;
  CartItemCard({Key key, @required this.item}) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    CartItem item = widget.item;
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      height: 110.0,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              child: Image(
                image: AssetImage("assets/" + item.item.img_url),
                height: MediaQuery.of(context).size.height * 0.17,
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
                        item.item.name,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        item.item.price.toString() + "\$",
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      item.addQuantity();
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
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      item.quantity.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      item.removeQuantity();
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
  }
}
