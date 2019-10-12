import 'package:flutter/material.dart';
import 'package:folk_payments/screens/login_screen.dart';
import 'package:folk_payments/screens/categories.dart';
import 'package:folk_payments/screens/instamojo.dart';
import 'package:folk_payments/screens/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Folk Payments',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        Categories.routeName: (context) => Categories(),
        InstaMojo.routeName: (context) => InstaMojo(),
        Products.routeName: (context) => Products(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
