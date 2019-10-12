import 'package:flutter/material.dart';
import 'package:folk_payments/screens/products.dart';
import 'package:folk_payments/custom_widgets/category.dart';
import 'package:folk_payments/utilities/constants.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';

class Categories extends StatefulWidget {
  static const routeName = 'Categories';

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('FOLK PAYMENT'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        'Categories',
                        style: kInputBoxInputTextStyle.copyWith(
                          fontSize: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Category(
                catName: 'Category1',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products(cat: 1))),
              ),
              Category(
                catName: 'Category2',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products(cat: 2))),
              ),
              Category(
                catName: 'Category3',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products(cat: 3))),
              ),
              Category(
                catName: 'Category4',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products(cat: 4))),
              ),
              Category(
                catName: 'Category5',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Products(cat: 5))),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            'SELECT CATEGORY',
            style: kInputBoxInputTextStyle,
          ),
        ),
      ),
    );
  }
}
