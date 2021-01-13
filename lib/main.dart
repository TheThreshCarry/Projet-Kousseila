import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pharmalitech/Data.dart';
import 'package:pharmalitech/Widgets/ProductCard.dart';
import 'package:pharmalitech/Widgets/ProductCardDesktop.dart';
import 'package:pharmalitech/views/cart_view.dart';
import 'package:sqflite/sqflite.dart';
import 'Widgets/CustomAppBar.dart';
import 'Database/Database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Anton'),
      home: HomePage(),
      theme: ThemeData(fontFamily: "FjallaOne"),
      routes: {
        "/cart": (context) => CartView(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Future<void> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Data.getData().then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Pharmalitech"),
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
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Liste De Produits",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  //color: Colors.red,
                  child: FutureBuilder<void>(
                      future: data,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.count(
                            childAspectRatio: (0.2 / 0.27),
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 1221
                                    ? 4
                                    : 2,
                            children:
                                List.generate(Data.products.length, (index) {
                              print("Generating Item");
                              return MediaQuery.of(context).size.width > 1221
                                  ? ProductCardDesktop(
                                      product: Data.products[index])
                                  : ProductCard(product: Data.products[index]);
                            }),
                          );
                        } else {
                          print("Waiting For Data");
                          return Center(child: Text("Waiting For Data"));
                        }
                      }),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
