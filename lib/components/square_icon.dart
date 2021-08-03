import 'package:flutter/material.dart';

class SquareIcon extends StatelessWidget {
  const SquareIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.transparent,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.black,
        ),
        child: Center(
          child: Icon(
            Icons.house_outlined,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
