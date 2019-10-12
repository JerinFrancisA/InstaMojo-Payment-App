import 'package:flutter/material.dart';
import 'package:folk_payments/custom_widgets/category.dart';
import 'package:folk_payments/utilities/constants.dart';
import 'package:folk_payments/screens/instamojo.dart';

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
                onTap: () {},
              ),
              Category(
                catName: 'Category2',
                onTap: () {},
              ),
              Category(
                catName: 'Category3',
                onTap: () {},
              ),
              Category(
                catName: 'Category4',
                onTap: () {},
              ),
              Category(
                catName: 'Category5',
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: List.generate(30, (i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, InstaMojo.routeName);
                  },
                  child: GridTile(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.network(
                                'https://www.javatpoint.com/fullformpages/images/iskcon.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'iskcon product',
                            style: kInputBoxInputTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
