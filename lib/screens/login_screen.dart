import 'package:flutter/material.dart';
import 'package:folk_payments/custom_widgets/input_box.dart';
import 'package:folk_payments/screens/categories.dart';
import 'package:folk_payments/custom_widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  static const routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

var un = InputBox(text: 'Folk ID');

class _LoginScreenState extends State<LoginScreen> {
  var pw = InputBox(text: 'Folk Password');
  final auth = FirebaseAuth.instance;
  AuthResult user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  un,
                  pw,
                  Button(
                    text: 'LOGIN',
                    onPressed: () async {
                      try {
                        user = await auth.signInWithEmailAndPassword(
                            email: un.input, password: pw.input);
                        if (user != null) {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, Categories.routeName);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
