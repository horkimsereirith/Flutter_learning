import 'package:flutter/material.dart';
import 'screens/Login/login.dart';
import 'screens/dashboard/index.dart';

void main() {
  runApp(const MyApp());
}

// same as above
// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue), home: const LoginScreen());
    // home: const DashboardScreen());
  }
}
