import 'package:flutter/material.dart';
import 'package:password_manager_pro_max/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const  Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
      backgroundColor: Colors.orange, // يمكنك تغيير اللون حسب التصميم
      body: Center(
        child: Text(
          'مدير كلمات المرور',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
    ),
    );
  }
}

