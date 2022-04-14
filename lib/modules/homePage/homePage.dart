import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';

import 'package:app1/modules/drawer/drawer.dart';
import 'package:app1/modules/login/login.dart';
import 'package:app1/modules/register/registerCubit/registerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const Menu(),
          appBar: AppBar(
            title: Text('${getLang(context, 'home')}'),
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
