import 'package:flutter/material.dart';
import 'package:oxyid/extensions/extension.dart';

class GridItem extends StatelessWidget {
  final String imagesrc;
  final String text;
  final void Function()? onTap;

  const GridItem({
    super.key,
    required this.imagesrc,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 20),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: getRandomColor(),
              borderRadius: BorderRadius.circular(90),
            ),
            child: Image.asset(
              imagesrc,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
