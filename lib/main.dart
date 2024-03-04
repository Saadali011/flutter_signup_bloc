import 'package:bloctest/screens/splash_screen.dart';
import 'package:bloctest/welcome/home_Screen.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Welcome",
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   );
  }
}