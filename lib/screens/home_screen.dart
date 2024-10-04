// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:password_manager_pro_max/helpers/storage_helper.dart';
import 'package:password_manager_pro_max/models/password.dart';
import 'package:password_manager_pro_max/screens/add_password_screen.dart';
import 'package:password_manager_pro_max/screens/edit_screen.dart';
import 'package:flutter/services.dart';
import 'package:password_manager_pro_max/screens/info_screen.dart';
import 'package:password_manager_pro_max/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<PasswordEntry> _passwords = [];

  @override
  void initState() {
    super.initState();
    _loadPasswords();
  }


  Future<void> _loadPasswords() async {
    final passwords = await DatabaseHelper().getPasswords();
    setState(() {
      _passwords = passwords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child:  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('الــكل', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  _navigateToPage(context, value);
                },
                itemBuilder: (BuildContext context) {
                  return {
                    'الإعدادات',
                    'الخروج',
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
          drawer: Drawer(
            backgroundColor: Colors.orange,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Text(
                    'My Password Manager',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const Divider(color: Colors.black,),
                ListTile(
                  leading: const Icon(Icons.settings),

                  title: const Text('الإعدادات',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsScreen()));
                  },
                ),
                const Divider(color: Colors.black,),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('معلومات عن التطبيق',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const InfoScreen()));
                  },
                ),
                const Divider(color: Colors.black,),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('الخروج',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  onTap: () {
                    // يمكنك استخدام SystemNavigator.pop() هنا
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),

          body: _buildPasswordList(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPasswordScreen()),

              ).then((_) {
                _loadPasswords(); // تحديث القائمة بعد الإضافة
              });
            },
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        ),
    );
  }

  Widget _buildPasswordList() {
    if (_passwords.isEmpty) {
      return const Center(child: Text('لا توجد كلمات مرور.'));
    }
    return ListView.builder(
      itemCount: _passwords.length,
      itemBuilder: (context, index) {
        final entry = _passwords[index];
        return ListTile(
          title: Text(entry.website),
          subtitle: Text('${entry.username}اسم المستخدم:  ',style: const TextStyle(fontWeight: FontWeight.bold),),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.orange,),
            onPressed: () async {
              await DatabaseHelper().deletePassword(entry.id!);
              _loadPasswords(); // تحديث القائمة بعد الحذف
            },
          ),
          onTap: () async {
            final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPasswordScreen(entry: entry)),);
            if(result==true){
              _loadPasswords();
            }
            },
        );
      },
    );
  }

  _navigateToPage(BuildContext context, String page) {
    switch (page) {
      case 'الإعدادات':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
      case 'الخروج':
        SystemNavigator.pop(); // للخروج من التطبيق
        break;
      default:
        break;
    }
  }
}


