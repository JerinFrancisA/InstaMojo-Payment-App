import 'package:flutter/material.dart';
import 'package:folk_payments/screens/instamojo.dart';
import 'package:folk_payments/screens/products.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';
import 'package:folk_payments/custom_widgets/button.dart';

class Details extends StatefulWidget {
  Details({@required this.index});

  final index;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var name = InputBox(text: 'name');
  var email = InputBox(text: 'email');
  var phone = InputBox(text: 'phone');

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
            name,
            email,
            phone,
            Button(
              text: 'SUBMIT AND PAY',
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstaMojo(
                      index: widget.index,
                      name: name.input,
                      email: email.input,
                      phone: phone.input,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
