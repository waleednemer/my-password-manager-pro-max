import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SocialMediaPage extends StatelessWidget {
  final String facebookUrl = 'https://www.facebook.com/yourprofile'; // استبدل بالرابط الخاص بك
  final String instagramUrl = 'https://www.instagram.com/yourprofile';

  const SocialMediaPage({super.key}); // استبدل بالرابط الخاص بك

  void _shareLink(String link) {
    Share.share('تابعني على: $link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.blue,),
                  iconSize: 50,
                  onPressed: () {
                    _shareLink(facebookUrl); // مشاركة رابط فيسبوك
                  },
                  tooltip: 'مشاركة فيسبوك',
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: 50,
                  onPressed: () {
                    _shareLink(instagramUrl); // مشاركة رابط إنستغرام
                  },
                  tooltip: 'مشاركة إنستغرام',
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: 50,
                  onPressed: () {
                    _shareLink(instagramUrl); // مشاركة رابط إنستغرام
                  },
                  tooltip: 'مشاركة إنستغرام',
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: 50,
                  onPressed: () {
                    _shareLink(instagramUrl); // مشاركة رابط إنستغرام
                  },
                  tooltip: 'مشاركة إنستغرام',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
