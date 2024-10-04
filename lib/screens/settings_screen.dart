import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('الإعدادات', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingItem(Icons.account_circle, 'قاعدة البيانات'),
          _buildSettingItem(Icons.notifications, 'الإستيراد والتصدير'),
          _buildSettingItem(Icons.security, 'الأمان'),


          _buildSettingItem(Icons.language, 'اللغة'),
          _buildSettingItem(Icons.info, 'معلومات عن التطبيق'),
        ],
      ),
    ),
    );
  }

  Widget _buildSettingItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 30.0, color: Colors.orange),
          const SizedBox(width: 16.0), // مساحة بين الأيقونة والنص
          Text(
            text,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
