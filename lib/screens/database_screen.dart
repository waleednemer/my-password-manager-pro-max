import 'package:flutter/material.dart';

class MyDatabaseScreen extends StatefulWidget {
  const MyDatabaseScreen({Key? key}) : super(key: key);

  @override
  State<MyDatabaseScreen> createState() => _MyDatabaseScreenState();
}

class _MyDatabaseScreenState extends State<MyDatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
      ),
    );
  }
}
