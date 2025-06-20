import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {

  final Color theColor;
  final Widget theChild;
  final VoidCallback? theOnTapFunc;
  final double theWidth;
  final double theHeight;
  final bool hasBorder;

  const BaseCard({
    super.key,
    required this.theColor,
    required this.theChild,
    required this.hasBorder,
    required this.theWidth,
    required this.theHeight,
    this.theOnTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      width: theWidth,
      height: theHeight,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theColor,
        borderRadius: BorderRadius.circular(25),
        border: hasBorder ? Border.all(color: Colors.black, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(00, 06), // set shadow on (horizontal, vertical)
            blurRadius: 8,
          ),
        ], // need to use [] to make it a list
      ),
      child: theChild,
    );

    if (theOnTapFunc != Null) { // it the OnTapFunc is specified, then use GestureDetector to wrap it
      return GestureDetector(
        onTap: theOnTapFunc,
        child: card,
      );
    }

    return card;
  }
}