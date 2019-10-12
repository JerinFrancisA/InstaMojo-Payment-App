import 'package:flutter/material.dart';
import 'package:folk_payments/utilities/constants.dart';

class Category extends StatelessWidget {
  Category({@required this.catName, @required this.onTap});

  final catName;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(
        child: Text(
          catName,
          style: kInputBoxInputTextStyle,
        ),
        onTap: onTap,
      ),
    );
  }
}
