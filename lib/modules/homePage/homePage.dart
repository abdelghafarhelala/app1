import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';

import 'package:app1/modules/drawer/drawer.dart';
import 'package:app1/modules/login/login.dart';
import 'package:app1/modules/myDrawer/myDrawer.dart';
import 'package:app1/modules/register/registerCubit/registerCubit.dart';
import 'package:app1/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MyDrawer(),
                    MyDrawer().myDrawerList(context),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('${getLang(context, 'home')}'),
            actions: [
              const Center(
                child: Text(
                  'Mode',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              FlutterSwitch(
                inactiveColor: Colors.white,
                inactiveToggleColor: Colors.grey,
                activeColor: primaryColor,
                activeText: 'Dark',
                height: 25,
                width: 50,
                activeTextColor: Colors.white,
                value: AppCubit.get(context).isDark,
                onToggle: (value) {
                  AppCubit.get(context).changeAppTheme();
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('${getLang(context, 'welcomeToHomePage')}')),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    onPress: () {
                      navigateTo(context, LoginScreen());
                    },
                    text: '${getLang(context, 'login')}'),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    onPress: () {
                      navigateTo(context, RegisterCubit());
                    },
                    text: '${getLang(context, 'register')}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
