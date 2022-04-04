import 'package:app1/aboutUsScreen/aboutUs.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';
import 'package:app1/contactUsScreen/contactUs.dart';
import 'package:app1/languageScreen/language.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'User Name',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: const Text(
              'example@gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1648830402~exp=1648831002~hmac=23bb5c012cffe2b975c10240fb7aa2f906cd61fc0e106b73ae52d85af1159554',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.white),
          ),
          ListTile(
            leading: const Icon(Icons.support_rounded),
            title: Text('${getLang(context, 'service')}'),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text('${getLang(context, 'language')}'),
            onTap: () {
              navigateTo(context, LanguageScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text('${getLang(context, 'contactUs')}'),
            onTap: () {
              navigateTo(context, ContactUsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text('${getLang(context, 'aboutUs')}'),
            onTap: () {
              navigateTo(context, AboutUsScreen());
            },
          ),
        ],
      ),
    );
  }
}
