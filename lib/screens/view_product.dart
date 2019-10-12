import 'package:flutter/material.dart';
import 'package:folk_payments/screens/products.dart';
import 'package:folk_payments/utilities/constants.dart';
import 'package:folk_payments/screens/instamojo.dart';

class View extends StatefulWidget {
  View({@required this.index});

  final index;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'VIEW PRUDUCT',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    categoryItem[widget.index]['item_url'],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                categoryItem[widget.index]['item_name'],
                style: kInputBoxInputTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                  fontSize: 22.0,
                ),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    '₹${categoryItem[widget.index]['item_price'] == '0' ? '108' : categoryItem[widget.index]['item_price']}',
                    style: kInputBoxInputTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstaMojo(
                      index: widget.index,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'BUY ITEM',
                      style: kInputBoxInputTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 5.0,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
