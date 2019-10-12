import 'package:flutter/material.dart';
import 'package:folk_payments/custom_widgets/category.dart';

class Categories extends StatefulWidget {
  static const routeName = 'Categories';

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Category(
                catName: 'Category1',
              ),
              Category(
                catName: 'Category2',
              ),
              Category(
                catName: 'Category3',
              ),
              Category(
                catName: 'Category4',
              ),
              Category(
                catName: 'Category5',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
