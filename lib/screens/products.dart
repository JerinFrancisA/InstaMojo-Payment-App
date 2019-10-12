import 'package:flutter/material.dart';
import 'package:folk_payments/screens/instamojo.dart';
import 'package:folk_payments/utilities/constants.dart';

class Products extends StatelessWidget {
  static const routeName = 'Products';
  const Products({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(
            30,
            (i) {
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
            },
          ),
        ),
      ),
    );
  }
}
