// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:password_manager_pro_max/helpers/storage_helper.dart';
import 'package:password_manager_pro_max/models/password.dart';
import 'package:share/share.dart';



class EditPasswordScreen extends StatefulWidget {
  final PasswordEntry entry;

  const EditPasswordScreen({super.key, required this.entry});

  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _obscurePassword = true; // حالة إظهار أو إخفاء كلمة المرور

  @override
  void initState() {
    super.initState();
    _websiteController.text = widget.entry.website;
    _usernameController.text = widget.entry.username;
    _passwordController.text = widget.entry.password;
    _notesController.text = widget.entry.notes;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
    child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('تحديث', style: TextStyle(color: Colors.white),),
      actions: [
        PopupMenuButton<String>(
          color: Colors.white,
          onSelected: (value) {
            // تعامل مع الاختيار هنا
            switch (value) {
              case 'حذف':
                // ignore: avoid_print
                print('حذف');
                break;
              case 'عمل نسخة':
                print('عمل نسخة');
                //SystemNavigator.pop();
                break;
              case 'شارك':
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return {
              'حذف',
              'عمل نسخة',
              'شارك',
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),

              );
            }).toList();
          },
        ),
      ],
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
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // تغيير حالة الإظهار
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)'),
            ),
            const SizedBox(height: 40, width: 50),
            Row(
              children:[
            ElevatedButton(
            style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            ),
        onPressed: () {
          final updatedEntry = PasswordEntry(
            id: widget.entry.id,
            website: _websiteController.text,
            username: _usernameController.text,
            password: _passwordController.text,
            notes: _notesController.text,
          );
          DatabaseHelper().updatePassword(
              updatedEntry).then((_) {
            Navigator.pop(context, true);
          });
        },
        child: const Text('تحديث', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
      ),
      const SizedBox(width: 123),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          //primary: Colors.blue,
        ),
        onPressed: () {
          final String textToShare = '''
                ${_websiteController.text}
                ${_usernameController.text}
                ${_passwordController.text}
                ${_notesController.text}''';
          Share.share(textToShare);
        },
        //child: const Text('مشاركة', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
        child: Icon(Icons.share,color: Colors.indigo,),
      ),
      ],
    ),
              ],
        ),
      ),
    ),
    );
  }
}
