import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart';
import 'package:permission_handler/permission_handler.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  String statusMessage = '';

  @override
  void initState() {
    super.initState();
    requestPermission();
  }


  Future<void> requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();    }  }


  Future<void> backupDatabase() async {
    // الحصول على مسار قاعدة البيانات
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDocDir.path, 'password_manager.db');

    // مسار النسخة الاحتياطية
    String backupPath = join(appDocDir.path, 'backup.db');

    // قراءة قاعدة البيانات
    File originalDbFile = File(dbPath);
    if (await originalDbFile.exists()) {
      // إنشاء نسخة احتياطية
      await originalDbFile.copy(backupPath);
      setState(() {
        statusMessage = 'Backup created at: $backupPath';
      });
    } else {
      setState(() {
        statusMessage = 'Database file does not exist.';
      });
    }
  }


  String encryptData(String plainText, String key) {
    final keyBytes = Key.fromUtf8(key.padRight(32, '0'));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(keyBytes));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup Database'), ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: backupDatabase,
              child: const Text('Create Backup'),  ),
            const SizedBox(height: 20),
            Text(statusMessage),
          ],
        ),
      ),
    );
  }
 }

