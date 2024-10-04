import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('معلومات عن التطبيق', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        body: const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'اسم التطبيق: تطبيق حفظ كلمات المرور',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'وصف: هذا التطبيق هو تطبيق إدارة كلمات المرور يهدف إلى تحسين تجربة المستخدم وتقديم معلومات مفيدة.',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 20),
              Text(
                'إصدار: 1.0.0',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'معلومات الاتصال:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'البريد الإلكتروني: waleednemer6@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                ' رقم الهاتف: +249916388010',
                style:  TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
