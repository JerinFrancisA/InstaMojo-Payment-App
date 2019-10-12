import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:folk_payments/screens/products.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
bool closeable = false;

class InstaMojo extends StatefulWidget {
  static const routeName = 'InstaMojo';
  InstaMojo({@required this.index});
  final index;

  @override
  _InstaMojoState createState() => _InstaMojoState();
}

class _InstaMojoState extends State<InstaMojo> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  static const kAndroidUserAgent =
      "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36";

  Future createRequest() async {
    Map<String, String> body = {
      "amount": categoryItem[widget.index]['item_price'], //amount to be paid
      "purpose": "Advertising",
      "buyer_name": 'jerin',
      "email": 'jerinfrancis77@gmail.com',
      "phone": '7975235842',
      "allow_repeated_payments": "true",
      "send_email": "false",
      "send_sms": "false",
      "redirect_url": "http://www.example.com/redirect/",
      //Where to redirect after a successful payment.
      "webhook": "http://www.example.com/webhook/",
    };
//First we have to create a Payment_Request.
//then we'll take the response of our request.
    var resp = await http.post(
        Uri.encodeFull("https://test.instamojo.com/api/1.1/payment-requests/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_d55f74e68ff03b26c33dc1386bc",
          "X-Auth-Token": "test_d06b0e24d9e95fb372551c568ee",
        },
        body: body);
    if (json.decode(resp.body)['success'] == true) {
//If request is successful take the longurl.
      String selectedUrl =
          json.decode(resp.body)["payment_request"]['longurl'].toString() +
              "?embed=form";
      flutterWebviewPlugin.close();
//Let's open the url in webview.
      flutterWebviewPlugin.launch(selectedUrl,
          rect: new Rect.fromLTRB(
              5.0,
              MediaQuery.of(context).size.height / 7,
              MediaQuery.of(context).size.width - 5.0,
              7 * MediaQuery.of(context).size.height / 7),
          userAgent: kAndroidUserAgent);
    } else {
      print(resp.body);
    }
  }

  @override
  void initState() {
    super.initState();
    createRequest(); //creating the HTTP request
// Add a listener on url changed
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        if (url.contains('http://www.example.com/redirect')) {
          Uri uri = Uri.parse(url);
//Take the payment_id parameter of the url.
          String paymentRequestId = uri.queryParameters['payment_id'];
//calling this method to check payment status
          _checkPaymentStatus(paymentRequestId);
        }
      }
    });
  }

  _checkPaymentStatus(String id) async {
    var response = await http.get(
      Uri.encodeFull("https://t7st.instamojo.com/api/1.1/payments/$id/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Api-Key": "test_d55f74e68ff03b26c33dc1386bc",
        "X-Auth-Token": "test_d06b0e24d9e95fb372551c568ee",
      },
    );
    var realResponse = json.decode(response.body);
    print(realResponse);
    if (realResponse['success'] == true) {
      if (realResponse["payment"]['status'] == 'Credit') {
//payment is successful.
      } else {
//payment failed or pending.
      }
    } else {
      print(realResponse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text('FOLK PAYMENTS'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.backspace),
            onPressed: ()=>{
            flutterWebviewPlugin.close()
            },
          )

        ],
        ),
      ),

    );
  }
}
