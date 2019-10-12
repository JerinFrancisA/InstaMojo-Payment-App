import 'package:flutter/material.dart';
import 'package:folk_payments/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folk Payments',
      theme: ThemeData.light(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
