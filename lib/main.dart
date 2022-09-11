import 'package:flutter/material.dart';
import 'home/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Fibonacci Matrix, Focus',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.blue),
      initialRoute: '/home',
      routes: {'/home': (context) => Home()},
    );
  }
}
