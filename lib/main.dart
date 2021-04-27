import 'package:flutter/material.dart';
import 'package:loginfirebase/first_screen.dart';
import 'package:loginfirebase/register.dart';
import 'package:loginfirebase/sign_in_email.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/register': (context) => RegisterEmailSection(),
        '/signin': (context) => EmailPasswordForm(),
        '/firstScreen': (context) => FirstScreen(),
      },
    );
  }
}
