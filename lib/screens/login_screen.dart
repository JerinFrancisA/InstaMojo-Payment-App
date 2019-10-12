import 'package:flutter/material.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';
import 'package:folk_payments/custom_widgets/';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  static const routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var un = InputBox(text: 'Folk ID');
  var pw = InputBox(text: 'Folk Password');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            un,
            pw,
            Bu
          ],
        ),
      ),
    );
  }
}
