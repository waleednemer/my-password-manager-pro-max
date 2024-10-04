import 'package:flutter/material.dart';
import 'package:password_manager_pro_max/screens/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const isDarkMode = false;

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مدير كلمات المرور',
      theme: isDarkMode ? ThemeData.dark(): ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}
