import 'package:flutter/material.dart';
import 'package:folk_payments/screens/instamojo.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';
import 'package:folk_payments/custom_widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  Details({@required this.index});

  final index;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var name = InputBox(text: 'Name');
  var email = InputBox(text: 'Email');
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
            email,
            phone,
            discount,
            Button(
              text: 'SUBMIT AND PAY',
              onPressed: () async {
                if (discount.input != null) {
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
                }
                else {
                  print("JmERIN");
                  List docs;
                  QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
                  docs = querySnapshot.documents;
                  print(docs[0]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
