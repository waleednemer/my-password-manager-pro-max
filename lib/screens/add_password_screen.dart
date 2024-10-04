import 'package:flutter/material.dart';
import 'package:password_manager_pro_max/helpers/storage_helper.dart';
import 'package:password_manager_pro_max/models/password.dart';

class AddPasswordScreen extends StatelessWidget {
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('إضافة', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _websiteController,
              decoration: const InputDecoration(labelText: 'اسم الموقع'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'اسم المستخدم'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                final entry = PasswordEntry(
                  website: _websiteController.text,
                  username: _usernameController.text,
                  password: _passwordController.text,
                  notes: _notesController.text,
                );
                DatabaseHelper().insertPassword(entry).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('حفظ', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
