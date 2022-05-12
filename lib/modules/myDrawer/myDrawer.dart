import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/components/components.dart';
import 'package:app1/modules/aboutUsScreen/aboutUs.dart';
import 'package:app1/modules/contactUsScreen/contactUs.dart';
import 'package:app1/modules/homePage/homePage.dart';
import 'package:app1/modules/languageScreen/language.dart';
import 'package:app1/modules/serviceScreen/serviceScreen.dart';
import 'package:app1/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_locale/app_locale.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: primaryColor,
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1648830402~exp=1648831002~hmac=23bb5c012cffe2b975c10240fb7aa2f906cd61fc0e106b73ae52d85af1159554'),
                    )),
              ),
              const Text(
                'User Name',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'example@gmail.com',
                style: TextStyle(color: Colors.grey[200], fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }

//Build Drawer List
  Widget myDrawerList(context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(
              context, Icons.home, '${getLang(context, 'home')}', HomePage()),
          menuItem(context, Icons.support_rounded,
              '${getLang(context, 'service')}', ServiceScreen()),
          menuItem2(context, Icons.language_outlined,
              '${getLang(context, 'language')}'),
          menuItem(context, Icons.phone, '${getLang(context, 'contactUs')}',
              ContactUsScreen()),
          menuItem(context, Icons.file_copy_outlined,
              '${getLang(context, 'aboutUs')}', AboutUsScreen()),
        ],
      ),
    );
  }

// Build menu of Drawer
  Widget menuItem(context, IconData icon, String text, Widget widget) {
    return Material(
      child: InkWell(
        onTap: () {
          navigateTo(context, widget);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(child: Icon(icon)),
              Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }

//Build menu2 of Drawer to language
  Widget menuItem2(
    context,
    IconData icon,
    String text,
  ) {
    return Material(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context, builder: (context) => buildDialog(context));
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(child: Icon(icon)),
              Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }

//Build Dialog of language

  Widget buildDialog(context) {
    return Dialog(
      insetAnimationCurve: Curves.linearToEaseOut,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${getLang(context, 'chooseYourLanguage')}',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      AppCubit.get(context).changeLang();
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                    child: Text('${getLang(context, 'arabic')}'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      AppCubit.get(context).changeLang();
                    },
                    color: primaryColor,
                    textColor: Colors.white,
                    child: Text('${getLang(context, 'english')}'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      navigateAndFinish(context, HomePage());
                    },
                    textColor: Colors.white,
                    color: primaryColor,
                    child: Text('${getLang(context, 'start')}'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
