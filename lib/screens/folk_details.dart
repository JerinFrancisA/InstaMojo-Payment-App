import 'package:flutter/material.dart';
import 'package:folk_payments/screens/instamojo.dart';
import 'package:folk_payments/screens/products.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';
import 'package:folk_payments/custom_widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ph {
  String phno;
}

ph myph = new ph();

class Details extends StatefulWidget {
  Details({@required this.index});

  final index;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var name = InputBox(text: 'Name');
  var phone = InputBox(text: 'Phone');
  var discount = InputBox(text: 'Discount Code');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'USER INFO',
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            name,
            phone,
            discount,
            Button(
              text: 'SUBMIT AND PAY',
              onPressed: () async {
                if (discount.input == null|| discount.input =='' ) {
                  print('should work , ${widget.index}, ${name.input} ${phone.input}');
                  myph.phno = phone.input;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstaMojo(
                        index: widget.index,
                        name: name.input,
                        phone: phone.input,
                      ),
                    ),
                  );
                } else {
                  print('inside');
                  Firestore.instance
                      .collection('coupons')
                      .document(discount.input)
                      .get()
                      .then((DocumentSnapshot ds) {
                    if (ds.exists) {
                      print(ds.data['discount']);
                      categoryItem[widget.index]['item_price'] =
                          (int.parse(categoryItem[widget.index]['item_price']) -
                                  ds.data['discount'])
                              .toString();
                      print(categoryItem[widget.index]['item_price']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstaMojo(
                            index: widget.index,
                            name: name.input,
                            phone: phone.input,
                          ),
                        ),
                      );
                    } else {
                      print('in');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Invalid Coupon Code'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('DISMISS'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );

//                      print('doesnt exist');
//                      print(show);
//                      show = true;
//                      if (show) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => InstaMojo(
//                              index: widget.index,
//                              name: name.input,
//                              email: email.input,
//                              phone: phone.input,
//                            ),
//                          ),
//                        ); // use ds as a snapshot
//                      }
                    }
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
