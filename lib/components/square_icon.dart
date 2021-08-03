import 'package:flutter/material.dart';

class SquareIcon extends StatelessWidget {
  const SquareIcon({Key? key, this.iconData, this.outline}) : super(key: key);

  final IconData? iconData;
  final Color? outline;

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
            iconData,
            color: outline,
          ),
        ),
      ),
    );
  }
}
