import 'package:flutter/material.dart';

class MyCircularIcon extends StatelessWidget {

  final double size;
  
  final Widget child;

  const MyCircularIcon({
    Key? key, required this.child, this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.2),
            offset: const Offset(0,2),
            blurRadius: 2
          )
        ],
        shape: BoxShape.circle
      ),
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Center(child: child)
      )
    );
  }
}