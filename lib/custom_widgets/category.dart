import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({@required this.catName});
  final catName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(catName),
    );
  }
}