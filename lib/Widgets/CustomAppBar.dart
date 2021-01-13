import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.height * 0.07,
            color: Colors.blue,
            child: Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
